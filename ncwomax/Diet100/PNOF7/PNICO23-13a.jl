using DoNOF

mol = """
0 1
N     0.2306369   -1.3396356    0.0000000 
F     0.2306369   -2.7524632    0.0000000 
H     0.8100268   -1.1177407    0.8064768 
H     0.8100268   -1.1177407   -0.8064768 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-13a"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
