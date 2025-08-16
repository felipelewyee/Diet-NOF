using DoNOF

mol = """
0 1
C          0.000000000000    0.000000000000   -0.606014688898
H          0.000000000000    0.000000000000   -1.667861910266
C          0.000000000000    0.000000000000    0.606023467048
H          0.000000000000    0.000000000000    1.667853132115
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-45A"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
