using DoNOF

mol = """
0 1
C        0.000000    0.557840    0.000000 
C       -1.003948   -0.420122    0.000000 
C        1.332269    0.129163    0.000000 
C       -0.684035   -1.768332    0.000000 
C        1.655353   -1.221918    0.000000 
C        0.647579   -2.177481    0.000000 
C       -0.281183    1.999019    0.000000 
C       -1.472389    2.596576    0.000000 
H       -2.044203   -0.124955    0.000000 
H        2.122922    0.869138    0.000000 
H       -1.475319   -2.506276    0.000000 
H        2.693354   -1.526807    0.000000 
H        0.893492   -3.230745    0.000000 
H        0.602798    2.629055    0.000000 
H       -1.550282    3.674533    0.000000 
H       -2.404642    2.047585    0.000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-ISO_C8H8_1"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
