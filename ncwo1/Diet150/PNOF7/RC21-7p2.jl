using DoNOF

mol = """
0 1
   O          0.00000000      0.00000000     -0.38914884
   H         -0.76154881      0.00000000      0.19457442
   H          0.76154881      0.00000000      0.19457442
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-7p2"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
