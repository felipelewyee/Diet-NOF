using DoNOF

mol = """
1 1
C         -0.64862       -1.24729       -0.61888
N          0.09135       -0.09369       -0.01627
C         -0.51707        1.28645       -0.27173
C         -1.68684        1.56341        0.66853
H          0.15467       -0.19268        1.00758
H          1.06119       -0.06139       -0.36153
H         -0.66110       -1.14624       -1.70876
H         -0.14151       -2.17439       -0.33390
H         -1.67164       -1.26005       -0.23512
H         -2.07829        2.56716        0.46377
H         -2.51257        0.85221        0.53433
H         -1.34599        1.53686        1.70990
H         -0.80214        1.32460       -1.33017
H          0.29538        1.99510       -0.08253
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "IL16-214A"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
