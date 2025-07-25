using DoNOF

mol = """
0 1
  H    0.022106668   0.337720036   0.044305376
  C    0.026919353   0.297157256   1.127793236
  C    1.232420009   0.374285365   1.823206501
  C    1.238505395   0.318303850   3.215636232
  C    0.039447508   0.184540972   3.913255170
  C   -1.166219961   0.107113476   3.218629152
  C   -1.172980038   0.163913404   1.825514693
  H    2.165532440   0.474316067   1.280310128
  H    2.176629361   0.375131147   3.756175076
  H    0.044716980   0.137040660   4.996380563
  H   -2.098861603  -0.000562861   3.760947121
  H   -2.110703107   0.101604635   1.284610113
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-28_CH3I-benA"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
