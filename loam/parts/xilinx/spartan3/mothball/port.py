class Port():

    """A wrapper for a pin on an L{Inst}."""

    def __init__(self, inst, port, dir):
        """
        @param inst: The Inst where the pin is located.
        @type inst: L{Inst}
        @param port: The name of the pin.
        @type port: String
        @param dir: The direction of the pin. Must be either 'input' or
            'output'.
        @type String
        """
        self.inst = inst
        self.port = port
        self.dir = dir

    def __str__(self):
        """Get a string representation of the Port."""
        if self.inst.name:
            name = self.inst.name
        else:
            primname = self.inst.prim.name if self.inst.prim else 'wire'
            name = primname + str(self.inst.site)
        return '%s %s %s' % (name, self.port, self.dir)

    def __repr__(self):
        """Get a string representation of the Port."""
        return self.__str__()

    def __hash__(self):
        """Get a hash of the string representation of the Port."""
        return hash(str(self))

    def __eq__(self, rhs):
        """
        Check to see if a Port is equal to another Port.

        @param rhs: The other Port for which to check equality.
        @type rhs: L{Port}

        @return: True if the Insts and the pin names of the two Ports match.
        @rtype: Boolean
        """
        return self.inst is rhs.inst and self.port == rhs.port

    # def __le__(self, port):
    #    if self.dir != 'input':
    # print('#Warning: assigning to an input', file=sys.stderr)
    #    wire(port,self)

    # def __ge__(self, port):
    #    if self.dir != 'output':
    # print('#Warning: assigning from an input', file=sys.stderr)
    #    wire(self,port)

    def xdl(self):
        """
        Get a string representation of the Port for use with an XDL net.

        @return: The XDL string representation of the Port (e.g. '"inst55" G1').
        @rtype: String
        """
        return '"%s" %s' % (self.inst.name, self.port)

