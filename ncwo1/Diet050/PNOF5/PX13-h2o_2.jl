using DoNOF

mol = """
0 1
O 0.000756 1.523252 0.000000
H -0.086365 0.557493 0.000000
H -0.898788 1.860643 0.000000
O 0.000756 -1.396126 0.000000
H 0.486527 -1.717573 0.766199
H 0.486527 -1.717573 -0.766199
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PX13-h2o_2"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
