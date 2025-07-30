using DoNOF

mol = """
0 1
   Te         0.00000000      0.00000000      1.97516867
   H         -1.15322100      0.00000000      3.13323167
   H          1.15322100      0.00000000      3.13323167
   H          0.96025500      0.00000000     -3.05516933
   S          0.00000000      0.00000000     -2.13129333
   H         -0.96025500      0.00000000     -3.05516933
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-teh2_h2s"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
