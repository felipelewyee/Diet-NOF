using DoNOF

mol = """
0 2
   C          1.12508624     -0.54109829     -0.01266804
   C          0.13617620      0.60269082     -0.06563910
   O         -2.18628273     -0.40939242     -0.09120085
   H          0.96851856     -1.15581281      0.87258914
   H          1.03333748     -1.18092227     -0.88926417
   H          2.14900188     -0.16161205      0.01900401
   H          0.13782247      1.23071308      0.82288881
   H          0.20027491      1.20876281     -0.96670397
   H         -0.96348111      0.11308280     -0.11661088
   H         -2.60045389      0.29358833      0.42760505
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT09"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
