using DoNOF

mol = """
0 1
n         -0.422152864772    0.814215618551   -0.022027612580
h         -0.051533312762    1.321992124167    0.771104778348
h         -0.051410025047    1.278554185326   -0.841286446839
c          0.055599070940   -0.571817828704    0.015433592038
h         -0.336285765616   -1.105843105439   -0.846758136943
h          1.142310227153   -0.678552996670    0.018468087001
h         -0.336527329738   -1.058547997337    0.905065738975
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-06B"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
