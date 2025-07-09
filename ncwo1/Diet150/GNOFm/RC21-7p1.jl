using DoNOF

mol = """
1 2
   O         -0.30670512      2.64511661      0.00000000
   C         -0.63184325      1.56797693      0.00000000
   C         -1.04096418      0.26154563      0.00000000
   H         -2.11946896      0.12171112      0.00000000
   C         -0.14087031     -0.80470145      0.00000000
   H         -0.58771554     -1.79369082      0.00000000
   C          1.23330569     -0.69024684      0.00000000
   H          1.74031733      0.26987643      0.00000000
   H          1.85394434     -1.57758761      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-7p1"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
