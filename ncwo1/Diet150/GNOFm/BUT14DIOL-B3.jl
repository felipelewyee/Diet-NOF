using DoNOF

mol = """
0 1
 C 1.428818 -0.097065 0.549352
 H 0.903725 -0.560684 1.388924
 O 1.537454 -1.010247 -0.532815
 C 0.740297 1.209954 0.155611
 H 0.61518 1.816285 1.058438
 H 1.399554 1.765862 -0.513834
 C -0.615643 1.040803 -0.539332
 H -0.475423 0.594213 -1.525148
 H -1.051076 2.029072 -0.700783
 H 0.659803 -1.398915 -0.622954
 H 2.445546 0.118699 0.877454
 C -1.628832 0.195107 0.215197
 H -1.632078 0.458067 1.277957
 H -2.63085 0.369902 -0.184174
 O -1.276495 -1.18546 0.043081
 H -1.8699 -1.719647 0.577019
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B3"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
