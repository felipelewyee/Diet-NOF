using DoNOF

mol = """
-1 1
O          2.80462       -2.05209        0.86051
C          3.45416       -1.35959        0.02862
C          4.22417       -2.21988       -1.00695
F          5.03891       -3.09750       -0.40189
O          3.53466       -0.12834       -0.07340
F          4.97310       -1.49334       -1.83814
F          3.36708       -2.92902       -1.76105
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "IL16-147B"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
