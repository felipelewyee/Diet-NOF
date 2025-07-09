using DoNOF

mol = """
0 1
N     2.9625822   -0.2028849    0.0000000 
H     3.3244151    0.2774729    0.8134138 
H     3.3244151    0.2774729   -0.8134138 
H     3.3587711   -1.1336397    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-21a"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
