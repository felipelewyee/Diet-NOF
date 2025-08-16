using DoNOF

mol = """
0 2
   C         -0.59349906      0.66586394     -0.00004792
   C         -1.50398503     -0.34395600     -0.00000692
   H         -0.35341081      1.18450527     -0.91727018
   H         -0.35370874      1.18469048      0.91716508
   H         -1.84849529     -0.78988150      0.92251507
   H         -1.84830479     -0.79020430     -0.92244024
   C          1.49065019     -0.22226005      0.00003008
   H          2.07381410      0.68860269     -0.00127392
   H          1.46805961     -0.78969100     -0.91863546
   H          1.46887983     -0.78766954      0.91996443
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-c3h7ts"

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
