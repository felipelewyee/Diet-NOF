using DoNOF

mol = """
0 2
   C         -1.17379126      0.14938203      0.00000000
   O          0.05976024      0.73421059      0.00000000
   C          1.17032870     -0.05784107      0.00000000
   H         -1.25785401     -0.92764593      0.00000000
   H         -1.99816088      0.83906616      0.00000000
   O          2.27111823      0.39653131      0.00000000
   H          0.92859897     -1.13370311      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P30"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
