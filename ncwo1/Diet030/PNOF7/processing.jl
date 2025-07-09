using YAML
using Printf

template = """
using DoNOF

mol = \"\"\"
xyz\"\"\"

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = \"rrrr\"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
"""

data = YAML.load_file("AllElements_030.yaml")

for (set_name, set) in data
    println(set_name)
    for (system_name, system) in set
        println("  ", system_name)
	molecules = system["Species"]
	for (molecule_name, molecule) in molecules
            println("    ", molecule_name)
	    xyz = @sprintf("%d %d\n", molecule["Charge"], molecule["UHF"] + 1)
	    for (element, position) in zip(molecule["Elements"], molecule["Positions"])
		x, y, z = position
		xyz = xyz * @sprintf("%-2s %10.5f %10.5f %10.5f\n",element, x, y, z)
            end
	    println(xyz)
	    open(set_name*"-"*string(molecule_name)*".jl", "w") do fmol
                content = replace(replace(template, "xyz" => xyz), "rrrr" => set_name*"-"*string(molecule_name))
                print(fmol,content)
            end
        end
    end
end
