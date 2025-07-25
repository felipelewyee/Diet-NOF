using DoNOF

mol = """
1 1
C          0.04904       -0.08448        0.02142
C          0.04904       -0.08448        1.53549
N          1.44683       -0.08448        2.04584
H          1.96441        0.73061        1.70803
H          1.47636       -0.07996        3.06730
H          1.98283       -0.92659        1.67426
H         -0.45396        0.79158        1.93898
H         -0.43113       -0.97481        1.93577
H          0.55324        0.79805       -0.36905
H          0.54942       -0.96888       -0.36720
H         -0.97758       -0.08002       -0.33796
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "IL16-147A"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
