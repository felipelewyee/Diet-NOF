using DoNOF

mol = """
0 1
 C -1.851749 -0.605059 -0.395697
 H -1.798743 -1.351261 -1.188648
 O -1.851749 -1.349998 0.822045
 C -0.674742 0.356685 -0.494799
 H -0.78034 0.948632 -1.408958
 H -0.711694 1.060837 0.340097
 C 0.674742 -0.356685 -0.494799
 H 0.78034 -0.948632 -1.408958
 H 0.711694 -1.060837 0.340097
 H -1.974426 -0.720715 1.538285
 H -2.794173 -0.062286 -0.514166
 C 1.851749 0.605059 -0.395697
 H 2.794173 0.062286 -0.514166
 H 1.798743 1.351261 -1.188648
 O 1.851749 1.349998 0.822045
 H 1.974426 0.720715 1.538285
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B14"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
