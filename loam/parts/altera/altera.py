from magma.compile import write_file
from loam import FPGA

class Altera(FPGA):
    vendor = 'altera'

    def constraints(self, filename):
        write_file(filename, 'qsf', self.qsf(filename))

    def qsf(self, filename):
        name = filename.split('/')[-1]
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
