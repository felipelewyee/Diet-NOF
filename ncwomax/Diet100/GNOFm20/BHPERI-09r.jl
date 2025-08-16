using DoNOF

mol = """
0 1
   C         -0.71355475      0.00000000     -0.69976629
   C         -1.24098505      0.00000000      0.55889447
   S          0.00000000      0.00000000      1.76913511
   C          1.24098505      0.00000000      0.55889447
   C          0.71355475      0.00000000     -0.69976629
   H         -1.31813560      0.00000000     -1.59705982
   H         -2.27881957      0.00000000      0.85336408
   H          2.27881957      0.00000000      0.85336408
   H          1.31813560      0.00000000     -1.59705982
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-09r"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
