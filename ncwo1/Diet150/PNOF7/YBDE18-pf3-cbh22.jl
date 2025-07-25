using DoNOF

mol = """
0 1
 C                  0.29645800   -1.22712100    0.00000000
 P                 -0.07274700    0.38782500    0.00000000
 B                 -0.92396000   -2.13543800    0.00000000
 B                  1.75227200   -1.65681400    0.00000000
 F                 -0.92396000    0.93251300    1.17373900
 F                 -0.92396000    0.93251300   -1.17373900
 F                  1.10705600    1.37931500    0.00000000
 H                 -0.76151500   -3.31349100    0.00000000
 H                 -2.03518400   -1.69108200    0.00000000
 H                  2.64466600   -0.86522900    0.00000000
 H                  1.99071600   -2.82265200    0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-pf3-cbh22"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
