using DoNOF

mol = """
0 1
 C                  0.00000000    0.22683200    0.00000000
 N                  0.01763800   -1.29658000    0.00000000
 B                 -1.36233900    0.81108200    0.00000000
 B                  1.34220500    0.86377400    0.00000000
 H                 -0.94280300   -1.63993400    0.00000000
 H                  0.49364600   -1.66476800    0.82061500
 H                  0.49364600   -1.66476800   -0.82061500
 H                 -1.52029600    1.99125300    0.00000000
 H                 -2.32665700    0.08033800    0.00000000
 H                  2.34205400    0.18781600    0.00000000
 H                  1.43761200    2.05084900    0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-nh3-cbh22"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
