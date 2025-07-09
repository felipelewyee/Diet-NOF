using DoNOF

mol = """
0 1
C	0.000000	0.795941	0.000000
H	-0.540816	1.737347	0.000000
H	1.895243	1.494019	0.000000
H	0.964887	-0.685634	0.000000
N	1.289621	0.676359	0.000000
S	-0.709166	-0.753493	0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts8"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
