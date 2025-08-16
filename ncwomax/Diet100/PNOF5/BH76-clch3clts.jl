using DoNOF

mol = """
-1 1
   Cl        -0.00027464      0.01924291      2.32253735
   C          0.00021336      0.00020291     -0.00005239
   H          0.76098004     -0.75101627      0.00641362
   H         -1.03075062     -0.28300715      0.00218361
   H          0.27042850      1.03464473     -0.00866041
   Cl        -0.00059664     -0.02006713     -2.32242179
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-clch3clts"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
