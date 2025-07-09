using DoNOF

mol = """
0 1
P    -0.0993640   -1.5147676    0.0000000 
H    -1.0636157   -1.4120976    1.0344567 
H    -1.0636157   -1.4120976   -1.0344567 
O     0.0993640   -3.1671101    0.0000000 
H     1.0311267   -3.3832930    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-7b"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
