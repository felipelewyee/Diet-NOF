using DoNOF

mol = """
0 1
P 0.110874 1.775085 0.000000
H 1.068952 1.760698 1.040784
H 1.068952 1.760698 -1.040784
C -0.110874 3.550593 0.000000
N -0.355873 4.673225 0.000000
P -0.110874 -1.775085 0.000000
H -1.068952 -1.760698 1.040784
H -1.068952 -1.760698 -1.040784
C 0.110874 -3.550593 0.000000
N 0.355873 -4.673225 0.000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-11"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
