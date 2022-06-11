
# Script de mi clase 2 ----------------------------------------------------

# Crear un dado:

dado <- c(1,2,3,4,5,6)

# Equivale a:

dado <- 1:6


# Lanzar una vez mi dado:

sample(x = dado,size = 1)

# Lanzar dos veces mi dado:

sample(x = dado,size = 2)

# Por default el R hace un muestreo sin reposición.
sample(x = dado,
       size = 4,
       replace = FALSE)

# Una moneda:

moneda <- c("cara","sello")

# Por default el R hace un muestreo con reposición.

# Estoy lanzando la moneda 8 veces:

juego <- sample(x = moneda,
       size = 8,
       replace = T)

resumen <- table(juego)

plot(resumen)

# Urna con pelotas de colores, va a generar 200 pelotitas que pueden ser rojas, 
# verdes o blancas



# Te vas a imaginar que estas en la Av. Eloy Alfaro, de 500 carros: chevrolet, mazda, u honda

# 

# Voy a lanzar el dado 800 veces:

lanzamientos <- sample(x = dado,size = 800,replace = T)
# Lanzamiento es un atomico numerico
class(lanzamientos)

summary(lanzamientos)

resumen <- table(lanzamientos)
# Es un elemento table
class(resumen)

attributes(lanzamientos)

attributes(resumen)

plot(resumen)

# Instalar el tidyverse ---------------------------------------------------

install.packages("tidyverse")

c(20,25,21,0,NA)

Sys.getlocale()

vector_fechas <- c("2022-02-30","2022-05-24","2022-12-24")

vector_fechas2 <- as.Date(vector_fechas,"%Y-%m-%d")

class(vector_fechas2)

attributes(vector_fechas2)

z <- strptime("20/2/06 11:16:16.683", "%d/%m/%y %H:%M:%OS")
z # prints without fractional seconds
op <- options(digits.secs = 3)
z


now_ct <-as.POSIXct("2022-06-11 09:25",tz ="UTC")

structure(now_ct, tzone ="Asia/Tokyo")

class(now_ct)

attributes(now_ct)

niveles <- c("guarderia","escuela","colegio","universidad")

class(niveles)

sort(niveles)

vector_nivel <- sample(niveles,size = 800,replace = T)

resumen_nivel <- table(vector_nivel)

plot(resumen_nivel)

plot(vector_nivel)

niveles_factor <- factor(vector_nivel,levels = niveles)

resumen_nivel_f <- table(niveles_factor)

plot(resumen_nivel_f)

plot(niveles_factor)


metadatos <- list("35 mb",           #caracter: tamaño de la base
                  1:200,             #enteros: índice de filas
                  c(TRUE, FALSE),    #lógico
                  (1:4)/2,           #numérico decimal
                  as.Date("03/07/2020", 
                          format="%d/%m/%y"))    #fecha


attributes(niveles_factor)

metadatos

metadatos2 <- list(`tamaño de la base`="35 mb",          
                   `fecha descarga`=as.Date("03/07/2020", 
                                            format="%d/%m/%y"))

metadatos2 <- list(size_table="35 mb",          
                   fecha_descarga =as.Date("03/07/2020", 
                                            format="%d/%m/%y"),
                   c(1,2,4))

metadatos[[1]]

metadatos[1]

metadatos2$size_table

attributes(iris)

iris$Sepal.Length

iris[,2]

iris[1,]

iris$columna_de_ochos <- c(1,2)

iris$columna_dados <- sample(dado,150,replace = T)
