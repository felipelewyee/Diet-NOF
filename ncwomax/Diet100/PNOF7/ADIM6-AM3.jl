using DoNOF

mol = """
0 1
   C          0.00000000      0.00000000      0.61907435
   C          0.00000000      1.26823145     -0.22976692
   C          0.00000000     -1.26823145     -0.22976692
   H          0.87710052      0.00000000      1.27633950
   H         -0.87710052      0.00000000      1.27633950
   H          0.00000000      2.16788377      0.39247932
   H         -0.88388892      1.30485246     -0.87429454
   H          0.88388892      1.30485246     -0.87429454
   H          0.00000000     -2.16788377      0.39247932
   H         -0.88388892     -1.30485246     -0.87429454
   H          0.88388892     -1.30485246     -0.87429454
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ADIM6-AM3"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
