using DoNOF

mol = """
0 1
   C         -1.27367413      0.17615177      0.21673199
   O         -0.10240994      0.17615177      0.21733190
   O         -2.44505441      0.17615177      0.21733194
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-CO2"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
