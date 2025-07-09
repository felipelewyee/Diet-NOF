using DoNOF

mol = """
0 2
   N         -1.56570234      0.14388363      0.00000000
   C         -0.39039841     -0.53188448      0.00000000
   C          0.81964131      0.22351724      0.00000000
   O          0.87221964      1.44895727      0.00000000
   O          1.94410148     -0.55664974      0.00000000
   H         -2.44351676     -0.32116838      0.00000000
   H         -1.53173926      1.15026572      0.00000000
   H         -0.40063565     -1.61036207      0.00000000
   H          2.69602998      0.05344081      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P42"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
