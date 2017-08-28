"""
This file templates a bunch of benchmarks
"""
import csv
import subprocess
import math

from jinja2 import Environment, FileSystemLoader


vector_registers = {'q0', 'q1', 'q2', 'q3', 'q4', 'q5'}
normal_registers = {'x0', 'x1', 'x2', 'x3', 'x4', 'x5',
                    'x6', 'x7', 'x9', 'x10'}

return_register = "x0"

template_env = Environment(loader=FileSystemLoader('benchmarks'))


def vector_value_register(register, type):
    """Convert x0 to v0.16b

    Expects x0 .. x31"""
    if type == 'vector128':
        return f"v{register[1:]}.16b"
    if type == 'vector64':
        return f"v{register[1:]}.8b"
    else:
        return register


template_env.filters['vectorreg'] = vector_value_register


class Function:
    def __init__(self):
        self.vector_registers = {'q0', 'q1', 'q2', 'q3', 'q4', 'q5'}
        self.normal_registers = {'x0', 'x1', 'x2', 'x3', 'x4', 'x5',
                                 'x6', 'x7', 'x9', 'x10'}
        self.extra_template_vars = {}

    @property
    def code(self):
        """Fetch the code for this benchmark"""
        template_vars = {
            'function_name': self.name,
            'register_clock_before': self.normal_registers.pop(),
            'register_clock_after': self.normal_registers.pop(),
            'return_register': 'x0',
        }
        template_vars.update(self.extra_template_vars)
        template = template_env.get_template(self.template)
        return template.render(template_vars)

    def process_result(self, result):
        raise NotImplementedError()

    def get_results(self):
        """
        Get a list of results as name, value pairs
        """
        return [(self.name, self.result)]

    def __str__(self):
        """Return the code"""
        return self.code


class Empty(Function):
    def __init__(self):
        super().__init__()
        self.name = "empty"
        self.template = "empty.s.j2"

    def process_result(self, result):
        """Processes the result value

            :param: result The result dictionary parsed from csv
        """
        self.result = int(result[self.name])


class InstructionExecutionTime(Function):
    def __init__(self, instruction, type='normal'):
        super().__init__()
        self.name = f"execution_time_{instruction}_{type}"
        self.template = "execution.s.j2"
        self.type = type
        if type == 'normal':
            regs = self.normal_registers
        elif type in ('vector128', 'vector64'):
            regs = self.vector_registers
        else:
            raise ValueError("type should be either normal or vector")
        self.extra_template_vars['type'] = type
        self.extra_template_vars['instruction'] = instruction
        self.extra_template_vars['r0'] = regs.pop()
        self.extra_template_vars['r1'] = regs.pop()
        self.extra_template_vars['r2'] = regs.pop()
        self.extra_template_vars['r3'] = regs.pop()

    def process_result(self, result):
        """Processes the result value

            :param: result The result dictionary parsed from csv
        """
        self.result = (int(result[self.name]) - int(result['empty'])) / 20


class InstructionResultLatency(InstructionExecutionTime):
    def __init__(self, instruction, type):
        super().__init__(instruction, type)
        self.parent_name = self.name
        self.name += "_latency"
        self.extra_template_vars['r1'] = self.extra_template_vars['r0']
        self.extra_template_vars['r2'] = self.extra_template_vars['r0']
        self.extra_template_vars['r3'] = self.extra_template_vars['r0']

    def process_result(self, result):
        self.result = math.ceil((int(result[self.name]) -
                                 int(result[self.parent_name])) / 20)


class Benchmark:

    def __init__(self):
        self.measurements = []

    def add(self, benchmark):
        self.measurements.append(benchmark)

    def _write(self):
        benchcode = '\n\n'.join(map(str, self.measurements)) + '\n'
        with open('benches.s', 'w') as f:
            f.write(benchcode)

        # load main.c template
        with open('main.c.j2', 'r') as f:
            main_template = template_env.from_string(f.read())

        with open('main.c', 'w') as f:
            f.write(main_template.render({
                'functions': [m.name for m in self.measurements],
            }))

    def _compile(self):
        """Compile the benchmarking programs"""
        subprocess.check_output(['make', 'bench'])

    def _run(self):
        """Run the benchmarking program and collect the results"""
        output = subprocess.check_output(['./bench']).decode().strip()
        self.results = {}
        for k, v in csv.reader(output.split('\n')):
            self.results[k] = v

    def run(self):
        self._write()
        self._compile()
        self._run()
        self.results_strings = []
        for m in self.measurements:
            m.process_result(self.results)
            for n, r in m.get_results():
                s = "{name}: {result}".format(name=n, result=r)
                self.results_strings.append(s)

        print('\n'.join(self.results_strings))


if __name__ == "__main__":
    benchmark = Benchmark()
    benchmark.add(Empty())
    instructions = ['eor', 'and', 'orr', 'add', 'sub']
    for type in ('normal', 'vector128', 'vector64'):
        for instruction in instructions:
            benchmark.add(InstructionExecutionTime(instruction, type=type))
        for instruction in instructions:
            benchmark.add(InstructionResultLatency(instruction, type=type))

    benchmark.run()
