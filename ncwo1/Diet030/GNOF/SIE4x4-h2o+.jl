using DoNOF

mol = """
1 2
   O          0.00000000      0.00000000      0.38516109
   H         -0.81305560      0.00000000     -0.19258055
   H          0.81305560      0.00000000     -0.19258055
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "SIE4x4-h2o+"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
