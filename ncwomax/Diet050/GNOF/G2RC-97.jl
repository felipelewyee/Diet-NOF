using DoNOF

mol = """
0 1
   Cl         0.00000000      1.49399255      0.83464446
   C          0.00000000      0.00000000     -0.15559822
   Cl         0.00000000     -1.49399255      0.83464446
   H          0.89864950      0.00000000     -0.75684535
   H         -0.89864950      0.00000000     -0.75684535
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G2RC-97"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
