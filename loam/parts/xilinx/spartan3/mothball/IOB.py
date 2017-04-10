from magma.compatibility import IntegerTypes
__all__ = ['In', 'Out']

class In(ModuleInst):

    """Input pin."""

    def __init__(self, PIN, **kwargs):
        if isinstance(PIN, IntegerTypes):
            PIN = "P" + str(PIN)

        self.inst = inst("IBUF", PIN, **kwargs)

        self.setcfg("IOATTRBOX", "LVTTL")
        self.setcfg("IDELMUX", "1")
        self.setcfg("IMUX", "1")

        self.O = self.inst.I
        self.I = None


class Out(ModuleInst):

    """Output pin."""

    def __init__(self, PIN, Z=None, **kwargs):
        if isinstance(PIN, IntegerTypes):
            PIN = "P" + str(PIN)

        self.inst = inst("IOB", PIN, **kwargs)

        self.setcfg("IOATTRBOX", "LVTTL")
        self.setcfg("DRIVEATTRBOX", "8")
        self.setcfg("SLEW", "SLOW")
        self.setcfg("O1INV", "O1")
        self.setcfg("OMUX", "O1")

        if Z:
            self.setcfg("T1INV", "T1")
            self.setcfg("TMUX", "T1")

        if Z:
            self.I = [self.inst.O1, self.inst.T1]
        else:
            self.I = self.inst.O1

        self.O = None
