using DoNOF

mol = """
0 1
O          0.220790846086    1.075092987171   -0.006674360761
H          1.185059642311    1.042620442310   -0.006320630642
C         -0.240638072874   -0.260358989868    0.001598379350
H         -1.326924574928   -0.228972553793    0.000735958021
H          0.081387122301   -0.819843549718   -0.879930624021
H          0.080325037105   -0.808538336101    0.890591278054
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-08A"

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
