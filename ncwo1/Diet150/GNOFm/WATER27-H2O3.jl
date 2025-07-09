using DoNOF

mol = """
0 1
O     1.1847029    1.1150792   -0.0344641 
H     0.4939088    0.9563767    0.6340089 
H     2.0242676    1.0811246    0.4301417 
O    -1.1469443    0.0697649    1.1470196 
H    -1.2798308   -0.5232169    1.8902833 
H    -1.0641398   -0.4956693    0.3569250 
O    -0.1633508   -1.0289346   -1.2401808 
H     0.4914771   -0.3248733   -1.0784838 
H    -0.5400907   -0.8496512   -2.1052499 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WATER27-H2O3"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
