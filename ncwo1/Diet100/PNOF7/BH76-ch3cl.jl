using DoNOF

mol = """
0 1
   C          0.00000000      0.00000000     -0.14991697
   Cl         0.00000000      0.00000000      1.63280180
   H         -0.51399780     -0.89027030     -0.49429494
   H         -0.51399780      0.89027030     -0.49429494
   H          1.02799560      0.00000000     -0.49429494
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-ch3cl"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
