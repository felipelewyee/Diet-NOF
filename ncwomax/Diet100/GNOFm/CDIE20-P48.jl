using DoNOF

mol = """
0 1
C       -0.280938   -0.506291   -0.423189 
C        1.037674    0.386281   -0.514442 
C        0.628324   -1.532783    0.238429 
C        1.727184   -0.782262    0.161974 
H        1.339642    0.518866   -1.556977 
C       -1.417143    0.018570    0.384148 
H       -1.189344    0.295703    1.408228 
C       -2.661008    0.152262   -0.059946 
H       -3.451685    0.536069    0.570406 
H       -2.931254   -0.120863   -1.073036 
H        0.423079   -2.524869    0.617819 
H        2.756892   -0.938482    0.455801 
C        1.051350    1.731533    0.192044 
H        2.044421    2.180807    0.134405 
H        0.342452    2.422333   -0.266969 
H        0.793713    1.633308    1.246561 
H       -0.640572   -0.806730   -1.410344 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-P48"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
