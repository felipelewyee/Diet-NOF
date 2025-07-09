using DoNOF

mol = """
0 1
  I   -0.205324409  -3.368518313   1.883768735
  C    0.069196850  -5.471929013   1.872749216
  H    0.073601070  -5.805636321   0.839825880
  H    1.018048659  -5.689860688   2.352917164
  H   -0.752874404  -5.922024645   2.420412903
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-28_CH3I-benB"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
