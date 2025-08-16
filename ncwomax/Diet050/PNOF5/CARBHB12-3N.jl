using DoNOF

mol = """
0 1
N    -2.0218160    0.0384296   -0.1370857 
H    -1.0569167    0.3421306   -0.1534744 
H    -2.5889661    0.8736855   -0.1772062 
H    -2.1799400   -0.3748521    0.7710586 
Si    1.9938584    0.0138474   -0.0502141 
H     2.8743270   -0.3713375   -1.2095769 
H     2.9794534   -0.5219035    0.9564988 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-3N"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
