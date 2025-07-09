using DoNOF

mol = """
0 1
   C         -1.20719552     -0.69697466      0.00000000
   C         -1.20719552      0.69697466      0.00000000
   C          0.00000000     -1.39394931      0.00000000
   C          0.00000000      1.39394931      0.00000000
   C          1.20719552      0.69697466      0.00000000
   C          1.20719552     -0.69697466      0.00000000
   H          0.00000000     -2.47443307      0.00000000
   H          2.14292190     -1.23721653      0.00000000
   H          2.14292190      1.23721653      0.00000000
   H          0.00000000      2.47443307      0.00000000
   H         -2.14292190      1.23721653      0.00000000
   H         -2.14292190     -1.23721653      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S22-11a"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
