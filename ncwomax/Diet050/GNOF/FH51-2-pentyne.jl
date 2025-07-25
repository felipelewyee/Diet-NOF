using DoNOF

mol = """
0 1
   C         -1.15652361      2.93352478      1.38638873
   H         -1.85899517      3.64036578      1.84778981
   H         -0.88476369      3.31466237      0.39188227
   H         -0.25010039      2.90547455      2.00563584
   C         -1.78583109      1.53234273      1.27366635
   H         -2.67209324      1.57854710      0.61845852
   H         -1.07752237      0.85015202      0.77388167
   C         -2.16996609      0.96729694      2.56450663
   C         -2.47846590      0.52534993      3.65250700
   C         -2.85195129     -0.01527234      4.95275370
   H         -2.42391460     -1.01780635      5.10694049
   H         -2.49335749      0.62859056      5.77043736
   H         -3.94494133     -0.10110164      5.05177549
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-2-pentyne"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
