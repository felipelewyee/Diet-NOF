using DoNOF

mol = """
0 1
O    -1.72566    0.98518   -0.00449
H    -0.75311    1.01106   -0.00954
C    -2.09541   -0.37457   -0.00926
H    -3.18166   -0.42385   -0.00501
H    -1.74214   -0.90531   -0.89862
H    -1.73482   -0.91347    0.87221
N     1.18253    0.90293   -0.01421
H     1.55315    1.41070    0.77892
H     1.55328    1.36726   -0.83347
C     1.66029   -0.48311    0.02325
H     1.26840   -1.01713   -0.83894
H     2.74700   -0.58984    0.02628
H     1.26816   -0.96984    0.91288
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-6"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
