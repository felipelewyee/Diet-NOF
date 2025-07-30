using DoNOF

mol = """
0 2
   C          0.86548829      0.00013163     -0.03872055
   C         -0.62448963      0.00029563     -0.01678556
   H         -1.03251704      0.88972021     -0.49738154
   H          1.41935695     -0.92392368      0.03215946
   H         -1.01516003     -0.01320138      1.00832035
   H         -1.03294567     -0.87659407     -0.51989962
   H          1.42026713      0.92357168      0.03230747
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-C2H5"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
