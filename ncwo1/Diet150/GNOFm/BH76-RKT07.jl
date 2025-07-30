using DoNOF

mol = """
0 2
   N         -0.92591642     -0.19600844     -0.21712272
   O          1.40408804     -0.24477239     -0.12485395
   H         -1.07828243     -0.69971666      0.65200752
   H         -1.11401248      0.78373122     -0.02270988
   H          0.19421422     -0.30591036     -0.46774795
   H          1.51990907      0.66267663      0.18042698
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT07"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
