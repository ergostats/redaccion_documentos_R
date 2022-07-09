#===============================================================================#
# Redacción de artículos académicos con R
# 05. Cargar la base de datos y modificarla para su uso
#===============================================================================#

path <- "../bdd/enemdu/datos/enemdu_persona_201912.csv" 
#path <- "bdd/enemdu/datos/enemdu_persona_201912.csv" 

enemdu <- read.csv(path, sep = ";", header = T) 

variables <- c(sexo = "p02",
               edad = "p03",
               a_trabajo = "p45",
               nivel_inst = "p10a",
               h_trabajo = "p51a",
               ingresos = "p66")

dicc_path <- list.files("../bdd/enemdu/diccionarios/",full.names = T)
#dicc_path <- list.files("bdd/enemdu/diccionarios/",full.names = T)

library(readxl)

hojas <- excel_sheets(dicc_path)

hoja_1 <- read_excel(path = dicc_path,sheet = hojas[1],range = "C15:G170")

variables <- c(sexo = "p02",
               edad = "p03",
               a_trabajo = "p45",
               nivel_inst = "p10a",
               h_trabajo = "p51a",
               ingresos = "p66")

diccionario <- hoja_1[hoja_1$`CODIGO DE LA VARIABLE` %in% variables, ]

enemdu <- enemdu[ ,variables]

names(enemdu) <- names(variables)

# Corrección de sexo ------------------------------------------------------

sexo <- data.frame(
  stringsAsFactors = FALSE,
  check.names = FALSE,
  Valor = c(1L, 2L),
  Categoria = c("Hombre", "Mujer"),
  Weighted = c(7078625L, 7399504L)
)

enem_sexo <- factor(enemdu$sexo)

enemdu$sexo <- factor(x = enem_sexo,
                      levels = levels(enem_sexo),
                      labels = sexo$Categoria)


# Corrección de nivel de instrucción --------------------------------------

niv_inst <- data.frame(
  stringsAsFactors = FALSE,
  Valor = c("1","2","3","4","5","6",
            "7","8","9","10","Sysmiss"),
  Categoria = c("Ninguno",
                "Centro de alfabetización","Jardín de infantes","Primaria",
                "Educación básica","Secundaria","Educación media",
                "Superior no universitaria","Superior universitaria","Post-grado",NA),
  Weighted = c(744495L,46095L,0L,3490529L,
               3362979L,2908802L,832464L,75651L,1795873L,55783L,
               1165459L))

enem_nivel_inst <- factor(enemdu$nivel_inst)

levels(enem_nivel_inst)

niv_inst <- niv_inst[niv_inst$Valor != "3", ]

nivs <- na.omit(niv_inst$Categoria)

enemdu$nivel_inst <- factor(x = enem_nivel_inst,
                            levels = levels(enem_nivel_inst),
                            labels = nivs)


# Corregir edades ---------------------------------------------------------

posiciones_vacias <- which(enemdu$edad == 99L)

enemdu$edad[posiciones_vacias] <- NA_integer_


# Corregir ingresos -------------------------------------------------------

posiciones_vacias <- which(enemdu$ingresos == 999999L)

enemdu$ingresos[posiciones_vacias] <- NA_integer_


# Borrar objetos temporales -----------------------------------------------

rm("dicc_path","hojas","path","variables","hoja_1","enem_sexo","enem_nivel_inst","nivs")

str(enemdu)
