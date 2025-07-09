using DoNOF

mol = """
0 1
o         -0.393647332292    0.000464066169    0.000000000000
h          0.197712208696    0.756283351463    0.000000000000
h          0.195935123596   -0.756747417685    0.000000000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-08B"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
