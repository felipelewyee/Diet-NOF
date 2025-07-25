using DoNOF

mol = """
0 1
 C 1.925538 -0.344065 0.380533
 H 2.171565 -1.304903 -0.07129
 O 2.348134 0.634893 -0.564793
 C 0.431726 -0.275896 0.677703
 H 0.195657 -1.030802 1.43521
 H 0.211793 0.700307 1.122182
 C -0.432805 -0.490859 -0.562179
 H -0.200153 -1.468025 -0.996749
 H -0.188307 0.261431 -1.311887
 H 2.186325 1.499293 -0.176589
 H 2.497884 -0.257648 1.309244
 C -1.927197 -0.439292 -0.271047
 H -2.488843 -0.625322 -1.185021
 H -2.199555 -1.219011 0.448782
 O -2.362635 0.840111 0.187961
 H -2.053926 0.94532 1.090714
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B30"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
