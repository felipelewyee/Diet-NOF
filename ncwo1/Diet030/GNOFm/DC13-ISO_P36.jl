using DoNOF

mol = """
0 1
O    -0.0177338    2.6610455    0.0000000 
C     0.0404497    1.4394660    0.0000000 
C     1.2397591    0.6245600    0.0000000 
C     1.1801637   -0.7350108    0.0000000 
C    -0.0655982   -1.4250383    0.0000000 
C    -1.2053116   -0.6857515    0.0000000 
N    -1.1450088    0.6749887    0.0000000 
H     2.1801697    1.1583225    0.0000000 
H     2.0990321   -1.3107371    0.0000000 
H    -0.1136487   -2.5038375    0.0000000 
H    -2.1965269   -1.1195528    0.0000000 
H    -1.9957462    1.2215452    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-ISO_P36"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
