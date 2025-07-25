using DoNOF

mol = """
0 1
   C          0.64643893      0.66204762      0.00000000
   C          0.62059167     -0.72735291      0.00000000
   O         -1.43762017     -1.04803439      0.00000000
   N         -1.81431293      0.12667382      0.00000000
   N         -1.28271604      1.17289417      0.00000000
   H          0.87969100      1.19136240      0.91554310
   H          0.87969100      1.19136240     -0.91554310
   H          0.75411826     -1.28447655      0.91762992
   H          0.75411826     -1.28447655     -0.91762992
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13ts_1a"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
