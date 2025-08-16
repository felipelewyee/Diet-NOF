using DoNOF

mol = """
0 1
C        0.000000    0.781938    1.310988 
C        0.000000   -0.781938    1.310988 
C        0.000000    0.739288   -0.213371 
C        0.000000   -0.739288   -0.213371 
C        0.000000    1.668935   -1.160668 
C        0.000000   -1.668935   -1.160668 
H        0.885114    1.238333    1.752687 
H       -0.885114    1.238333    1.752687 
H        0.885114   -1.238333    1.752687 
H       -0.885114   -1.238333    1.752687 
H        0.000000    2.723132   -0.917147 
H        0.000000    1.403759   -2.209923 
H        0.000000   -1.403759   -2.209923 
H        0.000000   -2.723132   -0.917147 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-R43"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
