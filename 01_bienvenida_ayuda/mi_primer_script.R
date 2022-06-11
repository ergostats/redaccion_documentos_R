
# Este es mi primer archivo de R ------------------------------------------


# Mi nombre es: Alex Bajaña
# La fecha de hoy es: 04 de junio de 2022

help.start() 

# Buscar ayuda de un modelo lineal

help.search("linear model")

# verificar la versión de R

R.version

# Este es mi primer vector. Para 4 individuos voy a coleccionar sus edades,
# en años enteros

edades <- c(54,23,17,90) # Aqui está mal definido el tipo de vector

# Clase del vector edades

class(edades)

edades <- c(54L,23L,17L,90L) # Aqui está bien :)

class(edades)

length(edades)

nombres <- c("Alex","Wladimir","Diego","Libinton")

  class(nombres)

attributes(nombres)


# Un vector de cada tipo: character, numeric, integer, logical
# Luego por pares de tipos van a unir con c()



# character, numeric

# character,  integer

vector_1 <- c(edades,nombres)

class(vector_1)

# character,  logical

# Vector logico con una condicion:

vector_logico <- edades > 23

# logical, numeric

vector_4 <- c(vector_logico,c(7L,9L))

class(vector_4)
# logical, integer


vector_5 <- c(vector_logico,c(7.7,9.1))

class(vector_5)
