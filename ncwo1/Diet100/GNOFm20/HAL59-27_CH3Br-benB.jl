using DoNOF

mol = """
0 1
 Br   -0.037667189  -3.295073415   1.773239996
  C    0.090914423  -5.222622362   1.868971791
  H    0.022220220  -5.618700696   0.863215296
  H    1.044380918  -5.477357114   2.315266587
  H   -0.725846390  -5.587601469   2.479578125
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-27_CH3Br-benB"

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
