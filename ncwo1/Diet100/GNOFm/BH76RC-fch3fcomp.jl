using CUDA, KernelAbstractions, cuTENSOR, DoNOF

mol = """
-1 1
F     0.00000    0.00000   -1.79137
C     0.00000    0.00000   -0.36562
H    -0.51179    0.88645   -0.01759
H    -0.51179   -0.88645   -0.01759
H     1.02358    0.00000   -0.01759
F     0.00000    0.00000    2.20975
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76RC-fch3fcomp"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
