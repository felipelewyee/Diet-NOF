using DoNOF

mol = """
0 1
 C                 -0.01532700    1.20051000    0.00000000
 P                 -0.01532700   -0.47795100    0.00000000
 H                  0.29462100    1.67164100    0.92294800
 H                  0.29462100    1.67164100   -0.92294800
 H                 -0.68590500   -1.00383000   -1.11082400
 H                 -0.68590500   -1.00383000    1.11082400
 H                  1.10443000   -1.36941900    0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-ph3-ch2"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
