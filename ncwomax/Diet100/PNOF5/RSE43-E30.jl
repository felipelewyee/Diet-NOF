using DoNOF

mol = """
0 1
   C         -1.02966896      0.12457836      0.00000000
   O          0.26189474      0.75625683      0.00000000
   C          1.33421834     -0.05844226      0.00000000
   O          2.45666877      0.34978552      0.00000000
   H         -1.75565526      0.93293551      0.00000000
   H         -1.16920487     -0.48627653     -0.89450544
   H         -1.16920487     -0.48627653      0.89450544
   H          1.07095210     -1.13256088      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E30"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
