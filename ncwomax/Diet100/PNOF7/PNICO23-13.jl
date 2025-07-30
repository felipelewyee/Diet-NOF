using DoNOF

mol = """
0 1
N 0.230637 -1.339636 0.000000
N -0.230637 1.339636 0.000000
F 0.230637 -2.752464 0.000000
F -0.230637 2.752464 0.000000
H 0.810027 -1.117741 0.806477
H -0.810027 1.117741 0.806477
H 0.810027 -1.117741 -0.806477
H -0.810027 1.117741 -0.806477
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-13"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
