using DoNOF

mol = """
0 1
C	0.400536	0.981737	0.000000
H	1.439562	1.305672	0.000000
C	-0.140918	0.610512	1.236330
H	-1.222768	0.568193	1.337934
H	-0.024329	-0.774016	0.808303
H	0.390421	0.880481	2.139292
H	-0.024329	-0.774016	-0.808303
O	-0.140918	-1.709205	0.000000
H	0.688936	-2.197916	0.000000
C	-0.140918	0.610512	-1.236330
H	0.390421	0.880481	-2.139292
H	-1.222768	0.568193	-1.337934
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts6h2o"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
