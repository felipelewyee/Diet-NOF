using DoNOF

mol = """
0 2
   H          0.14656781     -0.24726460      0.00000000
   F          0.00000000      1.21154849      0.00000000
   H         -0.14656781     -0.96428389      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT10"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
