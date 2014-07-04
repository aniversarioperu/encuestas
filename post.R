# Es representativa una muestra de 1000 personas en caso de encuestas políticas?
# Depende del margen de error que quieras obtener
# Se supone que a mayor muestreo hay menor margen de error
# Colectar muestra es costoso y no es necesario muestras muy grandes para obtener 
# margenes de error aceptables.

# El margen de error depende del tamaño de la muestra (a mayor muestra menor error)
# y del nivel de confianza del muestreo (por lo general se aceptan muestreos con un nivel
# de confianza del 95%)

# El nivel de confianza se traduce como la probabilidad que los datos obtenidos
# sean una muestra representativa de la población. http://en.wikipedia.org/wiki/Confidence_interval

# Entonces podemos rebalancear la formula del margen de error para obtener la cantidad de muestra
# necesaria (el número de personas que deben ser entrevistadas) para obtener un margen de error pequeño
# y aceptable.

# Esta formula http://en.wikipedia.org/wiki/Margin_of_error
# E = CI*sqrt(p(1-p)/n) queda convertida a
# n = CI^2*p*(1-p)/E^2

# p:  If you've got a Bernoulli random variable (something with two outcomes) 
# that's approximately 50:50. Por eso en este caso (Cipriani) solo hay dos opciones,
# a favor o en contra por lo que un valor de p=50% es aceptable.

# Pregunta, cuántas personas deben encuestarse para tener una muestra representativa con pequeño
# margen de error.

# CI = 95%
zstar = qnorm(0.975)

p = 0.50

# margen de error 3%
E = 3/100

# n = 1067 personas
n = zstar^2*p*(1-p)/E^2

# error formula
E = zstar*sqrt(p*(1-p)/n)

y <- c()
for( i in 1:2000) {
  E = zstar*sqrt(p*(1-p)/i)
  y <- c(y, E*100)
}
