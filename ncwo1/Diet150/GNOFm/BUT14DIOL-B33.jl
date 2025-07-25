using DoNOF

mol = """
0 1
 C 1.873484 -0.516584 0.007526
 H 1.861861 -1.183153 -0.854163
 O 3.102616 0.197951 -0.081139
 C 0.654435 0.395113 -0.024766
 H 0.698253 1.079609 0.828729
 H 0.703009 1.007751 -0.927584
 C -0.652281 -0.394384 0.015254
 H -0.700966 -1.0012 0.921951
 H -0.702397 -1.081057 -0.83239
 H 3.162288 0.762806 0.693902
 H 1.848673 -1.141101 0.906867
 C -1.869447 0.509775 -0.024692
 H -1.846507 1.199186 0.826058
 H -1.855946 1.107449 -0.942046
 O -3.028291 -0.318646 0.025047
 H -3.800011 0.251748 -0.012521
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B33"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
