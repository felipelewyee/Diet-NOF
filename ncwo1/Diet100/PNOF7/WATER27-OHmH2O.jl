using DoNOF

mol = """
-1 1
H    -0.0913883   -0.2448128    0.0130826 
H     1.5272733    0.3383121    0.6525543 
O    -1.2208378   -0.2356182    0.0613147 
O     1.2462132   -0.2206110   -0.0771381 
H    -1.4612604    0.3627299   -0.6498135 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WATER27-OHmH2O"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
