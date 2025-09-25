#!/bin/bash
elementos=("git" "jq" "node" "npm" "curl")
for i in elementos 
do
    if [!(i --version)] then;
        echo "ERROR: El archivo $i no existe"
        exit 1
    fi
done

USER=$(whoami)
arch=("env.example" ".gitignore" "README.md")
dir=("src" "scripts")
function verificarArchivos(proyecto){
    cd /c/Users/$USER/Documents/$proyecto
    for (i in arch)
    do
    $existe=false;
    if (-f arch[i]); then
        $existe=true;
    else 
        $existe=false;
        exit 1
    fi
    done
}
function verificarDirectorios(proyecto){
    cd /c/Users/$USER/Documents/$proyecto
    for (i in dir)
    do
    $existe=false;
    if (-f dir[i]); then
        $existe=true;
    else 
        $existe=false;
        exit 1
    fi
    done
}
