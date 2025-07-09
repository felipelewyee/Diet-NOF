using YAML
using Printf
using Statistics

wd = split(pwd(), "/")
nof = wd[end]
benchmark = wd[end-1]
ncwo = wd[end-2] 
path = wd[1:end-2]

# Read yaml and look for unique sets
data =  YAML.load_file(join(vcat(path[1:end-1], [benchmark, benchmark * ".yaml"]), "/"))
sets = []
for (reaction, reaction_data) in data
    set_name, reaction_id = split(reaction, ":")
    push!(sets, set_name)
end
sets = Set(sets)
println(sets)

# Generate a list of unique systems
reactions = Dict()
for set_name in sets
    reactions[set_name] = []
end

# look the yaml for reactions
data =  YAML.load_file(join(vcat(path[1:end-1], [benchmark, benchmark * ".yaml"]), "/"))
for (label, reaction_data) in data
    set_name, reaction_id = split(label, ":")
    reac_data = Dict()
    reac_data["Id"] = reaction_id
    reac_data["dE_ref"] = reaction_data[1]
    mols = []
    for (coeff, xyzfile) in reaction_data[2:end]
	    push!(mols, [coeff, xyzfile[1:end-4]])
    end
    reac_data["mols"] = mols
    push!(reactions[set_name], reac_data)
end

function build_path(rootdir, benchname, nof, filename)
    # Construct the path to the output file.
    # The path is constructed by joining the root directory, benchmark name, nof, and filename.

    path = joinpath("/", rootdir, benchname, nof, filename * ".out")
    return path
end

function get_nof_fromfile(file)
    # Try to open the file and get the NOF Energy. If it does not success, return 0.

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

function get_nof_E(nof, filename)
    # Try to get the NOF energy.
    # First, it looks the exact filename in 030, 050, 100 and 150.
    # If it does not find, it looks the molecule in the other reactions within the same set.

    # Root directory. First part is empty. Last two parts are set and nof
    fileparts = split(pwd(), "/")[2:end-2]
    rootdir = join(fileparts, "/")

    # Look exact filename in all sets
    for benchname in ["Diet030", "Diet050", "Diet100", "Diet150"]
        dir = build_path(rootdir, benchname, nof, filename)
        Emol = get_nof_fromfile(dir)
        if Emol < 0
            return Emol
        end
    end

    println("Energy not found:", filename)
    return 0
end

sets = keys(reactions)
for setname in sets
    println(setname)
    for reaction in reactions[setname]
	dE_NOF = 0
	for (i,mol) in enumerate(reaction["mols"])
	    coeff, molname = mol
            E = get_nof_E(nof, setname * "-" * molname)
	    push!(reaction["mols"][i], E)
	    dE_NOF += coeff * E * 627.5
	end
	reaction["dE_NOF"] = dE_NOF
	AD = abs(reaction["dE_ref"] - reaction["dE_NOF"])
	APD = abs(reaction["dE_ref"] - reaction["dE_NOF"])/abs(reaction["dE_ref"]) * 100
	reaction["AD"] = AD
	reaction["APD"] = AD
	println(reaction)
    end
end

#results = Dict()
#
#WTMAD2 = 0
#for (set_name, set) in data
#    println("--------------------------------------")
#    println(set_name)
#    println("--------------------------------------")
#    systems = Dict()
#    for (system_name, system) in set
#	println("---------------")
#        @printf("  %s dE_ref: %.4f \n", system_name, system["Energy"])
#	println("---------------")
#        species = Dict()
#        mol_data = Dict()
#        molecules = system["Species"]
#	dE_NOF = 0
#        for (molecule_name, molecule) in molecules
#            prop = Dict()
#	    E_NOF = get_nof_E(nof, set_name*"-"*string(molecule_name))
#	    dE_NOF += molecule["Count"]*E_NOF
#	    @printf("    %-20s %3d %10.4f \n", molecule_name, molecule["Count"], E_NOF)
#            prop["E_NOF"] = E_NOF
#            prop["Count"] = molecule["Count"]
#            prop["Charge"] = molecule["Charge"]
#            prop["Multiplicity"] = molecule["UHF"]
#            mol_data[molecule_name] = prop
#        end
#        species["E_Ref"] = system["Energy"]
#        species["Energy"] = dE_NOF*627.5
#        species["Species"] = mol_data
#	AD = abs(system["Energy"] - dE_NOF*627.5)
#        APD = abs((system["Energy"] - dE_NOF*627.5)/system["Energy"])*100
#	if(AD < 100)
#            global WTMAD2 += system["Weight"]*AD
#        end
#        species["AD"] = AD
#        species["APD"] = APD
#        species["Weight"] = system["Weight"]
#        species["WTMAD2"] = system["Weight"]*AD/nsystems
#	@printf("  dE NOF: %.4f   AD: %.1f    Weight: %.1f  Contrib: %.1f\n",dE_NOF*627.5, AD, system["Weight"], system["Weight"]*AD/nsystems)
#        systems[system_name] = species
#    results[set_name] = systems
#    end
#end
#WTMAD2 = WTMAD2/nsystems
#@printf("WTMAD2 = %.1f\n", WTMAD2)
#
#YAML.write_file(superset*"-"*nof*"-"*ncwo*".yaml", results)
#
#using Plots
#
#MADs = Dict()
#MAPDs = Dict()
#WTMAD2s = Dict()
#for (set_name, set) in data
#    ADs = []
#    APDs = []
#    WTMAD2s_set = []
#    for (system_name, system) in set
#        molecules = system["Species"]
#        dE_NOF = 0
#        for (molecule_name, molecule) in molecules
#	    E_NOF = get_nof_E(nof, set_name*"-"*string(molecule_name))
#            dE_NOF += molecule["Count"]*E_NOF
#        end
#	AD = abs(system["Energy"] - dE_NOF*627.5)
#	APD = abs((system["Energy"] - dE_NOF*627.5)/system["Energy"]) * 100
#        push!(ADs, AD)
#        push!(APDs, APD)
#	push!(WTMAD2s_set, system["Weight"]*AD)
#    end
#    MADs[set_name] = mean(ADs)
#    MAPDs[set_name] = mean(APDs)
#    WTMAD2s[set_name] = mean(WTMAD2s_set)
#end
#
#function plot_bar(data, ylabel, ylims)
#    cg = cgrad(:RdYlGn, rev=true)
#    colors = get.(Ref(cg), (values(data) .- minimum(values(data))) ./ maximum(values(data)))
#    set_names = collect(keys(data))
#    p = bar(
#        set_names,
#        collect(values(data)),
#        title=nof,
#        ylabel=ylabel,
#        ylims=ylims,
#        xrotation=90,
#        xticks=(0.5:1:size(set_names)[1], set_names),
#        color=colors,
#        legend=false,
#    )
#    display(p)
#end
#
#plot_bar(MADs, "Mean Abs. Dev. (kcal/mol)", (0, 40))
#println("Press the enter key to quit:")
#readline()
#
#plot_bar(MAPDs, "MAPD (%)", (0, 100))
#println("Press the enter key to quit:")
#readline()
#
#plot_bar(WTMAD2s, "WTMAD2 (kcal/mol)", (0, 100))
#println("Press the enter key to quit:")
#readline()
