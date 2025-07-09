using DoNOF

mol = """
0 1
o         -0.922075427238    0.661035175532   -0.004511951808
h          0.042193368987    0.628562630671   -0.004158221689
c         -1.383504346250   -0.674416801454    0.003760788250
h         -2.469790848305   -0.643030365379    0.002898366921
h         -1.061479151022   -1.233901361304   -0.877768215069
h         -1.062541236219   -1.222596147687    0.892753686953
o          1.993369735639    0.564530130397   -0.002063767774
h          2.432573874862    0.952682329557   -0.761936449984
h          2.431254029544    0.967134409455    0.751025764305
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-08"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
