using DoNOF

mol = """
0 1
   F     0.000000    0.000000    3.351562
   I     0.000000    0.000000    1.370737
   C     0.000000    1.148358   -1.730694
   C     0.000000    1.193458   -3.112480
   C     0.000000    0.000000   -3.815346
   C     0.000000   -1.193458   -3.112480
   C     0.000000   -1.148358   -1.730694
   N     0.000000    0.000000   -1.057254
   H     0.000000    2.051283   -1.131944
   H     0.000000    2.147447   -3.620355
   H     0.000000    0.000000   -4.897575
   H     0.000000   -2.147447   -3.620355
   H     0.000000   -2.051283   -1.131944
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-FI_pyr"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
