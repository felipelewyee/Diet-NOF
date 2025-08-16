using DoNOF

mol = """
0 1
   C         -0.92548289      0.26459331      0.02516232
   C          0.54711173      0.26200898     -0.02474243
   O         -0.18687997      1.50956646      0.00187589
   H         -1.44876950      0.05848033     -0.91832736
   H          1.06961103      0.05140385      0.91820188
   C          1.32642752     -0.03769011     -1.27733727
   H          2.24392679      0.56739834     -1.31806801
   H          1.62077975     -1.09795742     -1.30476164
   H          0.72818224      0.18367708     -2.17142063
   C         -1.70588068     -0.03558457      1.27695068
   H         -2.62115463      0.57275625      1.31934432
   H         -2.00412046     -1.09483081      1.30154681
   H         -1.10677484      0.18122164      2.17157543
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-dimethyloxirane"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
