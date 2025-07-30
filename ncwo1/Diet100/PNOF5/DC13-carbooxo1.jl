using DoNOF

mol = """
0 1
O    -1.7466451    3.0252781    0.0000000 
C    -1.1412410    1.9766874    0.0000000 
C    -1.6814208    0.6129483    0.0000000 
C    -1.6814208   -0.6129483    0.0000000 
C    -1.1412410   -1.9766874    0.0000000 
O    -1.7466451   -3.0252781    0.0000000 
C     0.3098816   -1.7626273    0.0000000 
C     1.3715392   -1.1496790    0.0000000 
C     2.2824820    0.0000000    0.0000000 
O     3.4932902    0.0000000    0.0000000 
C     1.3715392    1.1496790    0.0000000 
C     0.3098816    1.7626273    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-carbooxo1"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
