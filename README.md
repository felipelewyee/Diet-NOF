# DietGMTKN55-NOF

Para ejecutar todos los yaml:
``` bash
for ncwo in ncwo1 ncwomax; do
    echo $ncwo
    cd $ncwo
    for set in Diet030 Diet050 Diet100; do
        echo $set
        cd $set
        for nof in PNOF5 PNOF7 GNOF GNOFm20; do
            echo $nof 
            cd $nof
            julia --project=@analyzer ../../../utils/common.jl
            julia --project=@analyzer ../../../utils/cleaner.jl
            julia --project=@analyzer ../../../utils/analyzer.jl
            cd .. 
        done
        cd .. 
    done 
    cd ..
done
```

Para propagar notebooks
``` bash
for set in Diet030 Diet050 Diet100; do
    echo $set
    for method in PNOF5 PNOF7 GNOF GNOFm; do
        echo $method
        cp Diet030-GNOF-PP.ipynb ${set}-${method}-PP.ipynb 
        cp Diet030-GNOF-EP.ipynb ${set}-${method}-EP.ipynb
        sed -i -e "s/GNOF/${method}/g" ${set}-${method}-*.ipynb
    done
    sed -i -e "s/Diet030/${set}/g" ${set}-*.ipynb
done
sed -i -e "s/ncwo1/ncwomax/g" *-EP.ipynb
```

