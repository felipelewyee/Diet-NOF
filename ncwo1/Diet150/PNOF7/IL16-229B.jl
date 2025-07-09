using DoNOF

mol = """
-1 1
O          3.97298       -2.02259        0.29357
Cl         2.85192       -1.84894       -0.60735
O          3.11691       -2.40491       -1.93070
O          1.60869       -2.45077       -0.04085
O          2.57594       -0.33642       -0.77092
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "IL16-229B"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
