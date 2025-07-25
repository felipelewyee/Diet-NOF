using DoNOF

mol = """
0 1
   C         -1.11892819     -0.39300694      0.06045902
   C         -1.06961559      0.98569179     -0.03334154
   O          1.04351911      1.35627307     -0.21429353
   N          1.47852950      0.22573745      0.22941624
   C          0.95782302     -0.89868106     -0.27213199
   H         -1.24594514     -0.86133041      1.03067153
   H         -1.48801729     -0.97414862     -0.77721283
   H         -1.09461977      1.61014793      0.84916022
   H         -1.26644925      1.48844296     -0.97025939
   H          1.75317167      0.20428368      1.21443326
   H          0.82089701     -0.92013135     -1.34318470
   H          1.22963493     -1.82327849      0.22628373
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13ts_7a"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
