from ..silego import Silego
from ..gpio import GPIO, Pin

__all__  = ['SLG46140', 'SLG46620V', 'SLG46621V']

class Greenpak4(Silego):
    family = 'ice40'

    def __init__(self, name, board):
        super(Silego,self).__init__(name, board)

    def QFN20(self):
        self.package = 'QFN20'
        for i in range(20):
            if   i == 1:
                Pin(self, 'VCC', i )
            elif i == 11:
                Pin(self, 'GND', i )
            else:
                GPIO(self, f'P{i}', i)

class SLG46140(Greenpak4):
    part = 'slg46140v'

class SLG46620V(Greenpak4):
    part = 'slg46620v'
    def __init__(self, name='slg46620v', board=None, package='qfn20'):
        assert package in ['qfn20']
        super(SLG46620V,self).__init__(name, board)
        if   package == 'qfn20':
            self.QFN20()

class SLG46621V(Greenpak4):
    part = 'slg46621v'
