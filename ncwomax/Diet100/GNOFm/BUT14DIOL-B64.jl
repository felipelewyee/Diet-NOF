using DoNOF

mol = """
0 1
 C -1.35901 -0.177168 -0.454055
 H -0.837316 -1.11727 -0.614478
 O -2.574821 -0.513522 0.207633
 C -0.498951 0.789038 0.355864
 H -1.0489 1.728151 0.459792
 H -0.376474 0.391416 1.367487
 C 0.870831 1.055143 -0.285902
 H 1.200376 2.070706 -0.05378
 H 0.788572 0.991181 -1.373826
 H -3.080563 0.297145 0.31083
 H -1.556234 0.254447 -1.441206
 C 1.96633 0.105421 0.187969
 H 2.8963 0.326786 -0.33409
 H 2.143367 0.255551 1.257718
 O 1.689517 -1.268065 -0.081611
 H 1.078109 -1.580011 0.590122
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B64"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
