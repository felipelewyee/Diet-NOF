# DietGMTKN55-NOF

Para ejecutar todos los yaml:
``` bash
for ncwo in ncwo1 ncwomax; do
    echo $ncwo
    cd $ncwo
    for set in 030 050 100; do
        echo $set
        cd $set
        for nof in PNOF5 PNOF7 GNOF GNOFm; do
            echo $nof 
            cd $nof
            julia --project=@analyzer analyzer.jl
            cd .. 
        done
        cd .. 
    done 
    cd ..
done
```

Para propagar analyzer:
``` bash
for set in 030 050 100; do
    echo $set
    cd $set 
    for method in PNOF5 PNOF7 GNOF GNOFm; do 
        echo $method
        cd $method
        cp ~/Dropbox/Proyectos/DietGMTKN55-NOF/ncwo1/050/GNOF/analyzer.jl .
        julia --project=@analyzer analyzer.jl
        cd ..
    done 
    cd ..
done
```

Para propagar notebooks
``` bash
for set in 030 050 100; do
    echo $set
    cp PP-030-All.ipynb PP-${set}-All.ipynb 
    cp PP-030-All.ipynb EP-${set}-All.ipynb 
    for method in PNOF5 PNOF7 GNOF GNOFm; do
        echo $method
        cp PP-030-PNOF5.ipynb PP-${set}-${method}.ipynb 
        cp PP-030-PNOF5.ipynb EP-${set}-${method}.ipynb
        sed -i -e "s/PNOF5/${method}/g" *-${set}-${method}.ipynb
    done
    sed -i -e "s/030/${set}/g" *-${set}-*.ipynb
done
sed -i -e "s/ncwo1/ncwomax/g" EP-${set}-*.ipynb
```

