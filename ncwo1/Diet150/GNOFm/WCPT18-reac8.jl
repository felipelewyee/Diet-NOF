using DoNOF

mol = """
0 1
C	0.000000	0.767849	0.000000
H	-0.822901	1.486989	0.000000
H	1.367800	2.070612	0.000000
H	0.602469	-1.464838	0.000000
N	1.228728	1.061969	0.000000
S	-0.609279	-0.883352	0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-reac8"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
