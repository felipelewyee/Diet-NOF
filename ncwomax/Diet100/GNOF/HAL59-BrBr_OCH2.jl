using DoNOF

mol = """
0 1
   Br   -0.944758   -1.654252    0.000000
   Br    0.000000    0.431831    0.000000
   O     1.406705    2.803092    0.000000
   C     2.585545    2.572416    0.000000
   H     2.971600    1.538965    0.000000
   H     3.328036    3.386542    0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-BrBr_OCH2"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
