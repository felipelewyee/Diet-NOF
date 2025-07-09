using DoNOF

mol = """
0 1
   N         -1.03059994     -0.43231884      0.00000000
   C         -1.81252113      0.68361087      0.00000000
   N         -1.08641061      1.78101312      0.00000000
   C          0.21700374      1.34407765      0.00000000
   C          0.28336286     -0.02851149      0.00000000
   C          1.42752411     -0.97879913      0.00000000
   H          1.04216514      2.03502679      0.00000000
   H         -2.88732775      0.63545144      0.00000000
   H          1.42151721     -1.61814363     -0.88237141
   H          2.35938201     -0.42030637      0.00000000
   H          1.42151721     -1.61814363      0.88237141
   H         -1.35561284     -1.38295678      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-8b"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
