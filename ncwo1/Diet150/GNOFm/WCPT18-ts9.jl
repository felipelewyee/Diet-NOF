using DoNOF

mol = """
0 1
C	0.468987	0.636874	0.053256
H	0.585413	1.716908	0.037321
C	1.515535	-0.285885	-0.030947
H	1.542575	-1.062299	0.729004
H	0.301002	-1.075601	-0.411970
H	2.498769	-0.002264	-0.395534
S	-1.052181	-0.105168	-0.005792
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts9"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
