using JLD, JLD2, FileIO, Glob

function convert_jld_to_jld2(directory::String)
    # Find all .jld files in the directory
    jld_files = glob("*.jld", directory)

    for jld_file in jld_files
        # Construct the new .jld2 filename
        jld2_file = replace(jld_file, ".jld" => ".jld2")

        try
            # Load the .jld file
            data = load(jld_file)

            # Save the data to a .jld2 file
            save(jld2_file, data)

            println("Converted $jld_file to $jld2_file")

            # Optionally, delete the original .jld file
            # rm(jld_file)
            # println("Deleted $jld_file")

        catch e
            println("Error converting $jld_file: $e")
        end
    end
end

convert_jld_to_jld2(".")
