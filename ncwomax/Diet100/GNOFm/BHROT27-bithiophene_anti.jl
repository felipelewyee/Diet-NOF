using DoNOF

mol = """
0 1
C    -1.4595330   -1.1910594    0.1600327 
C    -2.8488073   -0.9628516    0.0993153 
C    -3.1539559    0.3260872   -0.2060017 
S    -1.7497644    1.2592017   -0.4444530 
C    -0.7185117   -0.0716168   -0.1000887 
C     0.7185117    0.0716168   -0.1000887 
S     1.7497644   -1.2592017   -0.4444530 
C     3.1539559   -0.3260872   -0.2060017 
C     2.8488073    0.9628516    0.0993153 
C     1.4595330    1.1910594    0.1600327 
H    -1.0099655   -2.1339875    0.4228504 
H    -3.5907346   -1.7189217    0.2898715 
H    -4.1235319    0.7747989   -0.3122418 
H     4.1235319   -0.7747989   -0.3122418 
H     3.5907346    1.7189217    0.2898715 
H     1.0099655    2.1339875    0.4228504
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-bithiophene_anti"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
