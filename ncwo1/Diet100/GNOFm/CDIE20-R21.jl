using DoNOF

mol = """
0 1
C       -1.502398    0.491708    0.000000 
C        0.000000    0.422623    0.000000 
C       -0.504298    1.615404    0.000000 
C        1.115336   -0.472395    0.000000 
C        0.979866   -1.800211    0.000000 
H       -2.049528    0.256827    0.911542 
H       -2.049528    0.256827   -0.911542 
H       -0.372885    2.681257    0.000000 
H        2.102714   -0.023598    0.000000 
H       -0.000401   -2.257895    0.000000 
H        1.838596   -2.456194    0.000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-R21"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
