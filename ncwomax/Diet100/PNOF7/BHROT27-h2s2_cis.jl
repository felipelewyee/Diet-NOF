using DoNOF

mol = """
0 1
S     1.0572291    0.0000000   -0.6622784 
S    -1.0572291    0.0000000   -0.6622784 
H     1.2093176    0.0000000    0.6627105 
H    -1.2093176    0.0000000    0.6627105
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-h2s2_cis"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
