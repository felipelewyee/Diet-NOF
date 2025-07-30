using DoNOF

mol = """
0 1
C    -1.5509383   -0.3046782    0.7974216 
C    -2.9173600   -0.2572608    0.4520777 
C    -3.1153913    0.0500720   -0.8576504 
S    -1.6397192    0.3001116   -1.6704985 
C    -0.7216777   -0.0254094   -0.2541573 
C     0.7216777    0.0254094   -0.2541573 
S     1.6397192   -0.3001116   -1.6704985 
C     3.1153913   -0.0500720   -0.8576504 
C     2.9173600    0.2572608    0.4520777 
C     1.5509383    0.3046782    0.7974216 
H    -1.1822260   -0.5588506    1.7767451 
H    -3.7197698   -0.4531472    1.1427536 
H    -4.0457132    0.1435962   -1.3858704 
H     4.0457132   -0.1435962   -1.3858704 
H     3.7197698    0.4531472    1.1427536 
H     1.1822260    0.5588506    1.7767451 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-bithiophene_syn"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
