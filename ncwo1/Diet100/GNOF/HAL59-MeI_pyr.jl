using DoNOF

mol = """
0 1
   C    -0.000354   -3.763893    0.000000
   I     0.000190   -1.630948    0.000000
   H     1.027767   -4.109230    0.000000
   H    -0.513816   -4.109580    0.890515
   H    -0.513816   -4.109580   -0.890515
   C    -1.191759    3.556532    0.000000
   C    -1.138322    2.171519    0.000000
   N     0.000000    1.485156    0.000000
   H     2.049750    1.583343    0.000000
   H     2.146103    4.064702    0.000000
   H    -0.000527    5.345268    0.000000
   H    -2.146802    4.064117    0.000000
   H    -2.049772    1.582757    0.000000
   C     1.138128    2.171836    0.000000
   C    -0.000379    4.262535    0.000000
   C     1.191196    3.556862    0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-MeI_pyr"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
