using DoNOF

mol = """
1 2
   C          0.00000000      1.15366079      0.20772743
   C          0.00000000      0.70006192     -1.11009727
   C          0.00000000     -0.70006192     -1.11009727
   C          0.00000000     -1.15366079      0.20772743
   C          0.00000000      0.00000000      1.13580020
   H          0.00000000      2.19207431      0.51692222
   H          0.00000000      1.33090392     -1.98945097
   H          0.00000000     -1.33090392     -1.98945097
   H          0.00000000     -2.19207431      0.51692222
   H         -0.87179059      0.00000000      1.80699849
   H          0.87179059      0.00000000      1.80699849
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-9p1"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
