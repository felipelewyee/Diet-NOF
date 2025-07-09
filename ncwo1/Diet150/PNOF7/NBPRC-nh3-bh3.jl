using DoNOF

mol = """
0 1
   N          0.00000000      0.00000000      0.72071100
   B          0.00000000      0.00000000     -0.91697600
   H          0.00000000      0.94663500      1.08347400
   H         -0.81981000     -0.47331800      1.08347400
   H          0.81981000     -0.47331800      1.08347400
   H         -1.01189100      0.58421500     -1.23684100
   H          1.01189100      0.58421500     -1.23684100
   H          0.00000000     -1.16843100     -1.23684100
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "NBPRC-nh3-bh3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
