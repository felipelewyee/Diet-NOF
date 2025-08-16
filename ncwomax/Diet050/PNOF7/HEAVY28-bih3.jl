using DoNOF

mol = """
0 1
   Bi         0.00000000      0.76521375      0.00000000
   H          1.43645600     -0.25507125      0.00000000
   H         -0.71822800     -0.25507125      1.24400700
   H         -0.71822800     -0.25507125     -1.24400700
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-bih3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
