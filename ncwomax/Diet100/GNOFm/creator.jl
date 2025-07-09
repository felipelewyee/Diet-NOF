using YAML
using Printf

wd = split(pwd(), "/")
benchmark = wd[end-1]

template = """
using DoNOF

mol = \"\"\"
xyz\"\"\"

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = \"rrrr\"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
"""

# Read yaml and look for unique sets
data = YAML.load_file(benchmark * ".yaml")
sets = []
for (reaction, reaction_data) in data
    set_name, reaction_id = split(reaction, ":")
    push!(sets, set_name)
end
sets = Set(sets)
println(sets)

# Generate a list of unique systems
mols_in_sets = Dict()
for set_name in sets
    mols_in_sets[set_name] = String[]
end
# look the yaml for molecules
data = YAML.load_file(benchmark * ".yaml")
for (reaction, reaction_data) in data
    set_name, reaction_id = split(reaction, ":")
    molecules = reaction_data[2:end]
    for (coeff, xyzfile) in molecules
        push!(mols_in_sets[set_name], xyzfile[1:end-4])
    end
end
# turn the list of molecules into sets
for set_name in sets
    mols_in_sets[set_name] = Set(mols_in_sets[set_name])
end

# Generate the xyz files
data = YAML.load_file(benchmark * ".yaml")
for set_name in sets
    mols = mols_in_sets[set_name]
    for mol in mols
        xyz = ""
        for (i, line) in enumerate(eachline(set_name*"-"*mol*".xyz"))
            if (i>=2)
                xyz = xyz * line * "\n"
            end
        end
        open(set_name*"-"*mol*".jl", "w") do fmol
            content = replace(replace(template, "xyz" => xyz), "rrrr" => set_name*"-"*mol)
            print(fmol, content)
        end
    end
end
