from magma import In, Bit
from loam import Part

#
# Papilio Audio Interface
#
#   4.7nF 3.3k = 10,261 Khz low-pass filter
#
class Audio(Part):
    IO = ["I", In(Bit)]

    def __init__(self, board):
        Part.__init__(self, board, 'AUDIO')

    def on(self):
        self.I.trace().inst.on()

        Part.on(self)
        return self
