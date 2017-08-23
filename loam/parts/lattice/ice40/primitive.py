from magma import Circuit

class Primitive(Circuit):

    """A primitive on an FPGA."""

    def __init__(self, fpga, name):
        self.name = name
        self.fpga = fpga
        self.fpga.primitives.append(self)

        self.off()

