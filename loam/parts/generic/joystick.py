from magma import Bit, Out
from loam import Part

class Joystick(Part):
    name = 'joystick'

    IO = ["SELECT", Out(Bit),
          "UP",     Out(Bit),
          "DOWN",   Out(Bit),
          "LEFT",   Out(Bit),
          "RIGHT",  Out(Bit)]

    def __init__(self, name='Joystick', board=None):
        super(Joystick, self).__init__(name, board)

        self.select = True
        self.up = False
        self.down = False
        self.left = False
        self.right = False

        self.debounce = False

    def init(self, select=None, up=None, down=None, left=None, right=None,
             debounce=None):

        if select is not None:
            self.select = select
        if up is not None:
            self.up = up
        if down is not None:
            self.down = down
        if left is not None:
            self.left = left
        if right is not None:
            self.right = right
        if debounce is not None:
            self.debounce = debounce
        return self

    def on(self):

        if self.select:
            gpio = self.SELECT.getgpio()
            gpio.input().on()
        if self.up:
            gpio = self.UP.getgpio()
            gpio.input().on()
        if self.down:
            gpio = self.DOWN.getgpio()
            gpio.input().on()
        if self.left:
            gpio = self.LEFT.getgpio()
            gpio.input().on()
        if self.right:
            gpio = self.RIGHT.getgpio()
            gpio.input().on()

        Part.on(self)
        return self

    # need to turn on parts ...
    def setup(self, main):
        return

        if self.debounce:
            slow = Counter(16)
            if hasattr(main, 'SELECT'):
                main.SELECT = falling(debounce(main.SELECT, slow.COUT))
            if hasattr(main, 'UP'):
                main.UP = falling(debounce(main.UP, slow.COUT))
            if hasattr(main, 'DOWN'):
                main.DOWN = falling(debounce(main.DOWN, slow.COUT))
            if hasattr(main, 'LEFT'):
                main.LEFT = falling(debounce(main.LEFT, slow.COUT))
            if hasattr(main, 'RIGHT'):
                main.RIGHT = falling(debounce(main.RIGHT, slow.COUT))
