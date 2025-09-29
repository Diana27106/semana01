#!/bin/bash

#Variables
elementos=("git" "jq" "node" "npm" "curl")
arch=(".env.example" ".gitignore" "README.md" "package.json")
dir=("src" "scripts")
USER=$(whoami)
PROYECTO="semana01"

#Verificar herramientas
for herramienta in "${elementos[@]}"
do 
    if command -v "$herramienta" &> /dev/null 2>&1; then
        echo "Herramienta '$herramienta' encontrada"
        VERSION=$($herramienta --version)
        echo $VERSION
    else
        echo "ERROR: La herramienta '$herramienta' no está instalada"
        exit 1
    fi
done

#Verificar Archivos y Directorios
function verificarEstructura(){
    local tipo="$1"
    local lista=()
    local comprobacion=""

    if [ "$tipo" = "archivo" ]; then
        lista=("${arch[@]}")
        comprobacion="-f"
    elif [ "$tipo" = "directorio" ]; then
        lista=("${dir[@]}")
        comprobacion="-d"
    fi

    for valor in "${lista[@]}"
    do
        if [ "$comprobacion" "$valor" ]; then
            echo "$valor encontrado."
        else 
            echo "ERROR: $tipo requerido '$valor' no encontrado" >&2
            exit 1
        fi
    done
}

    cd "/c/Users/$USER/Documents/$PROYECTO" || {
    echo "ERROR: No se pudo entrar al directorio del proyecto"
    exit 1
    }
    verificarEstructura "archivo"
    verificarEstructura "directorio"

    echo "VERIFICACIÓN COMPLETADA CON ÉXITO"
    exit 0
