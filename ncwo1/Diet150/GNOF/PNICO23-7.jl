using DoNOF

mol = """
0 1
P 0.099364 1.514768 0.000000
H 1.063616 1.412098 1.034457
H 1.063616 1.412098 -1.034457
O -0.099364 3.167111 0.000000
H -1.031127 3.383294 0.000000
P -0.099364 -1.514768 0.000000
H -1.063616 -1.412098 1.034457
H -1.063616 -1.412098 -1.034457
O 0.099364 -3.167111 0.000000
H 1.031127 -3.383294 0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-7"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
