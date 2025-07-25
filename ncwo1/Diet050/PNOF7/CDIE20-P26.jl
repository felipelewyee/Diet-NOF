using DoNOF

mol = """
0 1
C       -0.262860    0.402752    0.433597 
C        0.776831    1.338616   -0.144624 
C        1.174649    0.130030    0.044054 
C       -1.377859   -0.102391   -0.392630 
C        2.185895   -0.937271   -0.016300 
C       -2.571755   -0.457638    0.071705 
H        0.958769    2.343898   -0.478031 
H       -1.173100   -0.177613   -1.457589 
H        2.382725   -1.331283    0.983411 
H        1.821580   -1.771272   -0.619713 
H       -2.808297   -0.391968    1.127085 
H       -3.351201   -0.822312   -0.582553 
H        3.122844   -0.578310   -0.441880 
H       -0.502730    0.484268    1.494450 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-P26"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
