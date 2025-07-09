using DoNOF

mol = """
0 1
Si       0.000000    1.170884    0.000000 
H       -1.389950    1.685125    0.000000 
H        0.695457    1.683694    1.204045 
H        0.695457    1.683694   -1.204045 
Si       0.000000   -1.170884    0.000000 
H        1.389950   -1.685125    0.000000 
H       -0.695457   -1.683694    1.204045 
H       -0.695457   -1.683694   -1.204045 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-si2h6"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
