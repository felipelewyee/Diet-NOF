using DoNOF

mol = """
0 1
  H   -0.00632875311476     -0.04084783654691     -0.00818150755843
  N   0.99953758633452     -0.00230969538570     -0.00483617136550
  N   1.47739957561209      1.34271283967645      0.00556578747329
  H   0.71828264706118      2.00420913520683      0.00762829711197
  H   2.03340332052250      1.48238021094367     -0.82227125429861
  H   1.34770704304099     -0.45864761967431      0.82209606377530
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-n2h4_ecl1"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
