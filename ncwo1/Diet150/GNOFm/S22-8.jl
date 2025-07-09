using DoNOF

mol = """
0 1
C     0.00000    0.00000   -1.85916
C     0.00000    0.00000    1.85916
H     0.88862   -0.51305   -1.49459
H     0.00000    1.02609   -1.49459
H     0.00000    0.00000   -2.94828
H    -0.88862   -0.51305   -1.49459
H     0.00000    0.00000    2.94828
H    -0.88862    0.51305    1.49459
H     0.88862    0.51305    1.49459
H     0.00000   -1.02609    1.49459
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S22-8"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
