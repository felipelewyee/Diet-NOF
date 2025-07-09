using DoNOF

mol = """
0 1
   C          1.20481149      0.69559824      0.00000000
   C          1.20481149     -0.69559824      0.00000000
   C          0.00000000     -1.39119648      0.00000000
   C         -1.20481149     -0.69559824      0.00000000
   C         -1.20481149      0.69559824      0.00000000
   C          0.00000000      1.39119648      0.00000000
   H          2.14201782      1.23669457      0.00000000
   H          2.14201782     -1.23669457      0.00000000
   H          0.00000000     -2.47338913      0.00000000
   H         -2.14201782     -1.23669457      0.00000000
   H         -2.14201782      1.23669457      0.00000000
   H          0.00000000      2.47338913      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G2RC-94"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
