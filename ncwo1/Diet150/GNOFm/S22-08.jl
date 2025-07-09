using DoNOF

mol = """
0 1
   C          0.00000000      0.00000000     -1.85916168
   C          0.00000000      0.00000000      1.85916168
   H          0.88862139     -0.51304580     -1.49459325
   H          0.00000000      1.02609160     -1.49459325
   H          0.00000000      0.00000000     -2.94828494
   H         -0.88862139     -0.51304580     -1.49459325
   H          0.00000000      0.00000000      2.94828494
   H         -0.88862139      0.51304580      1.49459325
   H          0.88862139      0.51304580      1.49459325
   H          0.00000000     -1.02609160      1.49459325
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S22-08"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
