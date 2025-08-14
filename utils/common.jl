using YAML
using Printf

wd = split(pwd(), "/")
path = wd[1:end-2]
benchmark = wd[end-1]
nof = wd[end]

function get_molecules(data)

    mols = []
    for (reaction_name, reaction) in data
	set_name, system = split(reaction_name, ":")
	for info in reaction
	    if(length(info) == 2)
                mol = info[2][1:end-4]
                push!(mols, set_name*"-"*string(mol))
            end
        end
    end
    mols = unique(mols)

    return mols

end


data_30 =  YAML.load_file(join(vcat(path[1:end-1], ["Diet030", "Diet030.yaml"]), "/"))
data_50 =  YAML.load_file(join(vcat(path[1:end-1], ["Diet050", "Diet050.yaml"]), "/"))
data_100 =  YAML.load_file(join(vcat(path[1:end-1], ["Diet100", "Diet100.yaml"]), "/"))
data_150 =  YAML.load_file(join(vcat(path[1:end-1], ["Diet150", "Diet150.yaml"]), "/"))

mols_30 = get_molecules(data_30)
mols_50 = get_molecules(data_50)
mols_100 = get_molecules(data_100)
mols_150 = get_molecules(data_150)

repeated = []
if benchmark == "Diet050"
    mols_50_in_30 = intersect(mols_50, mols_30)
    repeated = vcat(repeated, mols_50_in_30)
    #println("Repeated with 030:")
    #println(mols_50_in_30)
end

if benchmark == "Diet100"
    mols_100_in_30 = intersect(mols_100, mols_30)
    repeated = vcat(repeated, mols_100_in_30)
    #println("Repeated with 030:")
    #println(mols_100_in_30)

    mols_100_in_50 = intersect(mols_100, mols_50)
    repeated = vcat(repeated, mols_100_in_50)
    #println("Repeated with 050:")
    #println(mols_100_in_50)
end

if benchmark == "Diet150"
    mols_150_in_30 = intersect(mols_150, mols_30)
    repeated = vcat(repeated, mols_150_in_30)
    #println("Repeated with 030:")
    #println(mols_150_in_30)

    mols_150_in_50 = intersect(mols_150, mols_50)
    repeated = vcat(repeated, mols_150_in_50)
    #println("Repeated with 050:")
    #println(mols_150_in_50)

    mols_150_in_100 = intersect(mols_150, mols_100)
    repeated = vcat(repeated, mols_150_in_100)
    #println("Repeated with 100:")
    #println(mols_150_in_100)
end

for molecule_name in repeated
    #println(string(molecule_name))
    rm(string(molecule_name)*".jl", force=true)
    rm(string(molecule_name)*".jld2", force=true)
    rm(string(molecule_name)*".fchk", force=true)
    rm(string(molecule_name)*".out", force=true)
end
