using DoNOF

mol = """
1 2
   O          1.51617785      0.00000000      0.06984280
   O         -1.51617786      0.00000000     -0.06984291
   H          1.64955199      0.77513700     -0.50952092
   H          1.64955199     -0.77513700     -0.50952092
   H         -1.64955195      0.77513700      0.50952180
   H         -1.64955195     -0.77513700      0.50952180
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "SIE4x4-h2o2+_1.5"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
