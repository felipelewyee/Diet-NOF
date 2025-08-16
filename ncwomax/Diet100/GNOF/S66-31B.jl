using DoNOF

mol = """
0 1
C          0.664571439908   -0.050227915571    0.021759000092
H          1.181689177052   -0.921215811342   -0.355467594983
H          1.270182444777    0.736766128286    0.449073334066
C         -0.664205061394    0.050362532442   -0.027487928548
H         -1.276207947976   -0.737117057470   -0.444388646950
H         -1.176030052367    0.921432123655    0.356511836323
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-31B"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
