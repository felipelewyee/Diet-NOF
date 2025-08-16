using DoNOF

mol = """
0 1
   Br    0.000000    0.000000    1.794145
   C     0.000000    0.000000   -0.097650
   C     0.000000    1.207099   -0.775796
   C     0.000000    1.199665   -2.163022
   C     0.000000    0.000000   -2.858018
   C     0.000000   -1.199665   -2.163022
   C     0.000000   -1.207099   -0.775796
   H     0.000000    2.139028   -0.227568
   H     0.000000    2.139500   -2.699981
   H     0.000000    0.000000   -3.940157
   H     0.000000   -2.139500   -2.699981
   H     0.000000   -2.139028   -0.227568
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PhBr"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
