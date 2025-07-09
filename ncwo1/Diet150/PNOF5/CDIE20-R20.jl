using DoNOF

mol = """
0 1
C        0.000000    0.437442    0.000000 
C       -1.388838    0.826404    0.000000 
C       -0.495159    1.787722    0.000000 
C        0.963382   -0.470444    0.000000 
C        0.717224   -1.951788    0.000000 
H       -2.428740    0.552663    0.000000 
H       -0.296759    2.844858    0.000000 
H        1.991556   -0.128558    0.000000 
H        1.152761   -2.436855    0.878551 
H       -0.351235   -2.171268    0.000000 
H        1.152761   -2.436855   -0.878551 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CDIE20-R20"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
