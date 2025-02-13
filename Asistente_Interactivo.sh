#!/bin/bash

# Función para mostrar la bienvenida
bienvenida(){
    echo -e "\e[1;34m##################################\e[0m"
    echo -e "\e[1;34m#                                #\e[0m"
    echo -e "\e[1;34m#   Bienvenido a tu asistente    #\e[0m"
    echo -e "\e[1;34m#                                #\e[0m"
    echo -e "\e[1;34m##################################\e[0m"
    echo -e "\n\n"
}

# Función para mostrar el menú inicial
menuinicial(){
  while true; do
    echo -e "\e[1;32m1-. Comandos básicos\e[0m"
    echo -e "\e[1;32m2-. Gestión de ficheros\e[0m"
    echo -e "\e[1;32m3-. Gestión de directorios\e[0m"
    echo -e "\e[1;32m4-. Gestión de permisos\e[0m"
    echo -e "\e[1;32m5-. Gestión de usuarios\e[0m"
    echo -e "\e[1;32m6-. Gestión de red\e[0m"
    echo -e "\e[1;32m7-. Acceso a ficheros del sistema\e[0m"
    echo -e "\e[1;32m8-. Calculadora\e[0m"
    echo -e "\e[1;31m9-. Salir\e[0m"
    read -p "Introduzca el número en función de lo que desee hacer: " hacer
    echo " "

    case $hacer in
      1)
       clear
        menucomandos
        ;;
      2)
       clear
        menuficheros
        ;;
      3)
       clear
        menudirectorios
        ;;
      4)
       clear
        menupermisos
        ;;
      5)
       clear
        menuusuarios
        ;;
      6)
       clear
        menured
        ;;
      7)
       clear
        acceso_ficheros
        ;;
      8)
       clear
        calculadora
        ;;
      9)
        echo -e "\e[1;31mSaliendo...\e[0m"
        exit 0
        ;;
      *)
        echo -e "\e[1;31mOpción no válida. Por favor, elige una opción válida.\e[0m"
        ;;
    esac
  done
}

#########
# Función para los comandos básicos
menucomandos(){
  while true; do
    echo -e "\e[1;35m****************************************\e[0m"
    echo -e "\e[1;35m*           Comandos Básicos           *\e[0m"
    echo -e "\e[1;35m****************************************\e[0m"
    echo -e "\e[1;33m1. Mostrar la estructura de directorios y archivos en formato de árbol.\e[0m"
    echo -e "\e[1;33m2. Mostrar el contenido de un fichero\e[0m"
    echo -e "\e[1;33m3. Mostrar el directorio actual\e[0m"
    echo -e "\e[1;33m4. Cambiar de directorio\e[0m"
    echo -e "\e[1;33m5. Imprimir texto o variables\e[0m"
    echo -e "\e[1;33m6. Mostrar el calendario\e[0m"
    echo -e "\e[1;33m7. Limpiar la pantalla\e[0m"
    echo -e "\e[1;33m8. Mostrar la información detallada sobre un directorio\e[0m"
    echo -e "\e[1;33m9. Mostrar el usuario actual\e[0m"
    echo -e "\e[1;33m10. Mostrar el historial de comandos\e[0m"
    echo -e "\e[1;33m11. Volver al menu principal\e[0m"
    echo -e "\n"
    read -p "¿Qué opción quieres elegir? Introduce el número correspondiente: " comandos

    case $comandos in
    1)
      clear
      tree -a
      ;;
    2)
      clear
      ls
      read -p "Introduce el archivo: " archivo_nombre
      cat "$archivo_nombre"
      ;;
    3)
      clear
      pwd
      ;;
    4)
      clear
      ls
      directorio_destino
      cd "$directorio_destino"
      ;;
    5)
      clear
      read -p "Introduce el texto a imprimir: " textoecho
      echo "$textoecho" 
      ;;
    6)
      clear
      echo "Mes = m"
      echo "Año = a"
      read -p "¿Quieres ver el calendario de un mes o de un año completo?: " calendario
      if [ "$calendario" == "m" ]; then
          preguntar_mes
          preguntar_anio
          cal "$preguntar_mes" "$preguntar_anio"
      elif [ "$calendario" == "a" ]; then
          preguntar_anio
          cal $preguntar_anio
      else 
      echo "Introduce una respuesta valida (m/a)"
      fi
      ;;
    7)
      clear
      ;;
    8)
      clear
      directorio_nombre
      stat "$directorio_nombre"
 ;;
    9)
      clear
      echo "El usuario actual es: "
     whoami
      ;;
    10)
      clear
      history
      ;;
      11)
      clear
      menuinicial
      ;;
    *)
      echo -e "\e[1;31mOpción no válida, por favor selecciona un comando válido.\e[0m"
      ;;
    esac

    echo -e "\n¿Quieres hacer otra operación? (s/n)"
    read continuar
    clear
    if [[ "$continuar" != "s" ]]; then
    clear
      break
    fi
  done
}
#########
#########
#########
#########
#########
# Función para gestión de ficheros
menuficheros(){
  while true; do
    echo -e "\033[1;34m*******************************************\033[0m"
    echo -e "\033[1;34m*       Gestión de Ficheros en Linux      *\033[0m"
    echo -e "\033[1;34m*******************************************\033[0m"
    mostrar_ficheros
    echo -e "\033[1;34m*******************************************\033[0m"
    echo -e "\033[1;33mOpciones de comandos disponibles: \033[0m"
    echo "1. Crear un fichero vacío"
    echo "2. Elimina un fichero"
    echo "3. Copiar un archivo"
    echo "4. Comprimir un archivo"
    echo "5. Descomprimir un archivo"
    echo "6. Lee el contenido de un fichero"
    echo "7. Editar un fichero"
    echo "8. Volver al menu principal"
    echo -e "\n"
    read -p "¿Qué opción deseas escoger? Introduce el número correspondiente: " opcion_fichero

    case $opcion_fichero in
    1)
      clear
    mostrar_ficheros
    archivo_nombre
      touch "$archivo_nombre"
      echo -e "\033[1;32mFichero vacío creado: $archivo_nombre\033[0m"
      ;;
    2)
      clear
      mostrar_ficheros
      archivo_nombre
      rm "$archivo_nombre"
      echo -e "\033[1;31mFichero eliminado: $archivo_nombre\033[0m"
      ;;
    3)
      clear
      mostrar_ficheros
      archivo_origen
      ruta_destino
      rsync -av "$archivo_origen" "$ruta_destino"
      echo -e "\033[1;32mArchivo copiado de $archivo_origen a $ruta_destino\033[0m"
      ;;
    4)
     clear
      mostrar_ficheros
      archivo_origen
      tar -czf "$archivo_origen.tar.gz" "$archivo_origen"
      rm "$archivo_origen.tar.gz" && rm "$archivo_origen"
      ;;
    5)
    clear
    mostrar_ficheros
    ruta_destino
    archivo_destino
  ## El -f es para verificar que existe el archivo
     if [ -f "$archivo_destino.tar.gz" ]; then
    tar -xzf "$archivo_destino.tar.gz" -C "$ruta_destino"
     else
        echo "El archivo $archivo_destino.tar.gz no existe."
    fi
    ;;
    6)
      clear
      mostrar_ficheros
     archivo_nombre
      echo "Para salir, pulse 'q'."
      echo "Para ir hacia atrás, pulse 'b'."
      echo "Para ir hacia adelante, pulse 'SPACE'."
       more "$archivo_nombre"
      ;;
     7)
      clear
      mostrar_ficheros
      archivo_nombre
      nano "$archivo_nombre"
      ;;
     8)
       clear
	menuinicial
      ;;
    *)
      echo -e "\033[1;31mOpción no válida, por favor selecciona un comando válido.\033[0m"
      ;;
    esac

    echo -e "\n¿Quieres realizar otra operación? (s/n)"
    read continuar
    clear
    if [[ "$continuar" != "s" ]]; then
       clear
	break
    fi
  done
}

#########
#########
#########
#########
#########
# Función para gestión de directorios
menudirectorios(){
  while true; do
    echo -e "\033[1;34m**********************************************\033[0m"
    echo -e "\033[1;34m*       Gestión de Directorios en Linux      *\033[0m"
    echo -e "\033[1;34m**********************************************\033[0m"
    echo -e "\033[1;32mEstos son los directorios que tienes: \033[0m"
    ls -d */
    echo -e "\033[1;34m*******************************************\033[0m"
    echo -e "\033[1;33mOpciones de comandos disponibles: \033[0m"
    echo "1. Crea un directorio"
    echo "2. Elimina un directorio"
    echo "3. Mueve un directorio o lo renombra"
    echo "4. Cambias al directorio especificado"
    echo "5. Copias un directorio y su contenido"
    echo "6. Volver al menu principal"
    echo -e "\n"
    read -p "¿Qué opción deseas escoger? Introduce el número correspondiente: " opcion_directorio

    case $opcion_directorio in
    1)
      clear
      ls -d */
      directorio_crear
      mkdir "$directorio_crear"
      echo -e "\033[1;32mHas creado el directorio: $directorio_crear\033[0m"
      ;;
    2)
      clear
      ls -d */
      directorio_nombre
      rm -rf "$directorio_nombre"
      echo -e "\033[1;31mHas borrado el directorio: $directorio_nombre\033[0m"
      ;;
    3)
      clear
      echo -e "\033[38;5;214mEstos son los directorios que tienes:\033[0m"
      ls -d  */
      echo -e "\n"
      echo "Mover = 1"
      echo "Renombrar = 2"
      read -p "Introduzca el número de la opción que desea ejecutar: " mover_archivo
      if [ "$mover_archivo" -eq 1 ]; then
        directorio_origen
        ruta_destino
        mv "$directorio_origen" "$ruta_destino"
        echo -e "\033[1;32mHas movido $directorio_origen a $ruta_destino\033[0m"
      elif [ "$mover_archivo" -eq 2 ]; then
       directorio_origen
       directorio_destino
        mv "directorio_origen" "$directorio_destino"
        echo -e "\033[1;32mHas renombrado de $directorio_origen a $directorio_destino\033[0m"
      else
        echo -e "\033[1;31mOpción no válida.\033[0m"
      fi
      ;;
    4)
      clear
      echo -e "\033[38;5;214mEstos son los directorios que tienes:\033[0m"
      ls -d  */
      echo -e "\n"
      ruta_destino
      cd "$ruta_destino" || { echo -e "\033[1;31mNo se pudo acceder al directorio\033[0m"; break; }
      echo -e "\033[1;32mTe has movido a: $ruta_destino\033[0m"
      ;;
    5)
      clear
      echo -e "\033[38;5;214mEstos son los directorios que tienes:\033[0m"
      ls -d  */
      echo -e "\n"
      directorio_origen
      ruta_destino
      cp -r "$directorio_origen" "$ruta_destino"
      echo -e "\033[1;32mHas copiado $directorio_origen en $ruta_destino\033[0m"
      ;;
     6)
      clear
      menuinicial
      ;; 
      *)
      echo -e "\033[1;31mOpción no válida. Por favor, elige una opción válida.\033[0m"
      ;;
    esac

    echo -e "\n¿Quieres realizar otra operación? (s/n)"
    read continuar
    clear
    if [[ "$continuar" != "s" ]]; then
      clear
      break
    fi
  done
}
#########
#########
#########
#########
#########
# Función para administrar los permisos de los ficheros
menupermisos(){
  while true; do
    echo -e "\033[1;34m****************************************************\033[0m"
    echo -e "\033[1;34m*     Gestión de Permisos sobre ficheros Linux     *\033[0m"
    echo -e "\033[1;34m****************************************************\033[0m"
    echo -e "\n"
    echo -e "\033[1;33m1.  > Añadir\033[0m"
    echo -e "\033[1;33m2.  > Eliminar\033[0m"
    echo -e "\033[1;33m3.  > Asignar\033[0m"
    echo -e "\033[1;33m4.  > Cambiar la mascara por defecto (umask)\033[0m"
    echo -e "\033[1;33m5.  > Volver al menu principal \033[0m"
    read -p "¿Qué opción quieres realizar? Introduce el número correspondiente: " opcion_permisos
    case $opcion_permisos in
    1)
    clear
    preguntar_usuario
    clear
    echo -e "\033[1;33mEjecución = x\033[0m"
    echo -e "\033[1;33mLectura = r\033[0m"
    echo -e "\033[1;33mEscritura = w\033[0m"
    read -p "¿Que permisos deseas añadir? (r/w/x): " permisos_add
     clear
      echo -e "\033[1;92m"
      ls
      echo -e "\033[0m"
       echo -e "\n"
      lugar_permisos
      chmod "$preguntar_usuario"+"$permisos_add" "$lugar_permisos"
      echo -e "\033[1;32mPermisos añadidos correctamente\033[0m"
       ls -l
      ;;
    2)
        clear
        preguntar_usuario
      clear
    echo -e "\033[1;33mEjecución = x\033[0m"
    echo -e "\033[1;33mLectura = r\033[0m"
    echo -e "\033[1;33mEscritura = w\033[0m"
    read -p "¿Que permisos deseas eliminar? (r/w/x): " permisosdel
      clear
      echo -e "\033[1;92m"
      ls
      echo -e "\033[0m"
      lugar_permisos
      chmod "$preguntar_usuario"-"$permisos_del" "$lugar_permisos"
      echo -e "\033[1;32mPermisos eliminados correctamente\033[0m"
      ls -l
      ;;
    3)
   clear
   preguntar_usuario
      clear
    echo -e "\033[1;33mEjecución = x\033[0m"
    echo -e "\033[1;33mLectura = r\033[0m"
    echo -e "\033[1;33mEscritura = w\033[0m"
    read -p "¿Que permisos deseas asignar? (r/w/x): " permisos_asign
      clear
      echo -e "\033[1;92m"
      ls
      echo -e "\033[0m"
      lugar_permisos
      chmod "$preguntar_usuario"="$permisos_asign" "$lugar_permisos"
      echo -e "\033[1;32mPermisos asignados correctamente\033[0m"
      ls -l
      ;;
  4)
      clear
      
    ##usuario
    usuario_permisos(){
    echo -e "\033[1;33mEjecución = x\033[0m"
    echo -e "\033[1;33mLectura = r\033[0m"
    echo -e "\033[1;33mEscritura = w\033[0m"
    echo -e "\033[1;33mTodos = t\033[0m"
    echo -e "\033[1;33mNinguno = n\033[0m"
    read -p "Permisos por defecto para el usuario (x/r/w/t/n): " permisos_umask_usuario
    if [ "$permisos_umask_usuario" = "r" ]; then
    permisos_usuario=4;
    elif [ "$permisos_umask_usuario" = "w" ]; then
    permisos_usuario=2;
    elif [ "$permisos_umask_usuario" = "x" ]; then
    permisos_usuario=1; 
    elif [ "$permisos_umask_usuario" = "n" ]; then
    permisos_usuario=0;
    elif [ "$permisos_umask_usuario" = "wr" ] || [ "$permisos_umask_usuario" = "rw" ]; then
    permisos_usuario=6;
    elif [ "$permisos_umask_usuario" = "xr" ] || [ "$permisos_umask_usuario" = "rx" ]; then
    permisos_usuario=3;
    elif [ "$permisos_umask_usuario" = "xw" ] || [ "$permisos_umask_usuario" = "wx" ]; then
    permisos_usuario=5;
    elif [ "$permisos_umask_usuario" = "t" ]; then
    permisos_usuario=7;
   else 
    clear
echo -e "\033[1;31m\033[1mIntroduce una opción válida\033[0m"
    usuario_permisos
    fi
    }
    usuario_permisos
    clear
    ##grupo
    grupo_permisos(){
    echo -e "\033[1;33mEjecución = x\033[0m"
    echo -e "\033[1;33mLectura = r\033[0m"
    echo -e "\033[1;33mEscritura = w\033[0m"
    echo -e "\033[1;33mTodos = t\033[0m"
    echo -e "\033[1;33mNinguno = n\033[0m"
    read -p "Permisos por defecto para el grupo (x/r/w/t/n): " permisos_umask_grupo
    if [ "$permisos_umask_grupo" = "r" ]; then
    permisos_grupo=4;
    elif [ "$permisos_umask_grupo" = "w" ]; then
    permisos_grupo=2;
    elif [ "$permisos_umask_grupo" = "x" ]; then
    permisos_grupo=1;
    elif [ "$permisos_umask_grupo" = "n" ]; then
    permisos_grupo=0;
    elif [ "$permisos_umask_grupo" = "wr" ] || [ "$permisos_umask_grupo" = "rw" ]; then
    permisos_grupo=6;
    elif [ "$permisos_umask_grupo" = "xr" ] || [ "$permisos_umask_grupo" = "rx" ]; then
    permisos_grupo=3;
    elif [ "$permisos_umask_grupo" = "xw" ] || [ "$permisos_umask_grupo" = "wx" ]; then
    permisos_grupo=5;
    elif [ "$permisos_umask_grupo" = "t" ]; then
    permisos_grupo=7;
    else 
    clear
echo -e "\033[1;31m\033[1mIntroduce una opción válida\033[0m"

    grupo_permisos
    fi
    }
    grupo_permisos
    clear
##otros
otros_permisos(){
    echo -e "\033[1;33mEjecución = x\033[0m"
    echo -e "\033[1;33mLectura = r\033[0m"
    echo -e "\033[1;33mEscritura = w\033[0m"
    echo -e "\033[1;33mTodos = t\033[0m"
    echo -e "\033[1;33mNinguno = n\033[0m"
    read -p "Permisos por defecto para el otros (x/r/w/t/n): " permisos_umask_otros
    if [ "$permisos_umask_otros" = "r" ]; then
    permisos_otros=4;
    elif [ "$permisos_umask_otros" = "w" ]; then
    permisos_otros=2;
    elif [ "$permisos_umask_otros" = "x" ]; then
    permisos_otros=1;
    elif [ "$permisos_umask_otros" = "n" ]; then
    permisos_otros=0;
    elif [ "$permisos_umask_otros" = "wr" ] || [ "$permisos_umask_otros" = "rw" ]; then
    permisos_otros=6;
    elif [ "$permisos_umask_otros" = "xr" ] || [ "$permisos_umask_otros" = "rx" ]; then
    permisos_otros=3;
    elif [ "$permisos_umask_otros" = "xw" ] || [ "$permisos_umask_otros" = "wx" ]; then
    permisos_otros=5;
    elif [ "$permisos_umask_otros" = "t" ]; then
    permisos_otros=7;
    else 
    clear
echo -e "\033[1;31m\033[1mIntroduce una opción válida\033[0m"
    otros_permisos
    fi
    }
    otros_permisos
    clear

	valor_umask_usuario=$((7 - permisos_usuario))  
	valor_umask_grupo=$((7 - permisos_grupo))
	valor_umask_otros=$((7 - permisos_otros))
	valor_umask="$valor_umask_usuario$valor_umask_grupo$valor_umask_otros"
     sed -i '/^umask/d' ~/.bashrc
      echo "umask $valor_umask" >> ~/.bashrc
      umask $valor_umask
      source ~/.bashrc
      clear
      echo -e "\033[1;32mMáscara por defecto cambiada a: $valor_umask\033[0m"
      ;;
   5)
      clear
      menuinicial	
      ;;
    *)
      echo -e "\033[1;31mOpción no válida. Por favor, elige una opción válida.\033[0m"
      ;;
    esac

    echo -e "\n¿Quieres realizar otra operación? (s/n)"
    read continuar
    clear
    if [[ "$continuar" != "s" ]]; then
      clear
      break
    fi
  done
}



#########
#########
#########
#########
#########
# Funciones para realizar con usuarios
menuusuarios(){
  while true; do
    echo -e "\033[1;34m*************************************************\033[0m"
    echo -e "\033[1;34m*     Gestión de Operaciones sobre Usuarios     *\033[0m"
    echo -e "\033[1;34m*************************************************\033[0m"
    echo -e "\n"
    echo -e "\033[1;33mOpciones de comandos disponibles:\033[0m"
    echo "1. Crea un usuario"
    echo "2. Modifica o actualiza un usuario"
    echo "3. Elimina un usuario"
    echo "4. Muestra información sobre un usuario"
    echo "5. Muestra todos los usuarios del sistema"
    echo "6. Cambia la contraseña de un usuario"
    echo "7. Volver al menu principal"
    read -p "Introduzca el número de la opción que desea escoger: " opcion_usuarios

    case $opcion_usuarios in
    1)
      clear
     usuario_a_elegir
      useradd "$usuario_a_elegir"
      echo -e "\033[1;32mHas creado el usuario $usuario_a_elegir\033[0m"
      ;;
    2)
      clear
      echo -e "\033[1;33mElija alguna de las opciones disponibles:\033[0m"
      echo "-l > Cambia el nombre de usuario"
      echo "-g > Cambia el grupo del usuario"
      echo "-d > Cambia el directorio home del usuario"
      echo "-s > Cambia la shell del usuario"
      read -p "¿Qué parámetro desea ejecutar?" parametromod
      usuario_a_elegir
      case $parametromod in
      -l)
        read -p "Introduzca el nuevo nombre del usuario: " nuevonombre
        usermod -l "$nuevonombre" "$usuario_a_elegir"
        ;;
      -g)
        read -p "Introduzca el nombre del grupo al que desea pertenecer: " nombregrupo
        usermod -g "$nombregrupo" "$usuario_a_elegir"
        ;;
      -d)
        read -p "Introduzca el nombre del nuevo directorio home: " directoriohome
        usermod -d "$directoriohome" -m "$usuario_a_elegir"
        ;;
      -s)
        read -p "Introduce la nueva shell: " nuevashell
        usermod -s "$nuevashell" "$usuario_a_elegir"
        ;;
      *)
        echo -e "\033[1;31mOpción no válida.\033[0m"
        ;;
      esac
      ;;
    3)
      clear
     usuario_a_elegir
      userdel "$usuario_a_elegir"
      echo -e "\033[1;32mHas eliminado el usuario $usuario_a_elegir\033[0m"
      ;;
    4)
      clear
      usuario_a_elegir
      id "$usuario_a_elegir"
      ;;
    5)
      clear
      cat /etc/passwd
      ;;
    6)
      clear
      echo -e "\033[1;33m***RECUERDA TENER LOS PERMISOS NECESARIOS***\033[0m"
      echo "1 = Sí"
      echo "2 = No"
      read -p "¿Deseas continuar? Introduzca el número correspondiente: " continuarpasswd
      if [ "$continuarpasswd" -eq 1 ]; then
        usuario_a_elegir
        read -p "Introduce la nueva contraseña: " nuevacontrasena
        echo "$usuario_a_elegir:$nuevacontrasena" | sudo chpasswd
        echo -e "\033[1;32mContraseña cambiada con éxito\033[0m"
      else 
        echo -e "\033[1;31mRevisa los permisos antes de continuar\033[0m"
      fi
      ;;
      7)
        clear
	menuinicial
_	;;
      *)
      echo -e "\033[1;31mOpción no válida.\033[0m"
      ;;
    esac

    echo -e "\n¿Quieres realizar otra operación? (s/n)"
    read continuar
    clear
    if [[ "$continuar" != "s" ]]; then
      clear
      break
    fi
  done
}
#########
#########
#########
#########
#########
# Función para gestionar las opciones de red
menured(){
  while true; do
    echo -e "\033[1;34m*****************************\033[0m"
    echo -e "\033[1;34m*     Gestión de la Red     *\033[0m"
    echo -e "\033[1;34m*****************************\033[0m"
    echo -e "\n"
    echo -e "\033[1;33m1. Interfaces de red\033[0m"
    echo -e "\033[1;33m2. Conectividad de red\033[0m"
    echo -e "\033[1;33m3. Tabla de enrutamiento\033[0m"
    echo -e "\033[1;33m4. Puertos y servicios\033[0m"
    echo -e "\033[1;33m5. Volver al menu principal\033[0m"
    read -p "¿Qué opción desea elegir? Introduzca el número correspondiente: " opcionred

    case $opcionred in
    1)
      echo -e "\033[1;33m1. Ver configuración de red\033[0m"
      echo -e "\033[1;33m2. Activar interfaz de red\033[0m"
      echo -e "\033[1;33m3. Desactivar interfaz de red\033[0m"
      echo -e "\033[1;33m4. Ver estado y configuración de todas las interfaces\033[0m"
      read -p "Introduzca el número correspondiente a su elección: " opcioninterfaz
      case $opcioninterfaz in
      1)
        clear
        ip a
        ;;
      2)
        clear
        preguntar_interfaz
        sudo ip link set "$preguntar_interfaz" up
        ;;
      3)
        clear
        preguntar_interfaz
        sudo ip link set "$preguntar_interfaz" down
        ;;
      4)
        clear
        echo -e "\033[1;33m1 = Sí\033[0m"
        echo -e "\033[1;33m2 = No\033[0m"
        read -p "¿Tienes permisos?: " respuesta
        if [ "$respuesta" -eq 1 ]; then
          sudo ip link show
        else 
          echo -e "\033[1;31mEntonces no puedes realizar esta operación\033[0m"
        fi
        ;;
      *)
        echo -e "\033[1;31mIntroduce una opción válida\033[0m"
        ;;
      esac
      ;;
    2)
      clear
      echo -e "\033[1;33m1. Conectividad con otro host\033[0m"
      echo -e "\033[1;33m2. Camino de los paquetes para llegar a un destino\033[0m"
      echo -e "\033[1;33m3. Consulta DNS\033[0m"
      read -p "Introduzca el número correspondiente a su elección: " opcionconectividad
      case $opcionconectividad in
      1)
        clear
        preguntar_host
        ping $preguntar_host
        ;;
      2)
	clear
	if ! command -v traceroute &> /dev/null; then
    	echo "Traceroute no está instalado. ¿Quieres instalarlo? (s/n)"
    	read respuesta

    	if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
        # Instalar traceroute
        echo "Instalando traceroute..."
        sudo apt-get update
        sudo apt-get install -y traceroute
   	 else
        echo "No se instalará traceroute"
       clear
       menured
    	fi
	fi
	clear
	echo "Por favor, ingrese el host para hacer traceroute:"
	read preguntar_host
	traceroute $preguntar_host

        ;;
      3)
        clear
        read -p "Introduzca el nombre del dominio: " nombredominio
        read -p "¿Quieres usar nslookup o dig? " opciondominio
        if [ "$opciondominio" == "nslookup" ]; then
          nslookup $nombredominio
        elif [ "$opciondominio" == "dig" ]; then
          dig $nombredominio
        else 
          echo -e "\033[1;31mEscriba una opción válida\033[0m"
        fi
        ;;
      *)
        echo -e "\033[1;31mIntroduce una opción válida\033[0m"
        ;;
      esac
      ;;
    3)
      clear
      echo -e "\033[1;31mPara realizar las siguientes opciones debe tener privilegios.\033[0m"
      echo -e "\n"
      read -p "¿Tiene privilegios? (s/n): " privilegiosenrutamiento
      if [[ "$privilegiosenrutamiento" =~ ^(s|si|sí|S|SI|SÍ)$ ]]; then
        echo -e "\033[1;33m1. Consultar tablas de enrutamiento\033[0m"
        echo -e "\033[1;33m2. Agregar una nueva ruta\033[0m"
        echo -e "\033[1;33m3. Eliminar una ruta existente\033[0m"
        read -p "Escriba el número correspondiente: " opcionenrutamiento
        case $opcionenrutamiento in
        1)
          clear
          sudo ip route show
          ;;
        2)
          clear
          preguntar_red
          read -p "Escriba su Puerta de Enlace (P.E): " puerta_enlace_enrutamiento
          sudo ip route add $preguntar_red via $puerta_enlace_enrutamiento
          ;;
        3)
          clear
          preguntar_red
          sudo ip route del $preguntar_red
          ;;
        *)
          echo -e "\033[1;31mIntroduzca una opción válida\033[0m"
          ;;
        esac
      else
        echo -e "\033[1;31mLo siento, no puedes usar esta función.\033[0m"
      fi
      ;;
    4)
      clear
      echo -e "\033[1;33m1. Ver puertos y servicios activos\033[0m"
      echo -e "\033[1;33m2. Gestión de servicios\033[0m"
      read -p "Introduzca el número correspondiente a la opción que desea realizar: " opcion_puertos_y_servicios
      case $opcion_puertos_y_servicios in
      1)
        clear
        ss -tuln
        ;;
      2)
        clear
        echo -e "\033[1;33m1. Listar servicios en ejecución\033[0m"
        echo -e "\033[1;33m2. Iniciar un servicio\033[0m"
        echo -e "\033[1;33m3. Detener un servicio\033[0m"
        echo -e "\033[1;33m4. Reiniciar un servicio\033[0m"
        echo -e "\033[1;33m5. Bloquear un servicio\033[0m"
        echo -e "\033[1;33m6. Desbloquear un servicio\033[0m"
        echo -e "\033[1;33m7. Mostrar estado de un servicio\033[0m"
        read -p "Introduzca el número para realizar la opción correspondiente: " opcion_gestion_de_servicios
        case $opcion_gestion_de_servicios in
        1)
          clear
          preguntar_servicio
          systemctl list -units --type=$preguntar_servicio
          ;;
        2)
          clear
          preguntar_servicio
          systemctl start $preguntar_servicio
          ;;
        3)
          clear
          preguntar_servicio
          systemctl stop $preguntar_servicio
          ;;
        4)
          clear
          preguntar_servicio
          systemctl restart $preguntar_servicio
          ;;
        5)
          clear
          preguntar_servicio
          systemctl mask $preguntar_servicio
          ;;
        6)
          clear
          preguntar_servicio
          systemctl unmask $preguntar_servicio
          ;;
        7)
          clear
          preguntar_servicio
          systemctl status $preguntar_servicio
          ;;
        *)
          echo -e "\033[1;31mIntroduzca una opción válida\033[0m"
          ;;
        esac
      ;;
      *)
        echo -e "\033[1;31mIntroduce una opción válida\033[0m"
        ;;
      esac
      ;;
      5)
       clear
       menuinicial
      ;;
    *)
      echo -e "\033[1;31mIntroduce una opción válida\033[0m"
      ;;
    esac

    echo -e "\n¿Quieres realizar otra operación? (s/n)"
    read continuar
    clear
    if [[ "$continuar" != "s" ]]; then
      clear
      break
    fi
  done
}

#########
#########
#########
#########
#########
acceso_ficheros(){
  while true; do
    echo -e "\033[1;34m*****************************************\033[0m"
    echo -e "\033[1;34m*     Acceso a ficheros del sistema     *\033[0m"
    echo -e "\033[1;34m*****************************************\033[0m"
    echo -e "\n"
    echo -e "\033[1;32m1. \033[0mRevisar información sobre los usuarios del sistema"
    echo -e "\033[1;32m2. \033[0mVer información sobre los grupos del sistema"
    echo -e "\033[1;32m3. \033[0mVisualizar contraseñas cifradas de los usuarios"
    echo -e "\033[1;32m4. \033[0mRevisar registros del sistema"
    echo -e "\033[1;32m5. \033[0mMirar los nombres de host y sus IPs"
    echo -e "\033[1;32m6. \033[0mVer el nombre del equipo en la red"
    echo -e "\033[1;32m7. \033[0mVisualizar la configuración de los servidores DNS"
    echo -e "\033[1;32m8. \033[0mVolver al menu principal"
    read -p "Introduzca el numero de la opción que dese escoger: " opcion_acceso_ficheros

    case $opcion_acceso_ficheros in
    1)
    clear
    less /etc/passwd
    ;;
    2)
    clear
    less /etc/group
    ;;
    3)
      clear
      read -p "¿Eres sudo o tienes permisos sudoers? (s/n): " privilegio_acceso_ficheros
      if [[ "$privilegio_acceso_ficheros" =~ ^(s|si|sí|S|SI|SÍ)$ ]]; then
        less /etc/shadow
      elif [[ "$privilegio_acceso_ficheros" =~ ^(n|no|NO|No|N)$ ]]; then
        echo -e "\033[1;31mEntonces no puedes visualizar este fichero.\033[0m"
      else
        echo -e "\033[1;31mIntroduzca una respuesta válida.\033[0m"
      fi
      ;;
      4)
      clear
      read -p "¿Eres sudo o tienes permisos sudoers? (s/n): " privilegio_acceso_ficheros
      if [[ "$privilegio_acceso_ficheros" =~ ^(s|si|sí|S|SI|SÍ)$ ]]; then
        less /var/log/syslog
      elif [[ "$privilegio_acceso_ficheros" =~ ^(n|no|NO|No|N)$ ]]; then
        echo -e "\033[1;31mEntonces no puedes visualizar este fichero.\033[0m"
      else
        echo -e "\033[1;31mIntroduzca una respuesta válida.\033[0m"
      fi
      ;;
    5)
    clear
    less /etc/hosts
    ;;
    6)
    clear
    less /etc/hostname
    ;;
    7)
    clear
    cat /etc/resolv.conf
    ;;
    8)
  clear
  menuinicio
    ;;
    *)
      echo -e "\033[1;31mIntroduzca un fichero válido.\033[0m"
      ;;
    esac

    echo -e "\n¿Quieres realizar otra operación? (s/n)"
    read continuar
    clear
    if [[ "$continuar" != "s" ]]; then
      clear
      break
    fi
  done
}

#########
#########
#########
#########
#########
calculadora(){
    while true; do
        clear
 ##La opción -z en Bash verifica si una cadena de texto está vacía; devuelve true si la cadena está vacía y false si tiene algún valor.

        if [ -z "$resultado" ]; then
            read -p "Introduce el primer número: " num1
            read -p "Introduce el segundo número: " num2
        else
            num1=$resultado  # El primer número será el resultado anterior
            echo -e "\033[1;32mUsando el resultado anterior: $resultado\033[0m"
            read -p "Introduce el segundo número: " num2
        fi

        echo -e "\033[1;32m1. Suma\033[0m"
        echo -e "\033[1;32m2. Resta\033[0m"
        echo -e "\033[1;32m3. Multiplicación\033[0m"
        echo -e "\033[1;32m4. División\033[0m"
        echo -e "\033[1;33mIntroduce el numero de la operacion a realizar:\033[0m"
        read opcion

        case $opcion in
            1)
                clear
                resultado=$(echo "$num1 + $num2" | bc)
                echo -e "\033[1;32mResultado de la suma: $resultado\033[0m"
                ;;
            2)
                clear
                resultado=$(echo "$num1 - $num2" | bc)
                echo -e "\033[1;32mResultado de la resta: $resultado\033[0m"
                ;;
            3)
                clear
                resultado=$(echo "$num1 * $num2" | bc)
                echo -e "\033[1;32mResultado de la multiplicación: $resultado\033[0m"
                ;;
            4)
                clear
                if [ "$num2" -eq 0 ]; then
                    echo -e "\033[1;31mError: No se puede dividir entre cero.\033[0m"
                else
                    resultado=$(echo "scale=2; $num1 / $num2" | bc)
                    echo -e "\033[1;32mResultado de la división: $resultado\033[0m"
                fi
                ;;
            *)
                echo -e "\033[1;31mOpción no válida. Intenta de nuevo.\033[0m"
                ;;
        esac

        # Preguntar si el usuario quiere hacer otra operación
        echo -e "\033[1;33m¿Quieres hacer otra operación? (s/n)\033[0m"
        read continuar
        clear
        if [[ "$continuar" != "s" ]]; then
            echo -e "\033[1;34mGracias por usar la calculadora. ¡Hasta luego!\033[0m"
            clear
            break
        fi
    done
}

#########
#########
#########
#########
#########
# Funciones auxiliares para pedir nombres de archivos o directorios
archivo_origen(){
read -p "¿Cómo se llama el fichero/archivo origen? " archivo_origen
}
archivo_destino(){
read -p "¿Cómo se llama el fichero/archivo destino? " archivo_destino
}
directorio_origen(){
read -p "¿Cómo se llama el directorio origen? " directorio_origen
}
directorio_destino(){
read -p "¿Cómo se llama el directorio destino? " directorio_destino
}
archivo_crear(){
read -p "¿Como se llama el fichero a crear? " archivo_crear
}
directorio_crear(){
read -p "¿Como se llama el directorio a crear? " directorio_crear
}
archivo_eliminar(){
read -p "¿Como se llama el fichero a eliminar? " archivo_eliminar
}
directorio_eliminar(){
read -p "¿Como se llama el directorio a eliminar? " directorio_eliminar
}
ruta_origen(){
read -p "Especifique la ruta de origen " ruta_origen
}
ruta_destino(){
read -p "Especifique la ruta de destino " ruta_destino
}
lugar_permisos(){
read -p "¿Sobre que lugar desea gestionar permisos? " lugar_permisos
}
usuario_a_elegir(){
read -p "Redacte el nombre de usuario: " usuario_a_elegir
}
preguntar_interfaz(){
read -p "¿Cómo se llama la interfaz? " preguntar_interfaz
}
preguntar_host(){
read -p "¿Cúal es el host? " preguntar_host
}
preguntar_red(){
read -p "¿Cual es la red? " preguntar_red
}
preguntar_servicio(){
read -p "¿Cómo se llama el servicio? " preguntar_servicio
};
archivo_nombre(){
  read -p "¿Cómo se llama el archivo? " archivo_nombre
}
directorio_nombre(){
  read -p "¿Cómo se llama el directorio? " directorio_nombre
}
preguntar_mes(){
  read -p "Introduce el numero del mes: " preguntar_mes
}
preguntar_anio(){
  read -p "Introduce el numero del año: " preguntar_anio
}
mostrar_ficheros(){
echo -e "\033[1;32mEstos son los ficheros que tienes: \033[0m"
ls -p | grep -v /
}
preguntar_usuario(){
echo "u = usuario"
echo "g = grupo"
echo "o = otros"
echo "a = todos (usuario, grupo y otros)"
read -p "Escoge el indicador de usuario para gestionar (u/g/o/a): " preguntar_usuario
}
# Llamada inicial
bienvenida
menuinicial
