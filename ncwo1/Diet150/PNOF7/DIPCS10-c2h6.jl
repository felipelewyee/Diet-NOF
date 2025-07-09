using DoNOF

mol = """
0 1
   C          0.00000000      0.00000000      0.76600861
   C          0.00000000      0.00000000     -0.76600861
   H         -0.88440199      0.51060973      1.16226295
   H          0.00000000     -1.02121946      1.16226295
   H          0.88440199      0.51060973      1.16226295
   H          0.88440199     -0.51060973     -1.16226295
   H         -0.88440199     -0.51060973     -1.16226295
   H          0.00000000      1.02121946     -1.16226295
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DIPCS10-c2h6"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
