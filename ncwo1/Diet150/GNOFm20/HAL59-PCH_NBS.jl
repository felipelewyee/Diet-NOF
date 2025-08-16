using DoNOF

mol = """
0 1
   P     0.000000    0.000000    3.888092
   C     0.000000    0.000000    5.411997
   H     0.000000    0.000000    6.483542
   N     0.000000    0.000000   -1.344490
   O     0.000000    2.284307   -1.732604
   O     0.000000   -2.284307   -1.732604
   C     0.000000   -1.155928   -2.129421
   C     0.000000   -0.661882   -3.546052
   C     0.000000    0.661882   -3.546052
   H     0.000000    1.347964   -4.378647
   H     0.000000   -1.347964   -4.378647
   C     0.000000    1.155928   -2.129421
   Br    0.000000    0.000000    0.477690
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PCH_NBS"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
