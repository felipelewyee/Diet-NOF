using DoNOF

mol = """
0 1
   C         -4.26989454      1.41274542      1.47462843
   H         -4.72715731      1.06442421      2.41360831
   C         -2.77514734      1.07539949      1.49993362
   H         -2.29422084      1.40780761      0.56424892
   H         -2.28492196      1.61892057      2.32092403
   N         -2.50903209     -0.33440697      1.69918885
   C         -2.75109394     -1.38495307      1.15040072
   O         -2.91069189     -2.47661101      0.72228129
   H         -4.74965485      0.84590426      0.66071820
   C         -4.51432148      2.91183970      1.28772975
   H         -4.05789225      3.49745101      2.09971654
   H         -4.09278894      3.27246471      0.33766784
   H         -5.58935492      3.13663735      1.28043468
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-C3H7NCO"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
