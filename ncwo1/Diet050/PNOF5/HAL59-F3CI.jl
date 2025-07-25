using DoNOF

mol = """
0 1
   I     0.000000    0.000000    0.968386
   C     0.000000    0.000000   -1.171167
   F     0.000000    1.244106   -1.640647
   F    -1.077427   -0.622053   -1.640647
   F     1.077427   -0.622053   -1.640647
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-F3CI"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
