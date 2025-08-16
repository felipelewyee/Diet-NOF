using DoNOF

mol = """
0 1
C	0.000000	0.000000	0.489758
H	0.000000	0.000000	1.576776
H	0.000000	0.000000	-1.018930
O	0.000000	1.047477	-0.218525
O	0.000000	-1.047477	-0.218525
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts1"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
