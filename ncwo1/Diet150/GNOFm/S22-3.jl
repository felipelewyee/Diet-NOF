using DoNOF

mol = """
0 1
C    -1.88890   -0.17969    0.00000
C     1.88890    0.17969    0.00000
O    -1.17044   -1.16659    0.00000
O    -1.49328    1.07369    0.00000
O     1.49328   -1.07369    0.00000
O     1.17044    1.16659    0.00000
H    -0.49883    1.10720    0.00000
H    -2.97949   -0.25883    0.00000
H     2.97949    0.25883    0.00000
H     0.49883   -1.10720    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S22-3"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
