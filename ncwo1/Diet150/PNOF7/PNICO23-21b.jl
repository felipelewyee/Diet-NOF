using DoNOF

mol = """
0 1
P     0.0000000    0.2595699    0.0000000 
H     0.2476049   -0.6600828   -1.0417817 
H     0.2476049   -0.6600828    1.0417817 
C    -1.7849955   -0.0087890    0.0000000 
N    -2.9329872   -0.0745360    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-21b"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
