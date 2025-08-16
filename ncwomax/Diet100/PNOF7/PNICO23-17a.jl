using DoNOF

mol = """
0 1
N     0.8737578   -2.1182834    0.0000000 
H     0.2094499   -2.8807262    0.0000000 
H     1.4631256   -2.2218154    0.8150708 
H     1.4631256   -2.2218154   -0.8150708 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-17a"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
