using DoNOF

mol = """
0 1
   P          0.00000000      0.00000000      0.56884914
   H          0.59567102      1.03173246     -0.18961638
   H          0.59567102     -1.03173246     -0.18961638
   H         -1.19134203      0.00000000     -0.18961638
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-PH3"

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
