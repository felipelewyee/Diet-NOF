using DoNOF

mol = """
0 1
C        0.000000    1.097981    0.000000 
C        0.000000   -1.097981    0.000000 
C       -1.059124    0.000000    0.000000 
C        1.059124    0.000000    0.000000 
C       -2.379287    0.000000    0.000000 
C        2.379287    0.000000    0.000000 
H        0.000000    1.738738    0.884483 
H        0.000000    1.738738   -0.884483 
H        0.000000   -1.738738    0.884483 
H        0.000000   -1.738738   -0.884483 
H       -2.944153   -0.923495    0.000000 
H       -2.944153    0.923495    0.000000 
H        2.944153   -0.923495    0.000000 
H        2.944153    0.923495    0.000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-P43"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
