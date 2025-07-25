using DoNOF

mol = """
0 1
O    -2.2315426   -0.0184865    0.0000000 
H    -1.3109947    0.2590669    0.0000000 
H    -2.7355320    0.7954934    0.0000000 
Si    1.4665347   -0.0547721    0.0000000 
H     2.4057673   -0.4906509   -1.0901298 
H     2.4057673   -0.4906509    1.0901298 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-3O"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
