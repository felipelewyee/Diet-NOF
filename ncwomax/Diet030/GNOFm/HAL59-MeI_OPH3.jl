using DoNOF

mol = """
0 1
   C    -2.762156   -0.692968    0.006172
   I    -0.815254    0.173132   -0.001895
   H    -3.257069   -0.410488    0.928556
   H    -2.660640   -1.770600   -0.055906
   H    -3.307874   -0.313161   -0.850245
   O     2.239270    0.923492    0.007392
   P     2.798642   -0.454150   -0.000447
   H     2.535571   -1.235400   -1.145881
   H     2.374400   -1.313458    1.035140
   H     4.203210   -0.550763    0.099320
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-MeI_OPH3"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
