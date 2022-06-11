#===============================================================================#
# Redacción de artículos académicos con R
# 01. Explorando las herramientas de trabajo
#===============================================================================#


# Primeros pasos ----------------------------------------------------------

# COMENTARIOS: numeral (#)
# Se pone el símbolo numeral # antes de lo que se quiera comentar.
# Para comentar un párrafo, primero se selecciona el párrafo y luego se presiona: ctrl + shift + C
# Añadir una nueva sección: `ctrl + shift + R`

# EJECUCIÓN del código
# Ejecutar: ctrl + enter
# O hacer clic sobre "Run" (está ubicada en la parte superior derecha)

# GUARDAR: ctrl + S


# FUENTES de ayuda --------------------------------------------------------

# Para abrir una ventana de ayuda:
help.start()

# Buscar ayuda o información de un tema en específico:
help.search("linear regression")
help.search("hypothesis test")
help.search("normal distribution")
help.search("gamma distribution")

# Buscar ayuda sobre una función en específico:
help(fitted)
?fitted

help (summary)
?summary


# VIÑETAS -----------------------------------------------------------------

# Buscar disponibles:
vignete()

# Buscar viñetas específicas:
vignette("dplyr")



##### CLASE 1: Elementos esenciales de R: ----------------------------------

# Global Environmet -------------------------------------------------------

# Conocer los elementos que están dentro del environment
ls()

x<- 1
y<- 2
z<- 3

# Borrar elementos del environmet -----------------------------------------

rm("x")                 # 1 solo elemento:
rm("x","z")             # borrar varios elementos
rm(list = ls())         # todo

#  Librerias o paquetes ---------------------------------------------------

# Instalación de librerias/paquetes:
install.packages("dplyr",dependencies = T)
install.packages("xaringan",dependencies = T)

# Versión en desarrollo:
devtools::install_github("https://github.com/tidyverse/dplyr")

#  Cargar librerias:
library(dplyr)
require(dplyr)

# Ver los paquetes instalados:
View(installed.packages())


# Valores atómicos --------------------------------------------------------

class(1L)
class(2.4)
class("a")
class(TRUE)


# Vectores ----------------------------------------------------------------

c(1L,2L,3L)
c("a","g")
c(TRUE,FALSE)
c(1.4,5.6)

x <- c(1L,2L,3L)
x

y <- c("a","g")
y

z <- c(TRUE,FALSE)
z <- c(T,F)

a <- c(1.4,5.6)
a

ls()

## Los vectores tienen propiedades:
# clase:
class(a)

# Tamaño:
length(y)
length(x)

# Reglas de coherción: sirve para concatenar (unir) vectores:

# 1. Unir o concatenar caracter con cualquier otro = caracter
# Ej: Numerico y character = character
Primer <- c(x,y)
length(Primer)
class(Primer)

# 2. Unir o concatenar un entero con un numérico = numérico
b <- c(x, a)
length(b)
class(b)

# 3. Unir o concatenar un lógico con un entero o numérico = entero o numérico
Tercer <- c(z,x)
length(Tercer)
class(Tercer)

Cuarto <- c(z,a)
length(Cuarto)
class(Cuarto)

vector_unido <- c(a,z,x,y)

# Nombre sintácticos ------------------------------------------------------

# Un nombre solo puede contener . o _ no puede tener caracteres especiales, admite 
# tilde pero no es recomendable

# Pero si es poble crear un nombre no sintactico: usando ``
`vector unido` <- c(a,z,x,y)
`vector/unido` <- c(a,z,x,y)
`new?vector` <- c(z,x)

# Nombres reservados como "TRUE, if, while, for" no deben ser usados pero si se puede como nombre

# no sintactico
TRUE <- c(x,y,z)

# No recomendado
`TRUE` <- c(x,y,z)

# Ejemplo de sobreescritura de función homonima: 
y <- ts(x,start = 1000)
stats::filter(y,filter = c(1,1))
dplyr::filter(y)


# Crear pdf ---------------------------------------------------------------
library(tidyverse)
library(xaringanBuilder)

build_pdf("01_bienvenida_ayuda/presentacion_01.html")
build_pdf("02_listas_subset/presentacion_02.html")
build_pdf("03_data_frames/presentacion_03.html")
build_pdf("04_caso_estudio/presentacion_04.html")
build_pdf("05_rmarkdown_tidyverse/presentacion_05.html")
build_pdf("06_tidyverse_rmarkdown/presentacion_06.html")
build_pdf("07_graficos_tidyverse/presentacion_07.html")
build_pdf("08_join/presentacion_08.html")






