using DoNOF

mol = """
0 1
N    -0.3896245   -0.4975700    0.0000000 
O    -0.3776717    0.9154097    0.0000000 
H     0.1141459   -0.8133419    0.8207146 
H     0.1141459   -0.8133419   -0.8207146 
H     0.5390043    1.2088440    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-nh2oh_st2"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
