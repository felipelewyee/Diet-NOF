using DoNOF

mol = """
0 1
o          0.146475898569    1.088670963253    0.004629207803
h          1.119019705605    1.114550739076   -0.000417603189
c         -0.223274576650   -0.271075216825   -0.000142616232
h         -1.309527485474   -0.320355174063    0.004108527553
h          0.129990145525   -0.801811079629   -0.889500394290
h          0.137316312424   -0.809980231706    0.881322878408
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-06A"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
