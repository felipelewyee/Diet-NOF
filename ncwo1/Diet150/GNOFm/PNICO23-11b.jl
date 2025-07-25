using DoNOF

mol = """
0 1
P    -0.1108740   -1.7750845    0.0000000 
H    -1.0689517   -1.7606975    1.0407837 
H    -1.0689517   -1.7606975   -1.0407837 
C     0.1108740   -3.5505920    0.0000000 
N     0.3558729   -4.6732237    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-11b"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
