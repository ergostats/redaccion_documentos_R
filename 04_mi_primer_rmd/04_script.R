#===============================================================================#
# Redacción de artículos académicos con R
# 04. Caso de Estudio de Género
#===============================================================================#


#### Formando la base de datos: ENEMDU dic, 2019 --------------------------

# Metadato de la base -----------------------------------------------------

# Como minimo debemos tener:

identificacion <- list(pais="Ecuador",
                       titulo="Encuesta Nacional de Empleo, Desempleo y Subempleo - Diciembre 2019",
                       subtitulo="RONDA LXVI-12-2019",
                       tipo_estudio="Encuesta Fuerza Laboral",
                       tipo_dato="Encuesta por muestreo (ssd)",
                       unidad_de_analisis=c("Vivienda","Hogar","Personas miembros del hogar"),
                       alcance_tecnico=c("Información de los Miembros del Hogar",
                                         "Características ocupacionales","Ingresos",
                                         "Datos de la Vivienda y el Hogar"),
                       cobertura=c("23 provincias del Ecuador",
                                   "5 ciudades: Quito, Guayaquil, Cuenca, Machala, Ambato",
                                   "exceptúa a Galápagos"))
identificacion
str(identificacion)


# Crear Directorios: ------------------------------------------------------

    # Crear carpeta de datos:

if(!dir.exists( "04_mi_primer_rmd/datos/")){
  dir.create( "04_mi_primer_rmd/datos/")
}
  

    # Crear la carpeta: Diccionarios:
  if(!dir.exists( "04_mi_primer_rmd/diccionarios/")){
    dir.create( "04_mi_primer_rmd/diccionarios/")
  }
 

# Descargar la base de datos ----------------------------------------------
  # Enlace: 

enemdu_file <- "04_mi_primer_rmd/enemdu_2019_12.zip"


if(!file.exists(enemdu_file)){
  download.file(url = "https://www.ecuadorencifras.gob.ec/documentos/web-inec/EMPLEO/2019/Diciembre/BDD_ENEMDU_2019_12_CSV%20%28DATOS%20ABIERTOS%29.zip",
                destfile = enemdu_file)
}



  # Archvivo:
                


# Revisar contenido

  unzip()


# Base de personas --------------------------------------------------------

# Descomprimir y Extraer: base personas
unzip()

# Crear directorio: datos
file.copy()


# Diccionarios ------------------------------------------------------------

# Descomprimir y Extraer: diccionarios
unzip()

# Crear directorio: diccionarios
unzip()



# Eliminar archivos -------------------------------------------------------
file.remove()






