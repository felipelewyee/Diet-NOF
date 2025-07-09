using DoNOF

mol = """
0 1
 C                 -1.60786700   -0.31747300    0.31592000
 H                 -2.31388900   -0.88646900   -0.26673000
 H                 -1.62498900   -0.36552700    1.39673400
 S                 -0.16697600   -0.06574000   -0.45699800
 C                  1.22080700   -1.06918200    0.21514500
 C                  0.46702800    1.50357000    0.17771000
 H                  1.24595000   -0.94516300    1.29754600
 H                  2.16545300   -0.76152700   -0.23353000
 H                  0.99676500   -2.10238000   -0.03779700
 H                  0.44313300    1.46775300    1.26621100
 H                 -0.20331800    2.27793400   -0.18353800
 H                  1.48271300    1.66573300   -0.17959100
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-me2s-ch2"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
