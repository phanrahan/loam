from magma import Circuit

class Primitive(Circuit):

    """A primitive on an FPGA."""

    def __init__(self, fpga, name):
        self.name = name
        self.params = {}
        self.used = False
        self.fpga = fpga
        self.fpga.primitives.append(self)

    def getparam(self, key):
        return self.params.get(key, None)

    def setparam(self, key, val):
        # See original magma/design.py
        self.params[key] = val

    def rename(self, name):
        self.name = name
        return self

    def xdl(self):
        """ Generate parameter string for the Primitive."""
        s = ""
        for k in sorted(cfg.keys):
            s += k + '::' + cfg[k] + ' '
        return s
