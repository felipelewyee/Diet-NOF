using DoNOF

mol = """
0 1
Si    0.0000000    0.0000000   -0.6845370 
H     1.0947042    0.0000000    0.3422685 
H    -1.0947042    0.0000000    0.3422685 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-3CL_B"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
