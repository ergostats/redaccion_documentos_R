
# Script de la clase 3 ----------------------------------------------------

# Elaborado por Alex Bajaña

edades <- c(8,19,34,23,5)

set.seed(1) #es la semilla

sample(edades, size = 100, replace = T)

rbinom(n = 7,size = 100,prob = 0.10)

hist(edades)

mean(edades)


# Cargar librerias --------------------------------------------------------

library(tidyverse)

peso <- starwars[["mass"]]

altura <- starwars$height

nacimiento <- starwars$birth_year

mean(peso,na.rm = T)

hist(peso)

# Metiendose adentro de mean:

sum(peso,na.rm = T)/length(peso) # Hay mas elementos por la presencia de NA

tamano_sin_na <- peso[!is.na(peso)]

sum(altura,na.rm = T)/length(tamano_sin_na)

# Saber cuantos valores completos

altura_sin_na <- altura[!is.na(altura)]

todos <- length(altura)

completos <- length(altura_sin_na)

paste("el vector tiene", todos, "elementos y",completos,"no son NA",sep = " ")

# Me toca repetir la misma operacion para toooodas la variables
todos <- length(peso)

peso_sin_na <- peso[!is.na(peso)]

completos <- length(peso_sin_na)

paste("el vector tiene", todos, "elementos y",completos,"no son NA",sep = " ")


#

# Mejor creo una función!!!! ----------------------------------------------

valores_completos <- function(tabla,variable){
  
  # Extraer el vector de la variable
  
  vector <- tabla[[variable]]
  
  # Calcular el tamaño
  
  todos <- length(vector)
  
  # Ver los completos
  
  vector_sin_na <- vector[!is.na(vector)]
  
  completos <- length(vector_sin_na)
  
  # Imprimir el mensaje
  mensaje <- paste("el vector tiene",
                   todos, "elementos y",
                   completos,"no son NA",sep = " ")
  
  return(mensaje)
}

valores_completos(tabla = starwars,variable = "mass")
valores_completos(tabla = starwars,variable = "height")
valores_completos(tabla = starwars,variable = "sex")
valores_completos(tabla = starwars,variable = "birth_year")
