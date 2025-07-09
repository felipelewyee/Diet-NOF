using DoNOF

mol = """
0 1
N 2.962583 -0.202885 0.000000
H 3.324416 0.277473 0.813414
H 3.324416 0.277473 -0.813414
H 3.358772 -1.133640 0.000000
P 0.000000 0.259570 0.000000
H 0.247605 -0.660083 -1.041782
H 0.247605 -0.660083 1.041782
C -1.784996 -0.008789 0.000000
N -2.932988 -0.074536 0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-21"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
