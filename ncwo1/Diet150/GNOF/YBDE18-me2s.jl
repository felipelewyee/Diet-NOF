using DoNOF

mol = """
0 1
 S                  0.00000000    0.00000000    0.66724600
 C                  0.00000000    1.36148200   -0.51767700
 C                  0.00000000   -1.36148200   -0.51767700
 H                 -0.89162700    1.32616700   -1.14153100
 H                  0.89162700    1.32616700   -1.14153100
 H                  0.00000000    2.28856200    0.05115000
 H                 -0.89162700   -1.32616700   -1.14153100
 H                  0.00000000   -2.28856200    0.05115000
 H                  0.89162700   -1.32616700   -1.14153100
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-me2s"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
