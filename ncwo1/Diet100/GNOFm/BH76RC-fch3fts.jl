using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
-1 1
F     1.82356    0.00052    0.00011
C     0.00014   -0.00009   -0.00018
H     0.00006   -0.30489    1.02507
H     0.00029    1.04018   -0.24893
H    -0.00009   -0.73626   -0.77618
F    -1.82396    0.00054    0.00011
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76RC-fch3fts"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
