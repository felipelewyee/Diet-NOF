using DoNOF

mol = """
0 1
 C -1.397008 -0.04895 0.48578
 H -1.586351 0.704003 1.251552
 O -2.682405 -0.42403 -0.004304
 C -0.508624 0.529414 -0.608179
 H -0.310133 -0.246312 -1.351055
 H -1.06367 1.324296 -1.108944
 C 0.820427 1.081849 -0.087554
 H 0.635153 1.876862 0.641125
 H 1.363702 1.544963 -0.916412
 H -2.547897 -1.135172 -0.636611
 H -0.909796 -0.900188 0.968367
 C 1.719687 0.035068 0.564858
 H 2.660852 0.498949 0.874434
 H 1.252176 -0.374478 1.45833
 O 1.964141 -1.089096 -0.278454
 H 2.445186 -0.772201 -1.048154
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B39"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
