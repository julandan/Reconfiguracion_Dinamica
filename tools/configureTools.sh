#------------------------------------------------------------------------------
# Archivo de configuracion PATHs para cada disenador que trabaja en el proyecto
#------------------------------------------------------------------------------
if [ "$(hostname)" = "pc-ogarnica" ]; then
   if  [ ! -d "/cygdrive/t" ]; then 
   subst T: Z:/Documentos/Devel
   fi
   export HOME_PROJECTS="T:"
fi
if [ "$(hostname)" == "Fernando-Laptop" ]; then
   if  [ ! -d "/cygdrive/t" ]; then 
   subst T: C:/Users/Fernando/Desktop/TFM
   fi
   export HOME_PROJECTS="T:"
fi
if [ "$(hostname)" == "pc-gac9" ]; then
   if  [ ! -d "/cygdrive/t" ]; then 
   subst T: C:/EDA
   fi
   export HOME_PROJECTS="T:"
fi

if [ "$(hostname)" == "Lanchares" ]; then
   if  [ ! -d "/cygdrive/t" ]; then 
   subst T: C:/A_REPOSITORIO/investigacion
   fi
   export HOME_PROJECTS="T:"
fi

if [ "$(hostname)" == "PC-Juan" ]; then
   if  [ ! -d "/cygdrive/t" ]; then 
   subst T: C:/A_REPOSITORIO/investigacion
   fi
   export HOME_PROJECTS="T:"
fi

export V_PRODUCT_NAME="Reconfiguracion_Dinamica"
export NAME_PROJECT=${V_PRODUCT_NAME}
export HOME_PROJECT=${HOME_PROJECTS}/${NAME_PROJECT}
export V_HDS="2015.1a"
export V_TOOL_ENTRY="HDS Designer 2015.1a"
export MODELSIM=${HOME_PROJECT}/tools/questa/modelsim.ini

#------------------------------------------------------------------------------
# Print project configuration
#------------------------------------------------------------------------------

echo ------------------------------------
echo HOME_PROJECTS: ${HOME_PROJECTS}
echo HOME_PROJECT: ${HOME_PROJECT}
echo NAME_PROJECT: ${NAME_PROJECT}
echo ------------------------------------
