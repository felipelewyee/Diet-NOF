using DoNOF

mol = """
1 2
   O         -1.48308171      1.34440159     -0.46201835
   C         -1.40031591      0.14302820     -0.61588426
   O         -1.85007644     -0.50050715     -1.63482264
   C         -0.75641466     -0.40466234      0.59332033
   C          0.58018684     -0.23396033      0.85057845
   C          1.54896052      0.52137503      0.06603999
   H         -1.70062763     -1.45723822     -1.57682164
   H         -1.43131691     -0.81514997      1.34128628
   H          0.95443197     -0.74678166      1.73585701
   H          1.14655639      1.00384397     -0.82161048
   H          2.38885388     -0.13873312     -0.19132533
   H          2.00284365      1.28438399      0.71540064
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-7e"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
