using DoNOF

mol = """
0 1
O    -0.6015578   -1.6259005    0.0000000 
O     0.0716080   -1.0609447    1.0901036 
O     0.0716080   -1.0609447   -1.0901036 
C     0.0716080    0.3180538    0.7706417 
C     0.0716080    0.3180538   -0.7706417 
H    -0.8151927    0.8154326    1.1676606 
H    -0.8151927    0.8154326   -1.1676606 
H     0.9727557    0.7404086    1.2093856 
H     0.9727557    0.7404086   -1.2093856 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-o3_c2h4_add"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
