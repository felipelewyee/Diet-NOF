using DoNOF

mol = """
0 1
   C     0.000000    1.135740    0.717503
   C     0.000000    1.190661   -0.668108
   C     0.000000    0.000000   -1.374944
   C     0.000000   -1.190661   -0.668108
   C     0.000000   -1.135740    0.717503
   N     0.000000    0.000000    1.408992
   H     0.000000    2.049911    1.301722
   H     0.000000    2.145889   -1.175862
   H     0.000000    0.000000   -2.457735
   H     0.000000   -2.145889   -1.175862
   H     0.000000   -2.049911    1.301722                                            
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-pyr"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
