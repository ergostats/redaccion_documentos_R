
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

# Vector peso:
sum(peso,na.rm = T)/length(peso) # Hay mas elementos por la presencia de NA

peso_sin_na <- peso[!is.na(peso)]

sum(peso,na.rm = T)/length(peso_sin_na)


# Altura:

tamano_sin_na <- altura[!is.na(altura)]

sum(altura,na.rm = T)/length(tamano_sin_na)

mean(altura,na.rm = T)

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


# Mejor creo una función!!!! ----------------------------------------------

valores_completos <- function(tabla,
                              variable){
  
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

rm(list = ls())


# Otra vez estoy copiando y pegando el codigo con el cambio de la variable

valores_completos(tabla = starwars,variable = "mass")
valores_completos(tabla = starwars,variable = "height")
valores_completos(tabla = starwars,variable = "sex")
valores_completos(tabla = starwars,variable = "birth_year")


# Pero el R tiene los loops!!

variables <- c("mass","height","sex","birth_year")


for (i in variables) {
  
  msm <- valores_completos(tabla = starwars,variable = i)
  
  print(msm)
  
}


# Condicional:

class(starwars$name)

class(starwars$mass)

is.numeric(starwars$mass)

is.numeric(starwars$name)


# Loop sobre todas las columnas de un dataframe

for(i in names(starwars)){
  
  variable <- starwars[[i]]
  
  msm <- paste("la variable",i,"es un",class(variable))
  
  print(msm)
  
}

# Condicionales:

vector <- starwars$starships
vector <- starwars$height

class(starwars$starships)


# Condicional simple:

if(is.numeric(vector)){
  
  msm <- paste("la media es",mean(vector,na.rm = T),sep = " ")
  
  print(msm)
}

for(i in names(starwars)){
  
  vector <- starwars[[i]]
  
  if(is.numeric(vector)){
    
    msm <- paste("la media de la variable",i,"es",mean(vector,na.rm = T),sep = " ")
    
    print(msm)
  }
  
}

# Condicional con alternativa general


if(is.numeric(vector)){
  
  msm <- paste("la media es",mean(vector,na.rm = T),sep = " ")
  
}else{
  
  msm <- paste("la variable",i,"es un",class(variable))
}

# Condicional con alternativas especificas

vector <- starwars$hair_color

unique(vector)

if(is.numeric(vector)){
  
  msm <- paste("la media es",mean(vector,na.rm = T),sep = " ")
  
}else if(is.character(vector)){
  
  unicos <- unique(vector)
  
  msm <- paste("la variable",i,"tiene",length(unicos),"unicos",sep = " ")
}

print(msm)

# Juntando todo, o armando el megazord

for(i in names(starwars)){
  
  vector <- starwars[[i]]
  
  if(is.numeric(vector)){
    
    msm <- paste("la media de la variable",i,"es",mean(vector,na.rm = T),sep = " ")
    
  }else if(is.character(vector)){
    
    unicos <- unique(vector)
    
    msm <- paste("la variable",i,"tiene",length(unicos),"unicos",sep = " ")
  }
  
    print(msm)
}


# replicar ese gran proceso para otra tabla

tabla <- iris

tabla <- starwars

for(i in names(tabla)){
  
  vector <- tabla[[i]]
  
  if(is.numeric(vector)){
    
    msm <- paste("la media de la variable",i,"es",mean(vector,na.rm = T),sep = " ")
    
  }else if(is.character(vector)){
    
    unicos <- unique(vector)
    
    msm <- paste("la variable",i,"tiene",length(unicos),"unicos",sep = " ")
  }else{
    
    msm <- paste("la variable",i,"es un",class(variable))
    
  }
  
  print(msm)
}


# Creando un data frame de resumen con un loop

tabla <- starwars

resumen_tabla <- data.frame(
  var = NA,
  n_elementos = NA,
  completos = NA,
  clase = NA,
  media = NA,
  unicos = NA
)


# ejemplo basico:

vector <- 0

for(i in 1:10){
  
  vector <- c(vector, i)
  
  print(vector)
}

for(variable in names(tabla)){
  # Extraer el vector de la variable
  
  resumen <- data.frame(var = variable)
  
  vector <- tabla[[variable]]
  
  # Calcular el tamaño
  
  todos <- length(vector)
  
  resumen$n_elementos <-  todos
  
  # Ver los completos
  
  vector_sin_na <- vector[!is.na(vector)]
  
  completos <- length(vector_sin_na)
  
  resumen$completos <-  completos
  
  # el tipo de variable
  
  resumen$clase <- class( vector)
  
  
  # Creacion de la columna media con un condicional
  
  if(is.numeric(vector)){
    
    resumen$media <- mean(vector,na.rm = T)
    
  }else{
    
    resumen$media <- NA
  } 
  
  
  if(is.character(vector)){
    
    unicos <- unique(vector)
    
    resumen$unicos  <- length(unicos)
    
  }else{
    
    resumen$unicos <- NA
    
  }
  
  # juntar el resumen de todas las variables
  
  resumen_tabla <- rbind(resumen_tabla,resumen)
  
  
}

  print(resumen_tabla)
  print(resumen_tabla)
# Versioon 2.0 ------------------------------------------------------------


resumen_variables <- function(tabla){
  
  resumen_tabla <- data.frame(
    var = NA,
    n_elementos = NA,
    completos = NA,
    clase = NA,
    media = NA,
    unicos = NA
  )
  
  for(variable in names(tabla)){
    # Extraer el vector de la variable
    
    resumen <- data.frame(var = variable)
    
    vector <- tabla[[variable]]
    
    # Calcular el tamaño
    
    todos <- length(vector)
    
    resumen$n_elementos <-  todos
    
    # Ver los completos
    
    vector_sin_na <- vector[!is.na(vector)]
    
    completos <- length(vector_sin_na)
    
    resumen$completos <-  completos
    
    # el tipo de variable
    
    resumen$clase <- class( vector)
    
    
    # Creacion de la columna media con un condicional
    
    if(is.numeric(vector)){
      
      resumen$media <- mean(vector,na.rm = T)
      
    }else{
      
      resumen$media <- NA
    } 
    
    
    if(is.character(vector)){
      
      unicos <- unique(vector)
      
      resumen$unicos  <- length(unicos)
      
    }else{
      
      resumen$unicos <- NA
      
    }
    
    # juntar el resumen de todas las variables
    
    resumen_tabla <- rbind(resumen_tabla,resumen)
    
    
  }
  
  return(resumen_tabla)
}

  
  resumen_variables(iris)
  
  resumen_variables(starwars)

  resumen_variables(mtcars)
  