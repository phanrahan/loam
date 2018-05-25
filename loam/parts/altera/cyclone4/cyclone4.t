from magma import *
from mantle import *
from loam import FPGA

from ..gpio import GPIO, Pin, Clock
from ..clock import Clock as ClockPeripheral

class Cyclone(FPGA):
    vendor = 'altera'

    def __init__(self, name, board, speed):
        super(Cyclone,self).__init__(name, board)
        self.speed = speed

    def qsf(self, name):
        s = '''
set_global_assignment -name LAST_QUARTUS_VERSION 16.0.0

set_global_assignment -name TOP_LEVEL_ENTITY "main"

set_global_assignment -name VERILOG_FILE %s.v

set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files

set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE22F17C6
#set_global_assignment -name DEVICE_FILTER_PACKAGE FPGA
#set_global_assignment -name DEVICE_FILTER_PIN_COUNT 256
set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 6

# Classic Timing Assignments
# ==========================
#set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
#set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
#set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 1.2V

# Fitter Assignments
# ==================
#set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1

set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

''' % name

        for g in self.pins:
            if g.used:
                s += g.qsf() + '\n'

        return s

class Cyclone4E(Cyclone):
    family = 'cyclone4e'

    def __init__(self, name, board, speed):
        super(Cyclone4E,self).__init__(name, board, speed)
        self.clock = ClockPeripheral(self)

    def LBGA256(self):
        self.package = 'lbga256'

% for p in pins:
%   if p.gpio:
        GPIO(self, "${p.name}")
%   elif p.clock:
        Clock(self, "${p.name}")
%   endif
% endfor

class EP4CE22F17C6(Cyclone4E):
    part = 'EP4CE22F17C6'

    def __init__(self, name='', board=None, package='lbga256', speed='6'):
        assert package in ['lbga256']
        super(EP4CE22F17C6,self).__init__(name, board, speed)
        if package == 'lbga256':
            self.LBGA256()

if __name__ == "__main__":
    fpga = EP4CE22F17C6()
