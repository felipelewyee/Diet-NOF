using YAML
using Printf

function get_molecules(data)

    mols = []
    for (set_name, set) in data
        #println(set_name)
        for (system_name, system) in set
            #println("  ", system_name)
            molecules = system["Species"]
            for (molecule_name, molecule) in molecules
                push!(mols, set_name*"-"*string(molecule_name))
            end
        end
    end
    mols = unique(mols)

    return mols

end

data_30 = YAML.load_file("AllElements_030.yaml")
data_50 = YAML.load_file("AllElements_050.yaml")
data_100 = YAML.load_file("AllElements_100.yaml")

mols_30 = get_molecules(data_30)
mols_50 = get_molecules(data_50)
mols_100 = get_molecules(data_100)

mols_100_in_30 = intersect(mols_100, mols_30)
mols_100_in_50 = intersect(mols_100, mols_50)

mols_new = setdiff(mols_100, mols_100_in_50, mols_100_in_30)

println("Repeated with 030:")
s = ""
for molecule_name in mols_100_in_30
    global s = s* string(molecule_name) * ".jl "
end
println(s)
println("Repeated with 050:")
s = ""
for molecule_name in mols_100_in_50
    global s = s* string(molecule_name) * ".jl "
end
println(s)
println("New Molecules:")
s = ""
for molecule_name in mols_new
    global s = s* string(molecule_name) * ".jl "
end
println(s)

###########################
function build_path(rootdir, setname, nof, filename)
    # Construct the path to the output file.
    # The path is constructed by joining the root directory, set name, nof, and filename.

    path = joinpath("/", rootdir, setname, nof, filename * ".out")
    return path
end

function get_nof_fromfile(file)
    # Try to open the file and get the NOF ENergy. If it does not success, return 0.

    try
        Emol = 0
        open(file, "r") do fmol
            for linemol in readlines(fmol)
                if occursin("Final NOF", linemol)
                    Emol = parse(Float64, split(linemol)[6])
                end
            end
        end
        return Emol
    catch
        return 0
    end
end
###########################

fileparts = split(pwd(), "/")[2:end-2]
nof = split(pwd(), "/")[end]
rootdir = join(fileparts, "/")

println("Moving with 030:")
setname = "030"
for molecule_name in mols_100_in_30
    println(string(molecule_name))
    rm(string(molecule_name)*".jl", force=true)
    rm(string(molecule_name)*".jld2", force=true)
    rm(string(molecule_name)*".fchk", force=true)
    rm(string(molecule_name)*".out", force=true)
end

println("Moving with 050:")
setname = "050"
for molecule_name in mols_100_in_50
    println(string(molecule_name))
    rm(string(molecule_name)*".jl", force=true)
    rm(string(molecule_name)*".jld2", force=true)
    rm(string(molecule_name)*".fchk", force=true)
    rm(string(molecule_name)*".out", force=true)
end
