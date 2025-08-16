using DoNOF

mol = """
0 1
C     0.0000000   -0.0000000   -0.7565307 
C     0.0000000    0.0000000    0.7565307 
H     0.8767674    0.5062019   -1.1518715 
H    -0.0000000   -1.0124038   -1.1518715 
H    -0.8767674    0.5062019   -1.1518715 
H    -0.8767674   -0.5062019    1.1518715 
H     0.8767674   -0.5062019    1.1518715 
H    -0.0000000    1.0124038    1.1518715 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-ethane_st"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
