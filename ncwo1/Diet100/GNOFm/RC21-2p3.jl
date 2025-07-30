using DoNOF

mol = """
1 1
   C          0.00000000     -0.68706565     -0.15561651
   C          0.00000000      0.68706565     -0.15561651
   H         -0.93544202      1.24259171     -0.16297374
   H          0.93544202      1.24259171     -0.16297374
   H          0.93544202     -1.24259171     -0.16297374
   H         -0.93544202     -1.24259171     -0.16297374
   H          0.00000000      0.00000000      0.96312797
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-2p3"

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
