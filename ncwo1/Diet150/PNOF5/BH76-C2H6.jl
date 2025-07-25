using DoNOF

mol = """
0 1
   C         -0.76309476      0.00000033     -0.00000093
   C          0.76309476      0.00000033     -0.00000093
   H          1.15831079     -0.44364177     -0.91409641
   H         -1.15831079     -1.01332647     -0.07464085
   H          1.15831079     -0.56981244      0.84125331
   H          1.15831079      1.01345414      0.07284720
   H         -1.15831079      0.44202050      0.91488304
   H         -1.15831079      0.57130538     -0.84024444
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-C2H6"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
