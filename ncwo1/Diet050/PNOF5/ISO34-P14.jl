using DoNOF

mol = """
0 1
   C          0.00000000      0.00000000      0.48302503
   N          0.00000000      0.00000000     -0.93725005
   C          0.00000000      0.00000000     -2.10375603
   H          0.51295541     -0.88846484      0.85266035
   H          0.51295541      0.88846484      0.85266035
   H         -1.02591082      0.00000000      0.85266035
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-P14"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
