using DoNOF

mol = """
1 2
   C         -2.39839190      0.07528217     -0.37062379
   C         -1.16157435     -0.36331161      0.37129923
   O          0.00000000      0.00000000     -0.32990997
   C          1.16157435      0.36331161      0.37129923
   C          2.39839190     -0.07528217     -0.37062379
   H         -3.26574268     -0.33460863      0.14857220
   H         -2.40169242     -0.29019837     -1.39749755
   H         -2.46903557      1.16418912     -0.37189715
   H         -1.10654175     -1.47611553      0.37046845
   H         -1.08654785     -0.03933810      1.41463359
   H          1.08654785      0.03933810      1.41463359
   H          1.10654175      1.47611553      0.37046845
   H          2.46903557     -1.16418912     -0.37189715
   H          3.26574268      0.33460863      0.14857220
   H          2.40169242      0.29019837     -1.39749755
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-2e"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
