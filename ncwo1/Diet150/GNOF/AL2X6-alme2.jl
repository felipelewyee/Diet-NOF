using DoNOF

mol = """
0 1
   C          0.00000000      1.73000800     -0.24260810
   Al         0.00000000      0.00000000      0.69738890
   C          0.00000000     -1.73000800     -0.24260810
   H          0.00000000      0.00000000      2.28535790
   H          0.00000000      1.63396200     -1.32844310
   H          0.87344300      2.32376400      0.03983890
   H         -0.87344300      2.32376400      0.03983890
   H         -0.87344300     -2.32376400      0.03983890
   H          0.87344300     -2.32376400      0.03983890
   H          0.00000000     -1.63396200     -1.32844310
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AL2X6-alme2"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
