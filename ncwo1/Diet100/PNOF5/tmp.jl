using YAML

data = YAML.load_file("AllElements_100.yaml")

open("Diet100.ref", "w") do io

    for (set_name, set) in data
        print(io, set_name)
        for (system_name, system) in set
            print(io, " ")
            print(io, system_name)
        end
        println(io, "")
    end

end
