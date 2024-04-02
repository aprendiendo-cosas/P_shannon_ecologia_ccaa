# Instrucciones para realizar la práctica denominada "Construcción de un mapa de diversidad de Sierra Nevada"


> + **_Versión_**: 2023-2024
> + **_Asignatura (grado)_**: Ecología (Ciencias ambientales). 
> + **_Autor_**: Curro Bonet-García (fjbonet@uco.es)
> + **_Duración_**: 2 sesiones de 3 horas cada una.



## Objetivos

Esta práctica tiene los siguientes objetivos:
+ Disciplinares:
  + Aprender un método para cuantificar la diversidad biológica. Índice de Shannon.
  + Aprender a generar mapas de diversidad biológica. Mapas de distribución del índice de Shannon.
  + Reconocer patrones de distribución de la diversidad en un territorio concreto (Sierra Nevada).
  + Identificar las causas de los patrones anteriores.
  
+ Instrumentales:

  + Afianzar nuestro conocimiento de SIG.
  + Empezar a conocer el lenguaje de programación R e iniciarnos en su manejo.
  + Aprender algunos conceptos básicos de las bases de datos relacionales.  
  
   


## Contextualización ecológica

Esta sesión práctica está muy relacionada con el tema en el que hablamos de la diversidad de las [comunidades ecológicas](https://rawcdn.githack.com/aprendiendo-cosas/Te_comunidades_diversidad_ecologia_ccaa/2023_2024/guion_comunidades_diversidad.html). En concreto, usaremos los conocimientos adquiridos en esa sesión para construir un mapa de biodiversidad de Sierra Nevada. Esto quiere decir, que debes de repasar dichos conceptos con objeto de que el aprendizaje de esta práctica sea realmente efectivo.

Para cuantificar la diversidad biológica se pueden utilizar muchos índices. En nuestro caso usaremos el denominado índice de Shannon-Wiever, que es uno de los más robustos y comunmente utilizados. Para su cálculo se necesita la siguiente información:

+ Delimitación espacial de la comunidad para la que queremos calcular el índice de diversidad.
+ Listado de especies existente en esa comunidad.
+ Abundancia de cada especie en dicha comunidad.

La siguiente presentación muestra los conceptos básicos necesarios para hacer la práctica. También puedes verla [aquí](https://prezi.com/view/ACfMCVaCBbJVoGwMJZaY) y descargarla [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/presentacion/1_mapa_biodiv_ecologia_ccaa.exe) para Windows y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/presentacion/1_mapa_biodiv_ecologia_ccaa.zip) para Mac. Y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/presentacion/1_mapa_biodiv_ecologia_ccaa.pdf) la tienes en formato pdf.




<p><iframe src="https://prezi.com/view/ACfMCVaCBbJVoGwMJZaY/embed" width="1200" height="900"> </iframe></p>



## Metodología y flujo de trabajo

Como se puede observar en la presentación anterior, para calcular la diversidad de una comunidad, necesitamos dos fuentes de información:
+ Información de distribución de especies en la zona de estudio (Sierra Nevada). Es el primer paso fundamental porque necesitamos esta información para calcular el índice de Shannon. Para conseguir datos de presencia de especies en Sierra Nevada usaremos una infraestructura digital denominada [GBIF](https://www.gbif.org/) (Global Biodiversity Information Facility). Se trata de un portal desde el que se tiene acceso a millones de datos de presencia de especies procedentes de colecciones biológicas (herbarios, colecciones animales, etc.) de todo el planeta. Esta iniciativa está promovida y mantenida por multitud de países que han puesto en común toda la información de la que disponen para conocer mejor la distribución de la biodiversidad en la Tierra. Accederemos a este portal y descargaremos toda la información de presencia de especies en Sierra Nevada. Esto nos dará una idea bastante aproximada de cómo se distribuye la diversida en esta zona. En nuestro caso, GBIF aporta una enorme cantidad de registros de presencia de especies en Sierra Nevada. Durante la práctica visitamos el portal de GBIF y simulamos la descarga. Como este proceso puede tardar unas horas, utilizamos datos que fueron descargados anteriormente por el profesor. Dichos datos de presencia de especies tienen el siguiente "aspecto" cuando son visualizados en QGIS. [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/geoinfo/csv_gbif_sierra_nevada.zip) puedes descargar la capa con los datos de presencia de especies de Sierra Nevada en el mismo formato en el que se obtienen de GBIF. Para usar estos datos en la práctica debemos de importarlos en QGIS y convertirlos en un fichero de formas. Para ahorrarnos este paso y que la práctica fluya un poco mejor, ya he hecho yo este paso. [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/geoinfo/ocurrencias_sierra_nevada_23030.zip) puedes descargar el shapefile de puntos que usaremos. Como ves más abajo, son unos cuantos miles de puntos...

![puntos](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/imagenes/puntos.png)



+ Distribución de las comunidades ecológicas que conforman Sierra Nevada. Este paso es el más complejo conceptualmente, ya que las comunidades no tienen un límite espacial preciso. Es decir, están conectadas entre sí y no es fácil delimitar donde empieza una y acaba otra. Usaremos un mapa de vegetación para delimitar las comunidades de Sierra Nevada. Asumiremos que cada polígono de dicho mapa es una comunidad ecológica. [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/geoinfo/vegetacion_snevada_23030.zip) puedes descargar el mapa de comunidades que usaremos en esta práctica. El enlace anterior contiene un fichero de formas con la delimitación de los polígonos del mapa de vegetación a escala 1:10.000. La siguiente figura muestra la delimitación de estas comunidades en Sierra Nevada. Aunque el mapa no tiene escala, podrás reconocer el contorno del espacio protegido de Sierra Nevada.

![comunidades](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/imagenes/comunidades.png)



A partir de estas dos fuentes de datos obtendremos el índice de Shannon para cada una de las comunidades de Sierra Nevada. Es decir, usaremos los datos de presencia de cada especie que hay en cada una de las comunidades para calcular su índice de Shannon. En la siguiente figura puedes ver la distribución de ocurrencias de especies en unas cuantas comunidades.

![puntos_comunidades](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/imagenes/puntos_sobre_comunidades.png)



Para ello seguiremos los pasos que se muestran en el siguiente flujo de trabajo (se ve un poco pequeño, pero si vas a la parte de abajo encontrarás una herramienta lupa para aumentar y otra para desplazarte). También puedes descargar el flujo de trabajo [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/presentacion/sierra_nevada_shannon_QGIS_R.drawio.zip) (se abre con [esta](https://www.diagrams.net/) aplicación).



<iframe frameborder="0" style="width:100%;height:2828px;" src="https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=sierra_nevada_shannon_QGIS_R.drawio#R7V1bc6O4Ev41rto9VXEh7jwmTjI7p2bPZiezl5kXlwyyzQ5GHsC57K8%2FEiAuloyJzS22UykbJBlEd3%2FdrVZLjJTJ6uVDANfLX7GDvJEsOS8j5XYky1eKKpMvWvKalGiakRQsAtdJiqS84NH9FyWFgJVuXAeFaVlSFGHsRe66XGhj30d2VCqDQYCfy83m2HNKBWu4QKVu0IJHG3qIa%2FaX60TLpNSUjbz8F%2BQuluzOQLeSmhm0vy8CvPHT%2B41k5V67V%2B%2FTC64gu1Z633AJHfxcKFLuRsokwDhKjlYvE%2BRR2pbJdr%2BjNut3gPyozg%2Fke6R%2Bf1ibV%2FadYn7%2B8DT7Y31%2FBVLuhdErIwhyCH3SUxxES7zAPvTu8tKb%2BKERvaxEzvI2nzBek0JACv9BUfSaMhtuIkyKltHKS2v5rqdPE%2BJNYKf9kKdz03t%2B1aP%2F%2Fvj9m2k83nz9%2FO%2BVlkoIDBYoqmiXco8%2BS%2BEGKWE%2BILxCUfBKGgTIg5H7VJYFmIrUImuXk5UcpJTdQeWKXj9Bb4OYsGxRHYbrRLrn7gsl7c0aBS65OwpIGbkFgQN6yIuK1ISeu%2FDJsU2oGddlkkbZ48BwmfEqXEPb9RdfYj4ppMBdxfBg37fuakGe0HNn5BPalDJTxw1IzzAlw%2F0zmk1DFDyhYBw%2BLcjv5tiPUjYbsWREhJyY9uYKmPSOc9LzP9OO0uNf9okAuXaEXiqZxmpVkP4mVT1E%2BSTnzzmQlZTUywKGVakBPgvRpPSBJkLB4PVv%2Bvuxxk6%2FppeLT25fSmev6dnhKDTqolAeFAwNDoa3KLTJQ0BS%2BuHm4z3HvWCJV7MN6cfN89KN0COBD615JqawzIPdOGgdBJJRAoECLA4ETOAbB4GQyvp%2BbUft5pqnU316ZP4AnLFrStV0ki29RCcV6BydZF2gLYDeFqWYbqqiFNHla3pIiBK50PtMH9lfxIqjIH4i6SwTKBZD1%2FMm2MPUpPjYp9eIYh1DKz00j9LDGY4ivEpPgpQSsXIifJh7sWlZuo6DfGpSogB%2FR%2ByyxAmS4r86zK0Wn%2F0QSDlpShwjgSKNreKf0SEAFOXC1mPYymqVsnUfGptV3pzsZHPKrn28DYlFZWZESngdQdePfUAQn3seXIduznt76XrOJ%2FiKNxG7DTvbY5Na4xsjA7NHMq9mgTlWin9AoHVlsy2%2Bme3Cc5tFToDXX5inRAvW2KWO%2Bt0ToXzYFIbji8ak0m7IPxH6CXUHNfI0E3IO8nPyT5sH0QT7BOVEvug1EAyjZxRGBwtKBof9gvJGUWjNH1QtThIebZc8pjt37f%2FBFWpVbYu07tFiUMC8eTgrzUNYaVhvY116sZyGb74a9AiMfBihGzqECjl5yPp5xMhd4kTEQTYZLZPhmb9wo41zEZK6hsHgBya62aTM1LlaFzIDdsoMofNFZN40ujU4mTHeaCL26JkaV%2BtCZloeCl6ckpqDScb7t%2Foocks%2BisYPJq%2FJQ8PAhePx%2BEwVSYaW4x2UCr4d4KBsXa0LxaFy8kFHXBP1IhoNuyUHS0qdq3UhKfwslDG2LmLStCtyuEapcbUu5KRG%2FP7iinTgiqjKYa5Ia7PYfMDzfmOfsxtSPzZ68nESPqgauyFna1%2FeHDY%2Fm%2BgIH3QlemUCLoJyiYmUSaPzsdeLI9KHI6Krw3JEdD7A%2BuD6m%2FBMVUiGk4sbwvJ3im4IOGM35A2icWZuiM7HVYmWm%2FAJnBdBOXc3hI%2BwXtyQPtwQk8%2Fu7nVqRucDqr9vUGBvwvMNiWRguczM6HwcVaEjXe0iGpeZmTJl%2BMAqjZ01a2ZOWVDOZm5Gv%2BSuDsMXARIvcf3GRPiw6mccnvHkjH5JYs1y%2BPlAKl0Vcb5RkUvq6i5J4SOrVPuaF0G5REXES3tLnojuRSnpS9Ki%2F9hgVnEVxky5Jg209UteR44W9PshQCHybZcuyaWJ0hKiC%2BNdFNJDn3xsfFr1L46%2FQuQh2yZ8hQ5ktyePk%2FQguSAnuuX11nvW9e5eBhcLWHpVcLCEHb686o2OB1uG1fyad52j8GB2kBD1N6VDae26qF0aCe5h6XpFrwtokwAwTVm%2BkiVJB4pkqkA1gaqM7fDpOJHvbym7wiJq2byjYMknEPhUSmsbOhh9CHe7GzpUCPteULBFmc2hIv3pAx0CFs2orI3lsjSYYGtFaNLb9JfHWbgKmhQg93FFh54woERmZipkZmcW5BYnKXFZQYCgk%2BByV1PSQXe3wRr%2BJhSKVd6EwpB55LJMlyJwWVnzwOVd1i6A%2B%2BJGBdySs6%2BFmhy19OR40DIw7kVtZ6BlS%2FQZYtUtxCaP1BpiM8qduLauy3fZ6kxb69va2rKssVT423I%2FW9bdfJjU9W0cEPUda%2B%2F0kUYTZXR9C2to8DCawnAazlvW10VJ7FR7b1lai98aRwcZh0sKXBtrbalwfqKsUxWummZBiUtjy9AqFTk9KezQ9gaMV4Ue9oO8aYwfN07pZwe0bu2uVZc1jfOmUv9a2X954xwgyXKVLm7bKveM4%2Foi0b0lZxKyPxohdSdKZeEBWp%2BGnBGoYMkDtA7wKw2OBvUsdxRAP5zjYHUe1htI%2BhDMt8z7YMVB8xbVC%2FMJ0POQhxcBXI3Ku6CW6op7oe5jFN1RNeWUgHGN8MC0yh6UYPxrKDz9mblsnvr8dHBO%2FSm5zalzANAofa8sUPtxhbqPHUo1bRjbKXwgrqrCz4qXITKVFYk1OiGgGNqYLZPIbLzOLzUGkmDT2NbAovcyi3QoWJhzydzJryVHs%2BnxBsNNEWB%2FKY%2Fen848%2BPb6ir9bf5k32ouabVbWupOoS2pZgBRzSzBaHlOo%2FYR329StQo7Kak3WM6%2B9e91a2e%2BCbr17IX44CuKHmXmCoFs82w%2BjwJ0RwtPp%2FrgA25sgYE4jpSGd9sdE18aBPBvTlADSoTpBPBiOHRjB8TyIt3bsbualFf9G0wWZJupY4OTnpY2rbbaNypmP7Sshud8vajxMfxx2%2BXULM5cfLxyaU2COyrkzcjt4UaXyXBTQWeJUcUpS5tHSWi6Bdnq5BGL5EUSuhQ2bj2kdJ%2Fd8wGICPXvjxZbGH03k0Q1NW3N9x31ynQ0WT%2F3DFZV9fxbSrzWmvyWHVA4JOePTNfaSmSfCSVzDbj3%2B%2FklsrZKycA39klixlDo7yVqjfQ4WM%2FgTITfN%2BiWfwqOf6SG9rBTn6c3hyvVek5%2BvSEfDGNylJnkqnyRK5Su9MUojnCAfyfuOsjPGGS3mDSm5pce0SxrlhUYYuq8tyNoyaT3oMnJ%2BmUQAsprMcdEy10VLnBOt5K%2FkhSWfRWNei5b7LVrquWjMd2G3TpiY3Zr5H6SgqGFpfaxjaXmMdVoC4tNM09IiIy4qPFmiP%2BvQLqvKyJYDUqNqNm%2Bp0A1c2HVe84orTc85kKrdrDJxSlhlqoB31MZkTGsWhV5sszY%2BzfhbLCxLXdqOE88MYwmkhu8UqvqWU2hJfOjXAiKnMC9tfizPx0wGbOhamzustHn7jeOwBnSCYFnBTu3P9TZEBuLL1N%2BspsSeTsP1lFrFWmOyI%2FzONiBolDPfZEkTxJ0FqW%2Ft%2BZnvKpR2BJQESavihuqwoMQnljbkZ56Xeykw4Bf%2F8uJfXvzLBoOO0lZqwSD8S%2B20crsrbda78xNFmyU15ye%2BUydRYS%2BGHYyTyLZQPHknURCEFzZUhxWMVPgg%2FB%2B%2BG4xSF4HOhQmmvIgj8RT7flYyf0ZvYxNHEdNvvKJVN9c%2B%2F7ufqKeSti%2B5jz8f4z8O2K6ZZbtG3w7bv11jWRkDXElbCZn92JIHhS11dyxj52CnjpnikLEd35iuYLjflNX0Egdm4bRy2jAxZ4K1u6opglR7Ru70MvAq8bUfiMOKhLB%2BiyMhD%2B4omTXz8EKmJ2dhiRRlCJaIf3vUaQKn7ihLHdYoS909ymrRgtkb6Jy0CduK5KuiN453bcLezeKpI1BYe4zW%2BEL241DIj9EeN6vUdv3nU2q1JN5wwUWAFtB38CiN2W83aCyE%2F44Mn6YPwfD1kqN1BHTq5lo1nxp%2BHHRE%2B5i2Y8Ael9D3sX9KhsoqZ33IBuANFXPhurFSvUTkd9Kyg%2FUPytgAqmxqyae5xQ8DjFU9r663NkJ8G3YN%2Brnln7S4IVKlDhGANrdN13GQEUAnDlbCgv3LYGfj1cZ3HeigcAcqS3Pb%2FD224prJEgB6p9hm%2Bo5rI%2F5H8WqCXBnsuQXX6RUitH1vRlbblkxd4NK2aWRdIGHL%2BvvHL2h2q7jq3bdvzx%2BvzmTtjlY3P4W9mHcgtlnwxvESYrd419NyyI6WEWi6Pja2PNVM7xZAxHDVtLkVAojft%2Fk0AaTVBZAxLADx74W5e8l2DoSJGVqjuesJzBRneJ4DApHfPnx%2Bd7aHTTFnsDG7zR2pFBVxfkI6mk6chGnooiCAUx89QQeOw%2BW6Fgt61IdtcFE2x6A83FAkweYWQDPGQG5HB4oXzb2zbYdFczTihr15A5X9LgDmOnQXfqbL7Hjr7XxDVOaM2%2FFAQHHcBfXSBbkFtGHmuv%2FYJHt9R3E9qKEXw2j6DxnptKwW%2B9rTxyw77kBRidnlA2Qs%2Bby03NcaW61Jw%2BmtYawE4f51973NqFb2W7ynyct0EdBMn2FYrOZ2%2FpG3Nx8FqsWbKNPIPPlOtjTR%2Bsk%2BGNra%2BMol73utYX9x68p%2BF%2FBFmJTsRRFhJ962wos%2F4%2FBU%2FNKKFxutI5xVJJbOj49DFDy5yTa0wB%2ByM0%2Fs0fYwGBiCnLnuN6A4vUyFShzszwcf1nsrtF7mrzugc%2FNvQjiOznxs%2Fn1u2sGpGVOgZtrat0MYbTu9JELhYwJe8IXt5L7kvqrXBbF%2FQqT%2FkL4TahomoZtkH78kgHNarq%2FOIjHZRn4SH5oGLKOw5PWaLTGkn3ylztEiiOYI2%2FU2PKzqtWgCl8VOPv768NvnL9fFcPPsdOIqumaOzfI0OgDM4nS1XbKQNacXWKnCw4D3iq3q9rCnRBuzKqo2ZgNdBhLZVDmQsBjlkXZllC6fLuSq5Aunlbv%2FAw%3D%3D"></iframe>



Este flujo de trabajo se ejecuta usando R. R es un lenguaje de programación muy frecuentemente utilizado en ámbitos científicos. Se usa para hacer análisis de datos, dibujar gráficas, mapas, etc. En esta práctica nos familiarizaremos un poco con este lenguaje. Concretamente usaremos un interfaz gráfico llamado RStudio. [Aquí](https://www.youtube.com/watch?v=v0rBJ86aMa8) tienes un breve vídeo en el que cuento cómo instalar QGIS, R y Rstudio.



El flujo de trabajo anterior se realiza ejecutando secuencialmente las líneas del siguiente bloque de código:

```R
# Este script genera un mapa del índice de Shannon a partir de los datos de presencias de especies existentes en GBIF y de un mapa de vegetación de Sierra Nevada

# 1. Establece directorio de trabajo
setwd("/Users/fjbonet_trabajo/Library/CloudStorage/OneDrive-UniversidaddeCórdoba/4_docencia/eco_ccaa_uco/actos_docentes/P_shannon_ecologia_ccaa/preparacion/borrar/csv_gbif_sierra_nevada")

# 2. Instalar y cargar los paquetes necesarios
install.packages("sf")
library(sf)

install.packages("sqldf")
library(sqldf)

# 3. Importamos el archivo csv de GBIF con sus atributos geográficos
presencias <- read.csv("0118822-200613084148143.csv", header = TRUE, sep ="\t", dec = ".")

# 4. Convertimos la tabla importada a un objeto geográfico tipo sf
presencias_geo <- st_as_sf(presencias, coords = c("decimalLongitude","decimalLatitude"), crs = 4326)

# 5. Reproyectamos la capa creada al sistema de coordenadas 23030 (UTM)
presencias_geo_23030 <- st_transform(presencias_geo, crs = 23030)

# 6 Importamos la capa con la delimitación de las comunidades ecológicas.
¿COMO HACEMOS ESTO? BUSCAREMOS EN INTERNET...

# 9. Asignamos a cada punto de presencia el código del polígono del mapa de vegetación en el que está. Unión espacial.
presencias_x_comunidades <- st_join(presencias_geo_23030,left = FALSE, comunidades)

# 10. Extraemos la tabla de atributos de la capa de puntos creada y borramos todos los campos menos los dos que nos interesan. 
bio <- as.data.frame(presencias_x_comunidades)
bio <- bio[c('OBJECTID', 'scientificName')]

# 11. Calculamos el número de individuos por especie y por polígono (num_ind_sp_pol)
T_num_ind_sp_pol<-sqldf("SELECT OBJECTID, scientificName,  count(scientificName) num_ind_sp_pol  FROM bio GROUP BY OBJECTID, scientificName")

# 12. Calcular el número total de individuos por polígono.
T_num_ind_pol<-sqldf("SELECT OBJECTID, sum(num_ind_sp_pol) num_ind_pol FROM T_num_ind_sp_pol GROUP BY OBJECTID")

# 13. Fusionar las tablas anteriores para calcular Pi
T_num_ind_sp_pol_mas_num_ind_pol<-sqldf("SELECT OBJECTID, scientificName, num_ind_sp_pol, num_ind_pol FROM T_num_ind_sp_pol LEFT JOIN T_num_ind_pol USING(OBJECTID)")

# 14. Calcular pi por especie y por cuadrícula.
T_num_ind_sp_pol_mas_num_ind_pol<-sqldf("SELECT OBJECTID, scientificName, num_ind_sp_pol, num_ind_pol, (num_ind_sp_pol*1.0/num_ind_pol) pi FROM T_num_ind_sp_pol_mas_num_ind_pol")

# 15. Calcular el log2 pi por especie y por cuadrícula (log = ln). Log2(pi)=log(pi)/log(2)
T_num_ind_sp_pol_mas_num_ind_pol<-sqldf("SELECT OBJECTID, scientificName, num_ind_sp_pol, num_ind_pol, pi, (log(pi)/log(2))*pi lnpi_pi FROM T_num_ind_sp_pol_mas_num_ind_pol")

# 16. Calcular H por cuadrícula
T_Shannon<-sqldf("SELECT OBJECTID, sum(lnpi_pi)*-1 H FROM T_num_ind_sp_pol_mas_num_ind_pol GROUP BY OBJECTID")

# 17. Fusionar la tabla que tiene el índice de Shannon con la malla de cuadrículas.
comunidades<-merge(x = comunidades, y = T_Shannon, by.x = "OBJECTID", by.y = "OBJECTID")

# 18. Exportamos la capa de comunidades a un fichero de formas para visualizarlo en QGIS.
st_write(comunidades, "Shannon_sierra_nevada.shp", append=FALSE)


```



La siguiente presentación muestra paso a paso el flujo de trabajo. También puedes verla [aquí](https://prezi.com/view/gOJNmvizzKEsXVxEHe3I/) y descargarla [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/presentacion/2_mapa_biodiversidad_sierra_nevada.exe) para Windows y aquí para [Mac](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/presentacion/2_mapa_biodiversidad_sierra_nevada.zip). Y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/presentacion/2_mapa_biodiversidad_sierra_nevada.pdf) la tienes en formato pdf.




<p><iframe src="https://prezi.com/view/gOJNmvizzKEsXVxEHe3I/embed" width="1200" height="900"> </iframe></p>






## Resultados esperables
El siguiente mapa muestra el resultado obtenido en esta práctica. Se trata de un fichero de formas vectorial en el que se ha asignado el valor del índice Shannon a cada polígono del mapa de vegetación inicial. 



![shannon](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/imagenes/shannon_snev.png)



En el mapa resultante se pueden identificar varios patrones de distribución espacial de la biodiversidad en Sierra Nevada. Durante la práctica reflexionamos sobre dichos patrones:

+ ¿Cómo cambia la diversidad al aumentar la altitud?

+ ¿A qué se puede deber dicho patrón?

+ ¿Crees que se repetiría el mismo patrón en otras montañas de la Tierra?

+ ¿hay algún patrón de cambio de diversidad en dirección este-oeste?

+ En caso afirmativo, ¿a qué puede deberse?

+ Hemos identificado una serie de patrones visualmente. ¿cómo crees que podríamos cuantificarlos y comprobar si realmente existen?



## Entrega a realizar

Una vez que hayas generado el mapa de diversidad de Sierra Nevada, haz click [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2022_2023/geoinfo/gradiente_latitud.zip) y descarga el archivo comprimido. Descomprímelo y carga en QGIS el fichero de formas que contiene. En él hay varios polígonos distribuidos en un gradiente de latitud desde Alaska hasta Colombia. Cada polígono muestra (en el campo H de la trabla de atributos), el promedio de la diversidad de todas las comunidades que hay en su interior. Para ver bien esto haz lo siguiente:
+ Despliega el shapefile anterior en un proyecto nuevo de QGIS. Asigna a cada polígono un color en función de sus valores del índice de Shannon (Campo H).
+ Instala un plugin llamado *Quick map services*. Te permitirá mostrar servicios de cartografía de todo el planeta. Cuando lo instales, verás que aparecen dos botones nuevos. Selecciona el de buscar y localiza el servicio llamado *Google satellite*. Cárgalo para ver la zona del mundo a la que se refiere la capa anterior.

Una vez hecho esto, contesta de manera razonada a las siguientes preguntas:
+ ¿Puedes ver un patrón espacial en la distribución de la diversidad? En caso afirmativo, ¿cuál es?
+ ¿A qué crees que se debe el mencionado patrón de distribución? Enumera y describe las razones físicas o biológicas que crees que justifican el patrón observado.
+ ¿Qué relación hay entre el patrón que has identificado y el que hemos visto al subir en altitud en Sierra Nevada?

Sube tus reflexiones [aquí](https://www.turnitin.com/t_submit.asp?r=28.7350562874529&svr=54&lang=es&aid=133559032) usando un archivo de word o libreoffice. Esta entrega no tiene calificación cuantitativa ni tampoco rúbrica. Haré comentarios personales basándome en los siguientes criterios:

+ Solidez de las reflexiones realizadas.
+ Grado de comprensión de la relación entre factores que explican la diversidad y patrones espaciales de esta.
+ Claridad de la redacción.



  
