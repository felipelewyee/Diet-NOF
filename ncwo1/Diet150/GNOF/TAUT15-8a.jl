using DoNOF

mol = """
0 1
   C         -0.80916840     -1.62615093      0.00000000
   N         -1.65788746     -0.56511239      0.00000000
   C         -0.88945370      0.57267245      0.00000000
   C          0.41455161      0.13829766      0.00000000
   N          0.44946081     -1.23758175      0.00000000
   C          1.66393608      0.94876790      0.00000000
   H         -2.66093769     -0.60658840      0.00000000
   H         -1.32085771      1.55680003      0.00000000
   H         -1.15681071     -2.64428258      0.00000000
   H          2.26593779      0.72556354      0.87831364
   H          2.26593779      0.72556354     -0.87831364
   H          1.43529158      2.01205092      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-8a"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
