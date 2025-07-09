using YAML
using Printf
using Statistics

wd = split(pwd(), "/")
nof = wd[end]
superset = wd[end-1]
ncwo = wd[end-2]

data = YAML.load_file("AllElements_"*superset*".yaml")
sets = YAML.load_file("Sets.yaml")
nsystems = parse(Int,superset)
set_names = collect(keys(data))

files = readdir()
deleteat!(files, findall(x->x=="analyzer.jl", files))
deleteat!(files, findall(x->x=="processing.jl", files))
deleteat!(files, findall(x->x=="common.jl", files))
deleteat!(files, findall(x->x=="cleaner.jl", files))
deleteat!(files, findall(x->endswith(x, ".yaml"), files))

for (set_name, set) in data
    for (system_name, system) in set
        molecules = system["Species"]
        for (molecule_name, molecule) in molecules
            deleteat!(files, findall(x->x==set_name*"-"*string(molecule_name)*".jl", files))
            deleteat!(files, findall(x->x==set_name*"-"*string(molecule_name)*".jld2", files))
            deleteat!(files, findall(x->x==set_name*"-"*string(molecule_name)*".fchk", files))
            deleteat!(files, findall(x->x==set_name*"-"*string(molecule_name)*".out", files))
        end
    end
end

for file in files
  rm(file, recursive=true)
end
