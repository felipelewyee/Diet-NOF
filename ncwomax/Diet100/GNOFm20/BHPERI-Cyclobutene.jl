using DoNOF

mol = """
0 1
   H          0.00000000     -1.42064151      1.71659501
   C          0.00000000      0.67017024      0.92994073
   C          0.00000000     -0.67017024      0.92994073
   C          0.00000000      0.78631128     -0.58457581
   C          0.00000000     -0.78631128     -0.58457581
   H          0.89010932     -1.24659944     -1.03097997
   H         -0.89010932     -1.24659944     -1.03097997
   H          0.00000000      1.42064151      1.71659501
   H         -0.89010932      1.24659944     -1.03097997
   H          0.89010932      1.24659944     -1.03097997
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-Cyclobutene"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
