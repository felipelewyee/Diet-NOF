using DoNOF

mol = """
0 1
   C          0.66144099      0.00000000      0.00000000
   C         -0.66144099      0.00000000      0.00000000
   H          1.23091970     -0.92311070      0.00000000
   H          1.23091970      0.92311070      0.00000000
   H         -1.23091970     -0.92311070      0.00000000
   H         -1.23091970      0.92311070      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DARC-ethene"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
