
# -------------------------------------------------------------------------#
# Redacción de artículos académicos con R
# Modificar base con tidyverse
# -------------------------------------------------------------------------#


# Declarar librería -------------------------------------------------------

library(tidyverse)
library(readxl)
library(flextable)


# Guardar la dirección donde están los datos ------------------------------

# utilizar cuando se ejecuta desde script
#ruta <- "bdd/datos/enemdu_persona_201912.csv"
#ruta_dicc <- list.files("bdd/diccionarios/", full.names = T)

# utilizar cuando se llama al script desde Rmarkdown

# Rutas condicionales:

ruta_actual <- getwd()

# Definir ruta

# Leer la base y guardarla en un objeto -----------------------------------

enemdu <- read_delim(file = ruta, delim = ";" ,na = " ")

# Leer datos en excel (diccionario) ---------------------------------------

ruta_hoja <- excel_sheets(ruta_dicc)
leer_hoja <- read_excel(path = ruta_dicc, sheet = ruta_hoja[1], range = "C15:G170")

# Seleccionar variables del diccionario -----------------------------------

dicc <- leer_hoja %>% 
  filter(`CODIGO DE LA VARIABLE` %in% c("p02", "p03", "p04","p45", "p10a", "p51a", 
                                        "p66", "p63", "p64b", "p65", "p66", 
                                        "p67", "p68b", "p69", "p70b", "p71a","p72b", 
                                        "p72b", "p73b", "p74b", "p76", "p78", "secemp"))


# Seleccionar variables de la base ----------------------------------------

enemdu <- enemdu %>% 
  mutate(id_hogar = str_c(area,ciudad,conglomerado,panelm,vivienda,hogar)) %>% 
  select(id_hogar, p02, p03,p04, p45, 
         p10a, p51a, p66, secemp) %>% 
  rename(sexo = p02, edad = p03, parent = p04,a_job = p45, 
         niv_inst = p10a, h_job = p51a, ing = p66)


# Diccionario de variables ------------------------------------------------

dicc_sexo <- tibble(
  stringsAsFactors = FALSE,
  check.names = FALSE,
  Valor = c(1L, 2L),
  Categoria = c("Hombre", "Mujer"),
  Weighted = c(7078625L, 7399504L)
)

dicc_niv_inst <- tibble(
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


# INGRESOS ----------------------------------------------------------------


# Corrección de sexo ------------------------------------------------------

enemdu <- enemdu %>% 
  mutate(sexo = factor(x = sexo, 
                       levels = dicc_sexo$Valor, 
                       labels = ....))


# Corrección de nivel de instrucción --------------------------------------

# Ver categorías de la variable
table(enemdu$niv_inst)

enemdu <- enemdu %>% 
  mutate(niv_inst = factor(x = niv_inst, 
                           levels = ...., 
                           labels = dicc_niv_inst$Categoria))


# Corregir sectores de los empleados --------------------------------------

enemdu <- enemdu %>% mutate(secemp = case_when( "Empleo Formal",
                                                "Empleo Informal",
                                                "Empleo Domestico",
                                                "Empleo no Clasificado", 
                                               TRUE~ NA_character_),
                            secemp = factor(secemp, 
                                            levels = ...))

enemdu <- enemdu %>% 
  mutate(ing == 999999L)


enemdu %>% 
  map(~is.na(.x)) %>% 
  map(table,useNA = "ifany") %>% 
  map(enframe)






# Corregir edades ---------------------------------------------------------

enemdu <- enemdu %>% 
  mutate(edad = if_else(edad == 99L, NA_real_, edad)) 


# left = 15, right = 66

enemdu_age_work <- enemdu %>% 
  filter()


# Guardado final de la base dependiendo de la ruta relativa:


# Graficos ----------------------------------------------------------------












