import magma as m
from loam.boards.de0nano import DE0Nano

nano = DE0Nano()
nano.B1.on()
nano.B2.on()
nano.D1.on()

main = nano.main()

Add = m.DefineCircuit('Add',
           'A', m.In(m.Bit), 'B', m.In(m.Bit), 'C', m.Out(m.Bit))
Add.verilog = 'C = A ^ B;'
m.EndCircuit()

add = Add()
add(main.B1, main.B2)
m.wire(add.C, main.D1)


