using DoNOF

mol = """
0 1
   N         -0.89172594      2.66731815      0.73114730
   C         -1.89989894      2.18882515     -0.07570070
   C         -1.41414594      1.19692415     -0.89662770
   C         -0.02425994      1.05449515     -0.57235670
   C          1.00489806      0.22276515     -1.05555670
   C          2.26845606      0.33881415     -0.50349670
   C          2.54144506      1.26742015      0.52646130
   C          1.54759006      2.10069815      1.01608630
   C          0.26801406      1.98349115      0.45917430
   H         -1.00463694      3.36508415      1.44342730
   H         -2.90192094      2.57556315      0.01385430
   H          0.84333606     -0.48583185     -1.85799770
   H          3.55026806      1.33704515      0.91043330
   H          1.76259706      2.81989815      1.79598630
   O          3.29550406     -0.44106385     -1.00876470
   C          3.68141506     -1.48511485     -0.12050970
   H          2.84694406     -2.16749585      0.06151730
   H          4.02895006     -1.08871385      0.83587430
   H          4.49273206     -2.02349785     -0.60364770
   C         -2.20846994      0.31749115     -1.81161270
   C         -2.82368994     -0.87428085     -1.05343870
   N         -1.84243494     -1.60392085     -0.26957470
   C         -1.63791894     -1.32214085      1.05721430
   C         -0.36931194     -1.90854485      1.64144430
   H         -1.56682594     -0.05298785     -2.61541070
   H         -3.01629894      0.87747315     -2.28849270
   H         -3.30861494     -1.55726285     -1.75327270
   H         -3.56975994     -0.51736485     -0.34701270
   H         -1.07749994     -2.03464685     -0.76020470
   O         -2.41156194     -0.65061785      1.72330630
   H          0.41131706     -1.14773885      1.59277330
   H         -0.02907194     -2.79141885      1.10147230
   H         -0.54541894     -2.16066285      2.68350530
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "MCONF-12"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
