using DoNOF

mol = """
0 1
   Bi         0.00000000      0.00000000      1.00000967
   H         -0.71818100      1.24392598      2.02125966
   H         -0.71818100     -1.24392598      2.02125966
   H          1.43636200      0.00000000      2.02125966
   Cl         0.00000000      0.00000000     -2.89550833
   H          0.00000000      0.00000000     -4.16828033
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-bih3_hcl"

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
