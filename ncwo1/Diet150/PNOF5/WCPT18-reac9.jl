using DoNOF

mol = """
0 1
C	0.000000	0.759038	0.000000
H	-0.781174	1.509717	0.000000
C	1.280382	1.112661	0.000000
H	2.084515	0.388850	0.000000
H	1.555670	2.157995	0.000000
H	0.468551	-1.541748	0.000000
S	-0.688116	-0.859063	0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-reac9"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
