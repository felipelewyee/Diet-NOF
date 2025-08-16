using DoNOF

mol = """
0 1
   P     0.000000    0.000000    4.090124
   C     0.000000    0.000000    5.615514
   H     0.000000    0.000000    6.687191
   Br    0.000000    0.000000    0.456500
   C     0.000000    0.000000   -1.436207
   C     0.000000    1.206707   -2.115479
   C     0.000000    1.199571   -3.502377
   C     0.000000    0.000000   -4.197678
   C     0.000000   -1.199571   -3.502377
   C     0.000000   -1.206707   -2.115479
   H     0.000000    2.138992   -1.567432
   H     0.000000    2.139733   -4.038684
   H     0.000000    0.000000   -5.279811
   H     0.000000   -2.139733   -4.038684
   H     0.000000   -2.138992   -1.567432
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PCH_PhBr"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
