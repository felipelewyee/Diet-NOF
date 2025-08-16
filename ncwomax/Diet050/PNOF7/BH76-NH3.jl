using DoNOF

mol = """
0 1
   N          0.00000000      0.00000000      0.28222663
   H          0.46901226      0.81235307     -0.09407554
   H          0.46901226     -0.81235307     -0.09407554
   H         -0.93802452      0.00000000     -0.09407554
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-NH3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
