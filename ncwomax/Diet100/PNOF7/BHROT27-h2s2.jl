using DoNOF

mol = """
0 1
S    -0.0687310    1.0220312   -0.4834061 
S     0.0687310   -1.0220312   -0.4834061 
H     0.8386269    1.2863190    0.4675986 
H    -0.8386269   -1.2863190    0.4675986 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-h2s2"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
