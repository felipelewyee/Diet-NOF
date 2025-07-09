using DoNOF

mol = """
0 1
N     0.0507550    0.7066917   -0.2218809 
N    -0.0507550   -0.7066917   -0.2218809 
H     0.8523830   -1.0838766   -0.4577758 
H    -0.3235893   -1.0740537    0.6796527 
H    -0.8523830    1.0838766   -0.4577758 
H     0.3235893    1.0740537    0.6796527 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-n2h4_st1"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
