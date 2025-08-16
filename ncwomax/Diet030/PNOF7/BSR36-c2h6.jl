using DoNOF

mol = """
0 1
   C          0.00000000      0.00000000     -0.76168944
   C          0.00000000      0.00000000      0.76168944
   H         -0.87860032      0.50726013     -1.15576506
   H          0.00000000     -1.01452026     -1.15576506
   H          0.87860032      0.50726013     -1.15576506
   H         -0.87860032     -0.50726013      1.15576506
   H          0.00000000      1.01452026      1.15576506
   H          0.87860032     -0.50726013      1.15576506
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BSR36-c2h6"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
