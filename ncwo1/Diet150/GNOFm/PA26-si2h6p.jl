using DoNOF

mol = """
1 1
Si   -0.0057029    1.5911610   -0.0004416 
Si    0.0057029   -1.5911610   -0.0004416 
H     1.4272938    1.8456341   -0.0575775 
H    -0.6735230    1.8434090    1.2683683 
H    -0.7720257    1.8326085   -1.2146930 
H     0.6735230   -1.8434090    1.2683683 
H     0.7720257   -1.8326085   -1.2146930 
H    -1.4272938   -1.8456341   -0.0575775 
H     0.0000000    0.0000000    0.0086873 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PA26-si2h6p"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
