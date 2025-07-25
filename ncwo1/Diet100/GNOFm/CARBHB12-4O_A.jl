using DoNOF

mol = """
0 1
C    -0.0475043    0.9518242    0.0000000 
C     0.0553300   -1.2085107    0.6721468 
C     0.0553300   -1.2085107   -0.6721468 
N    -0.0068292    0.1134193   -1.0558935 
N    -0.0068292    0.1134193    1.0558935 
H     0.0964756   -2.0286085    1.3710413 
H     0.0964756   -2.0286085   -1.3710413 
C    -0.0268963    0.5655123   -2.4237681 
C    -0.0268963    0.5655123    2.4237681 
H     0.8604394    0.2291423   -2.9613472 
H    -0.9121045    0.2011767   -2.9468824 
H    -0.0426629    1.6519566   -2.4198035 
H    -0.9121045    0.2011767    2.9468824 
H     0.8604394    0.2291423    2.9613472 
H    -0.0426629    1.6519566    2.4198035 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-4O_A"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
