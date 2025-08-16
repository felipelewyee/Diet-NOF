using DoNOF

mol = """
0 2
C        0.049844    0.724055    0.000000 
H       -0.685394    1.513220    0.000000 
C        0.049844   -0.589606    0.000000 
H        0.969053   -1.164741    0.000000 
H       -0.881783   -1.155172    0.000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-ch2ch"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
