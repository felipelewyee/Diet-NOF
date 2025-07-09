using DoNOF

mol = """
0 1
   C          0.00000000      0.00000000      0.06556637
   F          0.00000000      0.00000000     -1.31562859
   H          0.51491633     -0.89186125      0.41668741
   H          0.51491633      0.89186125      0.41668741
   H         -1.02983267      0.00000000      0.41668741
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76RC-ch3f"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
