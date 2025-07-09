using DoNOF

mol = """
-1 1
 Cl     -5.21765848      1.03354120      0.01665425
  F     -2.34796119      1.10896784     -0.00280930
  H     -3.32450119      1.08822239      0.00254398
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-6"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
