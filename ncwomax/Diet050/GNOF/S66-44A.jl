using DoNOF

mol = """
0 1
c          0.666194013030    0.000768082520    0.000344523917
h          1.228675456041   -0.512925708490    0.766867407830
h          1.227829191022    0.514165435314   -0.767002195784
c         -0.666179943635   -0.000069266921    0.000219606865
h         -1.228128078640   -0.514541593552    0.766711041245
h         -1.228390637870    0.512603051130   -0.767140384072
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-44A"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
