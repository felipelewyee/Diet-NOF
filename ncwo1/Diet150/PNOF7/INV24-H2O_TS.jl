using DoNOF

mol = """
0 1
  O   0.00000133070773      0.00005291002884     -0.00000001669992
  H   0.93566024418328      0.00005338458559      0.00000000834999
  H   -0.93566242742156      0.00005248979354      0.00000000834993
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "INV24-H2O_TS"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
