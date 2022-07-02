#===============================================================================#
# Redacción de artículos académicos con R
# 04. Caso de Estudio de Género
#===============================================================================#


#### Formando la base de datos: ENEMDU dic, 2019 --------------------------


# Crear Directorios: ------------------------------------------------------

    # Crear carpeta de datos:
if(!dir.exists("04_mi_primer_rmd/datos/")){
  dir.create("04_mi_primer_rmd/datos/")
}

    # Crear la carpeta: Diccionarios:
if(!dir.exists("04_mi_primer_rmd/diccionarios/")){
  dir.create("04_mi_primer_rmd/diccionarios/")
}

# Descargar la base de datos ----------------------------------------------

if(!file.exists("04_mi_primer_rmd/enemdu_2019_12.zip")){
  download.file(url = "https://www.ecuadorencifras.gob.ec/documentos/web-inec/EMPLEO/2019/Diciembre/BDD_ENEMDU_2019_12_CSV%20%28DATOS%20ABIERTOS%29.zip",
                destfile = "04_mi_primer_rmd/enemdu_2019_12.zip")
}


# Revisar contenido
enemdu_file <- "04_mi_primer_rmd/enemdu_2019_12.zip"
enemdu_file 
unzip(zipfile = enemdu_file,list = T)


# Base de personas --------------------------------------------------------

# Descomprimir y Extraer: base personas
unzip(zipfile = enemdu_file,
      files = c("enemdu_persona_201912.csv",
                "DICCIONARIO_VARIABLES.zip"),
      exdir = "04_caso_estudio" )

# Crear directorio: datos
file.copy(from = "04_mi_primer_rmd/enemdu_persona_201912.csv",
          to = "04_mi_primer_rmd/datos/enemdu_persona_201912.csv")


# Diccionarios ------------------------------------------------------------

# Descomprimir y Extraer: diccionarios
unzip(zipfile = "04_mi_primer_rmd/DICCIONARIO_VARIABLES.zip",list = T)

# Crear directorio: diccionarios
unzip(zipfile = "04_mi_primer_rmd/DICCIONARIO_VARIABLES.zip",
      files = "enemdu_personas_2019_12.xlsx",
      exdir = "04_mi_primer_rmd/diccionarios")



# Eliminar archivos -------------------------------------------------------
file.remove(c("04_mi_primer_rmd/enemdu_2019_12.zip",
              "04_mi_primer_rmd/enemdu_persona_201912.csv",
              "04_mi_primer_rmd/DICCIONARIO_VARIABLES.zip"))


# Metadato de la base -----------------------------------------------------

identificacion <- list(pais="Ecuador",
                       titulo="Encuesta Nacional de Empleo, Desempleo y Subempleo - Diciembre 2019",
                       subtitulo="RONDA LXVI-12-2019",
                       tipo_estudio="Encuesta Fuerza Laboral",
                       tipo_dato="Encuestapor muestreo (ssd)",
                       unidad_de_analisis=c("Vivienda","Hogar","Personas miembros del hogar"),
                       alcance_tecnico=c("Información de los Miembros del Hogar",
                                         "Características ocupacionales","Ingresos",
                                         "Datos de la Vivienda y el Hogar"),
                       cobertura=c("23 provincias del Ecuador",
                                   "5 ciudades: Quito, Guayaquil, Cuenca, Machala, Ambato",
                                   "exceptúa a Galápagos"))
identificacion
str(identificacion)




