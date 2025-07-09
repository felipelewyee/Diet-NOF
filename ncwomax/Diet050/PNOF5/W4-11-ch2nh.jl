using DoNOF

mol = """
0 1
C        0.056583    0.587652    0.000000 
N        0.056583   -0.686508    0.000000 
H       -0.902305   -1.034264    0.000000 
H       -0.843818    1.204585    0.000000 
H        1.010542    1.109323    0.000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-ch2nh"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
