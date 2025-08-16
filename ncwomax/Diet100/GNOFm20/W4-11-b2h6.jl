using DoNOF

mol = """
0 1
B       -0.878894    0.000000    0.000000 
B        0.878894    0.000000    0.000000 
H        0.000000    0.000000    0.975221 
H        0.000000    0.000000   -0.975221 
H       -1.452345    1.039659    0.000000 
H       -1.452345   -1.039659    0.000000 
H        1.452345   -1.039659    0.000000 
H        1.452345    1.039659    0.000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-b2h6"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
