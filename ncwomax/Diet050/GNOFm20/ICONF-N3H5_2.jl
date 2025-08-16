using DoNOF

mol = """
0 1
   N         -0.17184112     -0.55707404      0.30027257
   N          1.20115329     -0.58382423     -0.10374620
   N         -0.75671527      0.76298616      0.15935504
   H         -1.28142531      0.84592998     -0.71555242
   H         -1.41634923      0.87959036      0.92732319
   H          1.34067837      0.03520591     -0.91080201
   H          1.72995729     -0.17035158      0.66351983
   H         -0.64545801     -1.21246256     -0.32036999
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ICONF-N3H5_2"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
