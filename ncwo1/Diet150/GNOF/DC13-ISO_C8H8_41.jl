using DoNOF

mol = """
0 1
C        0.783775    0.783775    0.783775 
C       -0.783775    0.783775    0.783775 
C       -0.783775    0.783775   -0.783775 
C        0.783775    0.783775   -0.783775 
C        0.783775   -0.783775    0.783775 
C       -0.783775   -0.783775    0.783775 
C       -0.783775   -0.783775   -0.783775 
C        0.783775   -0.783775   -0.783775 
H        1.411059   -1.411059    1.411059 
H        1.411059    1.411059    1.411059 
H       -1.411059    1.411059    1.411059 
H       -1.411059   -1.411059    1.411059 
H       -1.411059    1.411059   -1.411059 
H       -1.411059   -1.411059   -1.411059 
H        1.411059   -1.411059   -1.411059 
H        1.411059    1.411059   -1.411059 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-ISO_C8H8_41"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
