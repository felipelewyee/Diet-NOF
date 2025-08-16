using DoNOF

mol = """
0 1
   N     0.000000    0.000000    0.110342
   H     0.000000    0.941082   -0.257464
   H    -0.815001   -0.470541   -0.257464
   H     0.815001   -0.470541   -0.257464
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NH3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
