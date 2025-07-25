using DoNOF

mol = """
0 1
 C 1.255201 -0.412467 0.227148
 H 0.765795 -1.262577 -0.235988
 O 2.614856 -0.460585 -0.204903
 C 0.57977 0.893498 -0.179859
 H 1.180947 1.720046 0.212584
 H 0.606236 0.979536 -1.268834
 C -0.856815 1.063656 0.323789
 H -1.175043 2.09047 0.129091
 H -0.898417 0.918648 1.406163
 H 3.076116 0.266958 0.220989
 H 1.183981 -0.54511 1.311855
 C -1.877718 0.140739 -0.320031
 H -2.885907 0.477503 -0.061166
 H -1.77648 0.179697 -1.410037
 O -1.661937 -1.18637 0.161421
 H -2.303212 -1.762087 -0.263084
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B43"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
