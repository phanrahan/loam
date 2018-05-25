"""Contains classes related to FPGA designs."""

import sys
from collections import Sequence
from sexpr import parse, input
from site import make_site, GridSite, Site

__all__ = ['FPGA', 'Primitive']

class Device:

    """An FPGA device described by an XDLRC file."""

    def __init__(self, name):
        """
        @param name: The filename of the device's XDLRC file.
        @type name: String
        """
        # primitives[primname]
        self.primitives = {}

        # (primname, tilename) = sites[sitename]
        self.sites = {}

        # {tilename: ..., sitenames: [...]} = tiles[x][y]
        self.tiles = None

        self.vendor = 'xilinx'
        self.parse(name)

    def __getattr__(self, name):
        """
        Look up a primitive on the device.

        @param name: A name of a primitive.
        @type name: String

        @return: The L{Primitive}, or None if it does not exist.
        @rtype: L{Primitive} or None

        @raise AttributeError: If L{name} starts with '__'
        """
        if name[0:2] == '__':
            raise AttributeError, name  # <<< DON'T FORGET THIS LINE !!
        return self.primitives.get(name, None)

    def __str__(self):
        """
        @return: The full name of the device (e.g. 'xc3s250evq100-5').
        @rtype: String
        """
        return self.part

    def getprim(self, name, site=None):
        """
        @param name: A name of a primitive.
        @type name: String
        @param site: An optional L{Site} where the primitive will be placed.
        @type site: L{Site}

        @return: A tuple of (name, L{Primitive}) where name is the same as the
            L{name} input parameter, unless the requested primitive is of type
            SLICE and a real L{Site} was provided for the site input
            parameter, in which case name is the primitive's full SLICE type
            (e.g. SLICEL, SLICEM, SLICEX, etc.).
        @rtype: (String, L{Primitive})

        @raise AttributeError: If L{name}'s SLICE type does not match the
            SLICE type of the provided site input parameter.
        """
        site = make_site(site)
        if site.placed and name.startswith('SLICE'):
            x = site.x()
            if self.family == 'spartan6' or self.family == 'kintex7':
                x = x % 4
                if x == 0:
                    name = 'SLICEM'
                elif x == 2:
                    if name == 'SLICEM':
                        raise AttributeError, 'Placing SLICEM at SLICEL'
                    name = 'SLICEL'
                else:
                    if name == 'SLICEM':
                        raise AttributeError, 'Placing SLICEM at SLICEX'
                    if name == 'SLICEL':
                        raise AttributeError, 'Placing SLICEL at SLICEX'
                    name = 'SLICEX'
            elif self.family == 'spartan3':
                x = x % 2
                if x == 0:
                    name = 'SLICEM'
                else:
                    if name == 'SLICEM':
                        raise AttributeError, 'Placing SLICEM at SLICEL'
                    name = 'SLICEL'

        return name, self.primitives[name]

    def parse(self, name):
        """
        Parse an XDLRC file.

        @param name: The filename of the XDLRC file (.xdlrc suffix is optional).
        @type name: String
        """

        SUFFIX = '.xdlrc'
        if not name.endswith(SUFFIX):
            name += SUFFIX

        file = open(name)

        # remove comment lines
        source = ""
        for line in file.readlines():
            if line[0] != '#':
                source += line

        input(source)
        s = parse()
        self.parsedevice(s[0])

    def parsedevice(self, s):

        def parseprims(prims):

            def parseprim(prim):

                def parseprimelem(elem, primitive):
                    elemname = elem[1]
                    npins = int(elem[2])

                    base = 3
                    if elem[3] == '#' and elem[4] == 'BEL':
                        base = 5

                    if base + npins < len(elem):
                        cfg = elem[base + npins]
                        if cfg[0] == 'cfg':
                            # print('adding cfg', primitive.name, elemname,)
                            # cfg[1:]
                            primitive.addcfg(elemname, cfg[1:])

                primname = prim[1]
                npins = int(prim[2])
                nelements = int(prim[3])

                primitive = PrimitiveDecl(primname)
                self.primitives[primname] = primitive

                j = 4
                n = 4 + npins
                for i in range(j, n):
                    pin = prim[i]
                    if len(pin) > 0:
                        if pin[0] == 'pin':
                            pinname = pin[1]
                            pindirection = pin[3]
                            if pindirection == "input":
                                primitive.addinput(pinname)
                            if pindirection == 'output':
                                primitive.addoutput(pinname)

                j = n
                n = n + nelements
                for i in range(j, n):
                    parseprimelem(prim[i], primitive)

            for i in range(2, len(prims)):
                parseprim(prims[i])

        def parsetiles(tiles):

            def parsetile(tile):

                def parsesite(site, tilename):
                    sitename = site[1]
                    primname = site[2]
                    self.sites[sitename] = (primname, tilename)
                    return sitename

                y = int(tile[1])
                x = int(tile[2])
                tilename = tile[3]

                self.tiles[x][y] = {'tilename': tilename, 'sitenames': []}

                for i in range(6, len(tile)):
                    sitename = parsesite(tile[i], tilename)
                    self.tiles[x][y]['sitenames'].append(sitename)

            # print("tiles", tiles[1], tiles[2])
            ny = int(tiles[1])
            nx = int(tiles[2])

            self.nx = nx
            self.ny = ny

            self.tiles = range(nx)
            for x in range(nx):
                self.tiles[x] = range(ny)

            for i in range(3, len(tiles)):
                parsetile(tiles[i])

        name = s[2]
        self.part = name
        # find package
        if name.find('vq') != -1:
            self.fpga = name[0:name.index('vq')]
            self.package = name[name.index('vq'):name.index('-')]
        elif name.find('tq') != -1:
            self.fpga = name[0:name.index('tq')]
            self.package = name[name.index('tq'):name.index('-')]
        elif name.find('cl') != -1:
            self.fpga = name[0:name.index('cl')]
            self.package = name[name.index('cl'):name.index('-')]
        elif name.find('ftg') != -1:
            self.fpga = name[0:name.index('ftg')]
            self.package = name[name.index('ftg'):name.index('-')]
        else:
            return

        self.speed = name[name.index('-') + 1:]
        self.family = s[3]

        # print(self.part, self.family, self.device, self.package,)
        # self.speed

        for i in range(4, len(s)):
            t = s[i]
            if(len(t) > 0):
                if t[0] == 'tiles':
                    parsetiles(t)
                if t[0] == 'primitive_defs':
                    parseprims(t)


class PrimitiveDecl:

    """An FPGA device primitive."""

    def __init__(self, name=None):
        """
        @param name: The name of the primitive.
        @type name: String
        """
        self.name = name

        self.cfg = {}
        self.inputs = []
        self.outputs = []

    def __str__(self):
        """
        @return: The name of the primitive.
        @rtype: String
        """
        return self.name

    def __getattr__(self, name):
        """
        Lookup a pin on the primitive.

        @param name: The name of the pin.
        @type name: String

        @return: The result of self.L{getpin}(name).
        @rtype: (L{Primitive}, String, String) or None

        @raise AttributeError: If L{name} starts with '__'
        """
        if name[0:2] == '__':
            raise AttributeError, name  # <<< DON'T FORGET THIS LINE !!

        return self.getpin(name)

    def getpin(self, name):
        """
        Lookup a pin on the primitive.

        @param name: The name of the pin.
        @type name: String

        @return: A tuple containing this L{Primitive}, the provided L{name} of
            the pin, and 'input' or 'output' to describe the nature of the pin;
            or None if L{name} is neither an input nor output pin on the
            primitive.
        @rtype: (L{Primitive}, String, String) or None

        @raise AttributeError: If L{name} starts with '__'
        """
        if name in self.inputs:
            return (self, name, 'input')
        if name in self.outputs:
            return (self, name, 'output')

        print("Error:", name, 'is not an input or an output pin')
        return None

    def addinput(self, pin):
        """
        Add an input to the primitive.

        @param pin: The name of the pin to add.
        @type pin: String
        """
        if pin in self.inputs:
            print('Error:', self.name, 'already contains', pin, 'input')
            return
        self.inputs.append(pin)

    def addoutput(self, pin):
        """
        Add an output to the primitive.

        @param pin: The name of the pin to add.
        @type pin: String
        """
        if pin in self.inputs:
            print('Warning:', self.name, 'already contains', pin, 'output')
            return
        self.outputs.append(pin)

    def addcfg(self, key, vals):
        """
        Add a cfg (key, values) pair to the primitive, or add additional
        values if the cfg key has been previously added.

        @param key: The key to add.
        @type key: String
        @param vals: The value(s) to add for the L{key}.
        @type vals: [String]
        """
        if key not in self.cfg:
            self.cfg[key] = []
        self.cfg[key] += vals



class FPGA:

    """A design for a single FPGA."""

    def __init__(self, device):
        """
        @param device: A device object for the target FPGA.
        @type device: L{Device}
        """
        self.device = device

        self.sites = {}
        self.insts = []

        # Power and Ground
        gnd = inst(None, make_site(None), name="GND")
        self.GND = Port(gnd, "gnd", "output")

        vcc = inst(None, make_site(None), name="VCC")
        self.VCC = Port(vcc, "vcc", "output")

    def place(self, inst):
        """
        Add an instance of a Xilinx primitive to the design.

        @param inst: An instance of a Xilinx primitive to add to the design.
        @type inst: L{Inst}
        """
        if inst.site:
            sitename = self.getsitename(inst.primname, inst.site)
            if sitename is not None:
                self.sites[sitename] = inst

        self.insts.append(inst)

    def getsitename(self, primname, site):
        """
        Get the string representation of a primitive site for use with an XDL
        instance.

        @param primname: The primitive type, e.g. 'SLICEL', 'RAMB16', etc.
        @type primname: string
        @param site: The site location of the primitive.
        @type site: L{Site}

        @return: The primitive site's string representation, e.g. 'SLICE_X0Y0'.
        @rtype: String, or None if the provided site is not placed.
        """
        if site.placed:
            if isinstance(site, GridSite):
                basename = primname
                if primname == 'SLICEX' or \
                   primname == 'SLICEL' or \
                   primname == 'SLICEM':
                    basename = 'SLICE'
                elif primname == 'MULT18X18SIO':
                    basename = 'MULT18X18'
                elif primname == 'DSP48A1':
                    basename = 'DSP48'
                elif primname == 'BUFG':
                    if get_curLib() == "kintex7":
                        basename = 'BUFGCTRL'
                    else:
                        basename = 'BUFGMUX'
                elif primname == 'RAMB16BWER':
                    basename = 'RAMB16'
                elif primname == 'OLOGIC2':
                    basename = 'OLOGIC'
                return "%s%s" % (basename, site)
            else:
                return str(site)
        else:
            return None

    def net(self, file, inpins):
        """
        Output a string representation of a list of 'inpins' (the output pins
        of a net) to an XDL file.

        @param file: An XDL file object.
        @type file: L{file}
        @param inpins: A list of 'inpin' ports.
        @type inpins: [L{Port}]
        """
        for inpin in inpins:
            if inpin.inst.prim is None:
                for port, inputs in inpin.inst.outputs.items():
                    # key is a Port
                    if port.dir == 'output':
                        self.net(file, inputs)
            else:
                print('  inpin',  inpin.xdl(),  ',', file=file)

    def xdl(self, file):
        """
        Output the design to an XDL file.

        @param file: An XDL file object.
        @type file: L{file}
        """
        if self.device.fullname.startswith('xc3'):
            name = '"spartan3"'
        elif self.device.fullname.startswith('xc6'):
            name = '"spartan6"'
        else:
            name = '"unknown"'

        print("# created using pyfpga, pat hanrahan", file=file)
        print('design', name, self.device.fullname, 'v3.2', ',', file=file)
        if get_curLib() == "kintex7":
            print('  cfg "_DESIGN_PROP::P3_PLACED:"; ', file=file)
        else:
            print('  cfg " "; ', file=file)
        print(file=file)

        # name insts
        for i in range(len(self.insts)):
            inst = self.insts[i]
            if not inst.name:
                inst.name = 'inst%d' % i

        # output insts
        for inst in self.insts:
            # skip wires like VCC and GND
            if inst.prim is not None:
                inst.xdl(file)

        # output nets
        for inst in self.insts:
            # skip wires (but not VCC and GND)
            if inst.prim is None:
                if inst.name != 'VCC' and inst.name != 'GND':
                    continue
            for outpin, v in inst.outputs.items():
                wirename = inst.name + '/' + outpin.port
                if outpin.port == 'gnd':
                    print('net "' + wirename + '" gnd ,', file=file)
                elif outpin.port == 'vcc':
                    print('net "' + wirename + '" vcc ,', file=file)
                else:
                    print('net "' + wirename + '" ,', file=file)
                    print('  outpin', outpin.xdl(), ',', file=file)
                self.net(file, v)
                print(';', file=file)
                print(file=file)

    def pcf(self, file):
        """
        Output the physical constraints of the design to a PCF file.

        @param file: A PCF file object.
        @type file: L{file}
        """
        for inst in self.insts:
            # skip wires
            if inst.prim is not None:
                inst.pcf(file)

class Primitive:

    """An instance of a hardware primitive."""

    def __init__(self, part, primtypename, primname, site, **kwargs):
        """
        @param part: The fpga containing this primitive instance
        @type part: FPGA
        @param primtypename: The name of the primitive type (e.g. 'SLICEL').
        @type primtypename: String
        @param primname: The name of the primitive 
        @type name: String
        @param site: The site location of the primitive.
        @type site: L{Site}
        """

        self.part = part

        if primtypename and not site:
            print('#Warning:', primtypename, 'not placed', file=sys.stderr)

        self.name = primname

        self.site = site
        if self.site:
            self.site.inst = self

        self.setprim(primtypename, site)

        # wires
        self.inputs = {}
        self.outputs = {}

        # config
        self.cfg = {}

    def __getattr__(self, name):
        """
        Lookup a pin on the Inst.

        @param name: The name of the pin.
        @type name: String

        @return: The result of self.L{getpin}(name).
        @rtype: L{Port}

        @raise AttributeError: If L{name} starts with '__'
        """
        if name[0:2] == '__':
            raise AttributeError, name  # <<< DON'T FORGET THIS LINE !!

        return self.getpin(name)

    def getpin(self, name):
        """
        Lookup a pin on the Inst.

        @param name: The name of the pin.
        @type name: String

        @return: A Port object for the pin.
        @rtype: L{Port}
        """
        t = self.prim.getpin(name)
        return Port(self, t[1], t[2])

    def getsite(self):
        """
        Retrieve information about the Inst's site.

        @return: A 3-tuple containing the site's primitive name (e.g. 'SLICEL'),
            a string representation of the site (e.g. 'SLICE_X0Y0'), and a
            string representation of the tile where the site is located
            (e.g. 'CLB_X1Y1').
        @rtype: (String, String, String), or (String, None, None) if the Inst's
            site is not placed.
        """
        sitename = self.part.getsitename(self.primname, self.site)
        if sitename is None:
            return (self.primname, None, None)
        else:
            siteprimname, tilename = self.part.device.sites[sitename]
            return (self.primname, sitename, tilename)

    def setprim(self, primname, site=None):
        """
        Set the L{Primitive} of the Inst.

        @param primname: The primitive type (e.g. 'SLICEL').
        @type primname: String
        @param site: An optional site location for the primitive (uses
            self.site if None)
        @type site: L{Site} or None
        """
        # Lookup prim so that we can call getpin
        if primname:
            if site is None:
                site = self.site
            self.primname, self.prim = self.part.device.getprim(primname, site)
        else:
            # None needed for VCC, GND and Wire
            self.primname = None
            self.prim = None

def inst(primname, site, **kwargs):
    """
    Convenience function for looking up an XDL Inst, or creating it if it does
    not exist.

    @param primname: The type of the Inst's primitive (e.g. 'SLICEL').
    @type primname: String
    @param site: The site of the Inst.
    @type site: L{Site} or None

    @keyword name: The name of the site.
    @type name: String

    @return: The existing Inst for the provided information, or a new Inst if
        none existed before.
    @rtype: L{Inst}
    """
    #site = make_site(site)
    # print(site)
    #if site.placed:
    #    sitename = curDesign.getsitename(primname, site)
    #    if sitename in curDesign.sites:
    #        i = curDesign.sites[sitename]
    #        # Lend provided name to this site's inst, if available
    #        if 'name' in kwargs:
    #            i.name = kwargs['name']
    #        return i
    #elif site.inst:
    #    return site.inst

    #i = Inst(primname, site, **kwargs)
    #curDesign.addinst(i)
    #return i
    pass

if __name__ == '__main__':
    import sys
    name = 'xc3s250e.xdlrc'
    if len(sys.argv) == 2:
        name = sys.argv[1]

    device = Device(name)
    print(device.vendor, device.part, device.family, device.fpga, device.package, device.speed)
    for key in device.primitives.keys():
        print(key)
