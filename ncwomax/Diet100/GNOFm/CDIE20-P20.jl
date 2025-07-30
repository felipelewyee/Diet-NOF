using DoNOF

mol = """
0 1
C       -0.389334    0.345849    0.000000 
C        0.270631    1.546002    0.642437 
C        0.270631    1.546002   -0.642437 
C        0.270631   -0.975810    0.000000 
C       -0.368279   -2.141046    0.000000 
H       -1.477322    0.294937    0.000000 
H        0.540308    2.004320    1.576127 
H        0.540308    2.004320   -1.576127 
H        1.357028   -0.957393    0.000000 
H       -1.450608   -2.190688    0.000000 
H        0.164600   -3.081473    0.000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-P20"

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
