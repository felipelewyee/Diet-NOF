using DoNOF

mol = """
0 1
N 0.873758 -2.118284 0.000000
P 0.000000 0.418134 0.000000
H 0.209450 -2.880727 0.000000
F -0.864586 1.813387 0.000000
H 1.463126 -2.221816 0.815071
H -0.735368 -0.220068 1.031927
H 1.463126 -2.221816 -0.815071
H -0.735368 -0.220068 -1.031927
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-17"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
