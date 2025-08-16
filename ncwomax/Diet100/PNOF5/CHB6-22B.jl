using DoNOF

mol = """
0 1
  O      0.39025099     -0.23649653     -0.02176730
  H      1.33196180     -0.03790787     -0.09509831
  H     -0.04708940      0.62390834     -0.01348025
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CHB6-22B"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
