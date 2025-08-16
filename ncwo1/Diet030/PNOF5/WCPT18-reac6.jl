using DoNOF

mol = """
0 1
C	0.000000	0.471708	0.000000
H	-0.276412	1.522311	0.000000
C	-1.134329	-0.504429	0.000000
H	-0.776700	-1.534190	0.000000
H	-1.772470	-0.363824	0.876336
H	-1.772470	-0.363824	-0.876336
C	1.287947	0.151466	0.000000
H	2.060505	0.908567	0.000000
H	1.615839	-0.881516	0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-reac6"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
