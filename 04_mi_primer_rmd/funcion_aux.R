funcion_auxiliar <- function(modelo){
  
  resumir <- broom::tidy(modelo, conf.int=TRUE)
  
  redondear <- lapply(resumir,
                             FUN = function(columna){
                               if(is.numeric(columna)){
                                 round(columna,3)
                               }else {columna}
                             })
  
  modelo_en_tabla <- as.data.frame(redondear)
  
  ind <- modelo_en_tabla$p.value < 0.05
  
  modelo_en_tabla$p.value[ind] <- paste(modelo_en_tabla$p.value[ind],"***")
  
  modelo_en_tabla <- modelo_en_tabla[,-3]
 
   names(modelo_en_tabla) <- c("Parámetro", "Valor estimado", "Valor Z", "P-valor", "Límite inferior", "Límite superior")
  
  modelo_en_tabla <- flextable::flextable(modelo_en_tabla)
  
  flextable::autofit(modelo_en_tabla) 
}



