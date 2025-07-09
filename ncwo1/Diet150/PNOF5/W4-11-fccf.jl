using DoNOF

mol = """
0 1
F        0.000000    0.000000    1.880463 
C        0.000000    0.000000    0.594580 
C        0.000000    0.000000   -0.594580 
F        0.000000    0.000000   -1.880463 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-fccf"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
