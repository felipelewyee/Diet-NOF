using DoNOF

mol = """
0 1
N 0.054981 -2.125600 0.000000
P 0.054981 1.199491 0.000000
H -0.486227 -2.979761 0.000000
H -0.385796 2.549904 0.000000
H 0.655523 -2.146483 0.813431
H -0.824297 0.804827 1.035743
H 0.655523 -2.146483 -0.813431
H -0.824297 0.804827 -1.035743
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-16"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
