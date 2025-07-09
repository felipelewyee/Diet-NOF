using DoNOF

mol = """
0 1
O 0.000000 1.098108 0.000000
H 0.000000 0.000000 0.596495
H 0.000000 0.000000 -0.596495
O 0.000000 -1.098108 0.000000
H 0.867311 1.517487 0.000000
H -0.867311 -1.517487 0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PX13-h2o_2_ts"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
