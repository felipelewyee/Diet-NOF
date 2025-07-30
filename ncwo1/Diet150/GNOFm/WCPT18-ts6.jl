using DoNOF

mol = """
0 1
C	0.057227	-0.404548	0.000000
H	0.094881	-1.490374	0.000000
C	0.057227	0.193471	1.290465
H	0.016071	1.265997	1.410672
H	-1.068272	-0.071437	0.000000
H	-0.044418	-0.432272	2.160920
C	0.057227	0.193471	-1.290465
H	-0.044418	-0.432272	-2.160920
H	0.016071	1.265997	-1.410672
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts6"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
