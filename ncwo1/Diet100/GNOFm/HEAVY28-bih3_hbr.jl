using DoNOF

mol = """
0 1
   Bi         0.00000000      0.00000000      1.03200467
   H         -0.71872200      1.24486302      2.05029867
   H         -0.71872200     -1.24486302      2.05029867
   H          1.43744400      0.00000000      2.05029867
   Br         0.00000000      0.00000000     -2.88356933
   H          0.00000000      0.00000000     -4.29933133
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-bih3_hbr"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
