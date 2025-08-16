using DoNOF

mol = """
0 2
   C         -0.76594544      0.02334475      0.00000000
   C          0.77276718      0.03214442      0.00000000
   O          1.16281071     -1.27097839      0.00000000
   H         -1.11583696      1.05695405      0.00000000
   H         -1.14311380     -0.48290832      0.88837496
   H         -1.14311380     -0.48290832     -0.88837496
   H          1.11621605      0.56217590      0.90157397
   H          1.11621605      0.56217590     -0.90157397
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-2p2"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
