using DoNOF

mol = """
0 1
 C                 -0.14993000   -1.03666700    0.00000000
 S                  0.56895500    0.42435500    0.00000000
 F                 -0.14993000    1.30951800    1.14454800
 F                 -0.14993000    1.30951800   -1.14454800
 B                 -1.67880000   -1.20106800    0.00000000
 H                 -2.12504000   -2.30210900    0.00000000
 H                 -2.39600600   -0.25260200    0.00000000
 B                  0.93943400   -2.10606300    0.00000000
 H                  0.61945200   -3.25030400    0.00000000
 H                  2.09346100   -1.80033100    0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-f2s-cbh22"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
