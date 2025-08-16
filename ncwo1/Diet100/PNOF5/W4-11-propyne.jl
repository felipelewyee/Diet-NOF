using DoNOF

mol = """
0 1
H       -0.000008    2.489332    0.000000 
H       -1.020250   -1.628447    0.000000 
H        0.510119   -1.628426    0.883542 
H        0.510119   -1.628426   -0.883542 
C       -0.000004    1.426421    0.000000 
C        0.000000    0.218281    0.000000 
C        0.000008   -1.245375    0.000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-propyne"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
