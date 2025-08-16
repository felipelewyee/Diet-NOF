using DoNOF

mol = """
0 1
C        0.000000    0.183665    0.000000 
C        1.352893   -0.311559    0.000000 
C        0.384215   -1.201725    0.000000 
C       -0.896179    1.161109    0.000000 
C       -0.055283   -2.605909    0.000000 
C       -0.543777    2.621061    0.000000 
H        2.410360   -0.114803    0.000000 
H       -1.946916    0.895570    0.000000 
H       -0.676871   -2.802031    0.876341 
H       -0.676871   -2.802031   -0.876341 
H        0.538034    2.761293    0.000000 
H       -0.943512    3.138466   -0.877462 
H        0.788073   -3.294780    0.000000 
H       -0.943512    3.138466    0.877462 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-R26"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
