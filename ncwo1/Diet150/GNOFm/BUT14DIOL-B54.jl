using DoNOF

mol = """
0 1
 C 1.715264 -0.000759 0.55154
 H 1.251245 -0.469933 1.42491
 O 1.917109 -0.958947 -0.485862
 C 0.822107 1.10132 0.004244
 H 0.64233 1.820638 0.808095
 H 1.366929 1.628451 -0.780612
 C -0.509661 0.603563 -0.561462
 H -0.32947 -0.037941 -1.422866
 H -1.095536 1.457227 -0.906231
 H 2.498366 -1.643699 -0.145981
 H 2.668374 0.429436 0.873139
 C -1.34674 -0.159081 0.449109
 H -0.862412 -1.106128 0.702133
 H -1.450154 0.428355 1.369307
 O -2.623311 -0.394154 -0.143821
 H -3.125868 -0.951859 0.45499
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B54"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
