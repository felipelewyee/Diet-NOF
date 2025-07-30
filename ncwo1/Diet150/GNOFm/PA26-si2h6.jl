using DoNOF

mol = """
0 1
Si    0.0000000    0.0000000    1.1609054 
Si    0.0000000    0.0000000   -1.1609054 
H     1.1970290    0.6911050    1.6779620 
H     0.0000000   -1.3822101    1.6779620 
H    -1.1970290    0.6911050    1.6779620 
H     1.1970290   -0.6911050   -1.6779620 
H     0.0000000    1.3822101   -1.6779620 
H    -1.1970290   -0.6911050   -1.6779620 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PA26-si2h6"

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
