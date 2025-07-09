using DoNOF

mol = """
0 1
   C         -0.28270970     -0.29484670      0.00000000
   O          0.11290644      0.95853474      0.00000000
   O          0.43575156     -1.28174506      0.00000000
   H         -1.37330209     -0.37398373      0.00000000
   H          1.10735379      0.99204075      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S22-03a"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
