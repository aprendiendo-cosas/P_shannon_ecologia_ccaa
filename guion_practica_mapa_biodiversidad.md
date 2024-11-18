# Construcción de un mapa de diversidad (índice de Shannon) de Sierra Nevada

> + **_Tipo de material_**: <span style="display: inline-block; font-size: 12px; color: white; background-color: #4caf50; border-radius: 5px; padding: 5px; font-weight: bold;"> Prácticas</span> 
> + **_Versión_**: 2024-2025
> + **_Asignatura (grado)_**: Ecología (Ciencias ambientales). 
> + **_Autor_**: Curro Bonet-García (fjbonet@uco.es)
> + **_Duración_**: 1 sesión de 1.5 horas en clase y otras 2 horas en casa.



## Objetivos

Esta práctica tiene los siguientes objetivos:
+ Disciplinares:
  + Aprender un método para cuantificar la diversidad biológica. Índice de Shannon.
  + Aprender a generar mapas de diversidad biológica. Mapas de distribución del índice de Shannon.
  + Reconocer patrones de distribución de la diversidad en un territorio concreto (Sierra Nevada).
  + Identificar las causas de los patrones anteriores.
  + Cuantificar la diversidad de los distintos tipos de ecosistemas con los que estamos trabajando en las prácticas. Concretamente, cada equipo obtendrá un valor de diversidad promedio del ecosistema con el que trabaja. 

+ Instrumentales:
  + Afianzar nuestro conocimiento de SIG.
  + Seguir aprendiendo el lenguaje de programación R e iniciarnos en su manejo.
  + Aprender algunos conceptos básicos de las bases de datos relacionales.




## Contextualización ecológica

Esta sesión práctica está muy relacionada con el tema en el que hablamos de la diversidad de las [comunidades ecológicas](https://rawcdn.githack.com/aprendiendo-cosas/Te_comunidades_diversidad_ecologia_ccaa/2024_2025/guion_comunidades_diversidad.html). En concreto, usaremos los conocimientos adquiridos en esa sesión para construir un mapa de biodiversidad de Sierra Nevada. Esto quiere decir, que debes de repasar dichos conceptos con objeto de que el aprendizaje de esta práctica sea realmente efectivo.

Para cuantificar la diversidad biológica se pueden utilizar muchos índices. En nuestro caso usaremos el denominado índice de Shannon-Wiever, que es uno de los más robustos y comunmente utilizados. Para su cálculo se necesita la siguiente información:

+ Delimitación espacial de la comunidad para la que queremos calcular el índice de diversidad.
+ Listado de especies existente en esa comunidad.
+ Abundancia de cada especie en dicha comunidad.

La siguiente presentación muestra los conceptos básicos necesarios para hacer la práctica. También puedes verla [aquí](https://prezi.com/view/ACfMCVaCBbJVoGwMJZaY) y descargarla [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2023-2024/presentacion/1_mapa_biodiv_ecologia_ccaa.exe) para Windows y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2023-2024/presentacion/1_mapa_biodiv_ecologia_ccaa.zip) para Mac. Y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2023-2024/presentacion/1_mapa_biodiv_ecologia_ccaa.pdf) la tienes en formato pdf.




<iframe src="https://prezi.com/p/embed/kCzf6valb3SyKKH5ZSUG/" id="iframe_container" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" allow="autoplay; fullscreen" height="515" width="560"></iframe>



## Metodología y flujo de trabajo

Como se puede observar en la presentación anterior, para calcular la diversidad de una comunidad, necesitamos dos fuentes de información:
+ Información de distribución de especies en la zona de estudio (Sierra Nevada). Es el primer paso fundamental porque necesitamos esta información para calcular el índice de Shannon. Para conseguir datos de presencia de especies en Sierra Nevada usaremos una infraestructura digital denominada [GBIF](https://www.gbif.org/) (Global Biodiversity Information Facility). Se trata de un portal desde el que se tiene acceso a millones de datos de presencia de especies procedentes de colecciones biológicas (herbarios, colecciones animales, etc.) de todo el planeta. Esta iniciativa está promovida y mantenida por multitud de países que han puesto en común toda la información de la que disponen para conocer mejor la distribución de la biodiversidad en la Tierra. Accederemos a este portal y descargaremos toda la información de presencia de especies en Sierra Nevada. Esto nos dará una idea bastante aproximada de cómo se distribuye la diversida en esta zona. En nuestro caso, GBIF aporta una enorme cantidad de registros de presencia de especies en Sierra Nevada. Durante la práctica visitamos el portal de GBIF y simulamos la descarga. Como este proceso puede tardar unas horas, utilizamos datos que fueron descargados anteriormente por el profesor. Dichos datos de presencia de especies tienen el siguiente "aspecto" cuando son visualizados en QGIS. [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2023-2024/geoinfo/csv_gbif_sierra_nevada.zip) puedes descargar la capa con los datos de presencia de especies de Sierra Nevada en el mismo formato en el que se obtienen de GBIF. Para usar estos datos en la práctica debemos de importarlos en QGIS y convertirlos en un fichero de formas. Para ahorrarnos este paso y que la práctica fluya un poco mejor, ya he hecho yo este paso. [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2023-2024/geoinfo/ocurrencias_sierra_nevada_23030.zip) puedes descargar el shapefile de puntos que usaremos. Como ves más abajo, son unos cuantos miles de puntos...

![puntos](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2023-2024/imagenes/puntos.png)



+ Distribución de las comunidades ecológicas que conforman Sierra Nevada. Este paso es el más complejo conceptualmente, ya que las comunidades no tienen un límite espacial preciso. Es decir, están conectadas entre sí y no es fácil delimitar donde empieza una y acaba otra. Usaremos un mapa de vegetación para delimitar las comunidades de Sierra Nevada. Asumiremos que cada polígono de dicho mapa es una comunidad ecológica. [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2023-2024/geoinfo/vegetacion_snevada_23030.zip) puedes descargar el mapa de comunidades que usaremos en esta práctica. El enlace anterior contiene un fichero de formas con la delimitación de los polígonos del mapa de vegetación a escala 1:10.000. La siguiente figura muestra la delimitación de estas comunidades en Sierra Nevada. Aunque el mapa no tiene escala, podrás reconocer el contorno del espacio protegido de Sierra Nevada.

![comunidades](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2023-2024/imagenes/comunidades.png)



A partir de estas dos fuentes de datos obtendremos el índice de Shannon para cada una de las comunidades de Sierra Nevada. Es decir, usaremos los datos de presencia de cada especie que hay en cada una de las comunidades para calcular su índice de Shannon. En la siguiente figura puedes ver la distribución de ocurrencias de especies en unas cuantas comunidades.

![puntos_comunidades](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2023-2024/imagenes/puntos_sobre_comunidades.png)



Para ello seguiremos los pasos que se muestran en el siguiente flujo de trabajo (se ve un poco pequeño, pero si vas a la parte de abajo encontrarás una herramienta lupa para aumentar y otra para desplazarte). También puedes descargar el flujo de trabajo [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2023-2024/presentacion/sierra_nevada_shannon_QGIS_R.drawio.zip) (se abre con [esta](https://www.diagrams.net/) aplicación).



<iframe frameborder="0" style="width:100%;height:2828px;" src="https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=sierra_nevada_shannon_QGIS_R.drawio#R7V1bc6O4Ev41rto9VXEh7jzmOjunZs9mJrO3eXHJINvsYOQBnDj7648EiIslY2Jzi%2B1UygZJBtHdX3er1RIj5Xa5%2BRDA1eJX7CBvJEvOZqTcjWRZ0S3ySQtekwLTMJKCeeA6SZGUFzy5%2F6KkELDSteugMC1LiiKMvchdlQtt7PvIjkplMAjwS7nZDHtOqWAF56jUDVrwZEMPcc3%2BdJ1okT6FbOTlvyB3vmB3BuyBp9D%2BPg%2Fw2k%2FvN5KVB%2B1BfUgvuITsWul9wwV08EuhSLkfKbcBxlFytNzcIo%2BStky2hx21Wb8D5Ed1fiA%2FIPX748q8su8V88uH5%2Bnvq4crIKedi14ZQZBD6JOe4iBa4Dn2oXefl97ED43oZSVylrf5hPGKFAJS%2BA%2BKoteU2XAdYVK0iJZeWst3PX2aEK8DO%2B2HPJmZ3surHv33x%2BdvpvF08%2FeXf6%2B0VEJgMEdRRbuUe%2FRZCjdICfMB4SWKglfSIEAejNznsizAVKTmWbucrOQgpewOKlf0%2Bhl6a8SEZYvqMFwl0j1zN5S0NysUuOTuKCBl5BYEDugxLypSE3ru3CfHNqFmXJdJGmWPA8NFxqtwBW3Xn3%2BN%2BaSQAncZw4N937nLOXlCz52ST2hTykwcNyA9w5QMDy9oOglR8IyCcfg8J7%2BbYT9K2WzEkhERcmLamytg0jvOSM%2F%2FSDtKj3%2FZJwLk2hHaVDKN1aog%2FU2qemQ5JfRLDmQlJfWigGFVaoDPQjQpfaCJUDB4%2FYv%2Bfqyx07%2FTy8Und5vS2Wt6djgKjboolAcFQ4OD4R0KbfIQkJR%2BuPn4wHEvWODldE36cfOycCP0ROBDa16IJSzzYDcOWgeBZJRAoACLAwET%2BMZBIKSyvl%2FbUbu54ulUnx6ZPwCn7JpSNZ1kSy%2FRSQU6RydZF2gLoLdFKaabqihFdPmKHhKiRC70vtBH9uex4iiIn0g6ywSKxdD1vFvsYWpSfOzTa0SxjqGVHppF6eEURxFepidBSolYORE%2BzLzYtCxcx0E%2BNSlRgL8jdlniBEnxXx3mVovPfggwj1PiGAkUaWwV%2F4wOAaAoF7Yew1ZWq5St%2B9DYrPLmZCebU3bt421ILCozI1LC6wi6fuwDgvjc8%2BAqdHPe2wvXcz7BV7yO2G3Y2R6b1BrfGBmYPZJ5NQvMsVL8AwKtK5tt8c1sF57bLHICvPrKPCVasMIuddTvnwnlw6YwHF80JpV2Q%2F6J0N9Sd1AjT3NLzkF%2BTv5p8yC6xT5BOZEveg0Ew%2BgFhdHBgpLBYb%2BgvFEUWvMHVYuThCfbJY%2Fpzlz7f3CJWlXbIq17tBgUMG8ezkrzEFYa1ttYl14sp%2BGbrwY9AiMfRuiGDqFCTh6yfh4xcpc4EXGQTUbLZHjmz91o7VyEpK5hMPiBiW42KTN1rtaFzICdMkPofBGZN41uDU5mjDeaiD16psbVupCZloeCF6ek5mCS8f6tPorcko%2Bi8YPJa%2FLQMHDheDw%2BU0WSoeV4B6WCbwc4KFtX60JxqJx80BHXrXoRjYbdkoMlpc7VupAUfhbKGFsXMWnaFTlco9S4WhdyUiN%2Bf3FFOnBFVOUwV6S1WWw%2B4Pmwts%2FZDakfGz35OAkfVI3dkLO1L28Om59NdIQPuhK9cgsugnKJiZRJo%2FOx14sj0ocjoqvDckR0PsD66Prr8ExVSIaTixvC8neKbgg4YzfkDaJxZm6IzsdViZa75RM4L4Jy7m4IH2G9uCF9uCEmn93d69SMzgdUP69RYK%2FD8w2JZGC5zMzofBxVoSNd7SIal5mZMmX4wCqNnTVrZk5ZUM5mbka%2F5K4OwxcBEi9x%2FcZE%2BLDqFxye8eSMfklizXL4%2BUAqXRVxvlGRS%2BrqLknhI6tU%2B5oXQblERcRLe0ueiO5FKelL0qL%2FWGNWcRXGTLkmDbTVJq8jR3P6%2FRigEPm2S5fk0kRpCdGF8S4K6aFPPtY%2BrfoXx18h8pBtE75CB7Lbk8dJepBckBPd8nrrPet6dy%2BDiwUsvSo4WMIOX171RseDLcNqfs27zlF4MDtIiPqb0qG0dl3ULo0E97B0vaLXBbRJAJimLF%2FJkqQDRTJVoJpAVcZ2%2BHycyPe3lF1hEbVs3lGw5BMIfCqltQ0djD6Eu90NHSqEfS8o2KLM5lCR%2FvSRDgGLZlTWxnJZGkywtSI06W36y%2BMsXAVNCpD7uKRDTxhQIjMzFTKzMw1yi5OUuKwgQNBJcLmrKemgu9tgDX8TCsUqb0JhyDxyWaZLEbisrHng8i5rF8DduFEBt%2BTs70JNjlp6cjxoGRj3orYz0LIl%2Bgyx6hZik0dqDbEZ5U5cW9flu2x1pq31bW1tWdZYKvxtuZ8t624%2BTOr6Ng6I%2Bo61d%2FpIo1tldH0Ha2jwMJrAcBLOWtbXRUnsVHtvWVqL3xpHBxmHSwpcG2ttqXB%2BoqxTFa6aZkGJS2PL0CoVOT0p7ND2BoxXhR72g7xpjB83TulnB7Ru7a5VlzWN86ZS%2F1rZf3njHCDJcpUubtsq94zj%2BiLRvSVnErI%2FGiF1J0pl4QFan4acEahgyQO0CvArDY4G9Sx3FEA%2FnOFgeR7WG0j6EMy3zPtgxUHzFtUL8wnQ85CH5wFcjsq7oJbqinuh7mMU3VE15ZSAcY3wwLTKHpRg%2FGsoPP2ZuWye%2Bvx0cE79CbnNqXMA0Ch9ryxQ%2B3GFuo8dSjVtmDosV1XhZ8XLEJnIisQanRBQDG3MlklkNl7nlxoDSbBpbGtg0XuZRToULIVBolFyL8cSkNsZJLpAwpb1149f0PROcdX7b99ePl6pPPL%2BVJ68P5xZ8O31FX%2B3%2FjRvtI2a7WLWuveoS2pZshRzS2JaHmyo%2FcR921S6Qo7KdVnP3PnulW5lvwtK935DHHQUxA8z9QTRuDgNAEaBOyWEp3kAcQG210HAvElKQ5oPgIkSjiN8Nqa5AqRDdaJ7MBw7MILjWRDv%2BdjdlEwrjo%2BmC1JQ1LHA%2B89LG9fnbH%2BVMx%2F0V0Jyv8PUePz%2BOOzyCxqmLj%2BQODTZwByVk2rkdvCiSuVJKqCzjKriXKXMo6W1JAPt9JIMxPIjCGkLGzYf7DpO7vlIxi307LUXWxp%2FdCuPbmg%2Bm%2Bs77rPrrLE4JwAuqez705B%2BrTD9LTmkckjIGZ%2BusJdMSRFO4hp26%2BnzJ7G1SsrCFfRLYsVy7ewknY32OZhP4U%2BE3DQdmHwKj36mh%2FSyUpzAN4NL13tNfr4kHQ1jcJea5Dl%2BkijHr%2FQmKY1wgnwkL0LKzhhntJg3pOSOHtMuaZQXGmHovrYga8uk9aDLyPllEgHIajLHRctcFy1xTrSSv5IXlnwWjXktWu63aKnnojHfhd06YWJ2a%2BZ%2FkIKihqX1sY6l5THWaQmITzNNS4uMuKjwZIn%2BrEO7rCojWw5IjarZvKVCd3Zh13nNK640PedAqnazysQpYZWpAt5RG5MxrZkXerHN2vg042%2BxsCx1aTtOPDOMJZAavlOo6ltOoSXxMWELiJzCvLT5QT4fTBmwoWttUrHS5u03jsMa0AmiaAU7tT8J3BAZiK8Tf72cEHs6CVcTahVrjcmO8DvbgKChj43yzIwsaYKYtCAtrj1X812F2Y5AkyChVdxQHRaa%2BKTThlzN8%2FIwBTb84mJeXMyLi9lg3FHaSjsYhIupnVbed6XNeneuomgjpeZcxXfqJyrspbGDcRLZ9oon7yQK4vDChuqw4pEKH4f%2F3XeDUeoi0OkwwawXcSSeY9%2FPSqbQ6G1s4ihi%2Bo2XtOrm2ud%2F9xP1VNL2Jffx52P8xwHbNXNr0AZYLlWvoRO5D0weji21bjijv6Sgyn4LbNTOwU4dM8UhYzvEMVnCcL8pq%2BklDszCaeWUYmLOBOt6VVMEqfaM3Oll51Xiaz8QhxUJYf0WR0Ie3VEycebhuUxPzsISKcoQLBH%2FZqnTBE7dUZY6rFGWunuU1aIFs9fQOWkTVl7fLquit5F3bcLezcKqI1BYe4zW%2BCL341DIj9Ge1svUdv3nU2q1JN5wwXmA5tB38CiN2W83aCyE%2F44Mn6YPwfD1kqZ1BHTqpls1nx1%2BHHREe5y2Y8CeFtD3sX9KhsoqJ37IBuANFXPhurFSvUTkd9KygyUQytgAqmxqyae5xQ8DjFU9r663PEJ8G3YN%2Brnln7S4WVKlDhGANrdN13GQEUAnDlbCgv3LYGfj5dp3HeigcAcqS3Pb%2FD224prJKgB6p9hm%2Bo5rI%2F5H8YKCXBnsuQXX6SUitH1vRlbblkxd4NK2aWSFK5rOZPmOVjc%2Fhb20dyC2WfA28hJit3jX01LJjlYSaDqf4ZXp3QKIGK6aNrdCAPF7Op8mgLS6ADKGBSD%2BnTH3m2xXQZiYoRWauZ7ATHGG5yUgEPntw5d3Z3vYFHMGG7Pb3JFKURHnJ6Sj6cRJmIQuCgI48dEzdOA4XKxqsaBHfdgGF2VzDMrDDUUSbHwBNGMM5HZ0oHjd3Dvbklg0RyNu2Js3UNnvAmCuQ3fuZ7rMjrflzjdLZc64HQ8EFMedUy9dkFtAG2au%2B491sg94FNeDGnoxjCb%2FkJFOy2qxr%2F1%2BzLLjDhSVmF0%2BQGYYPOQMa2y1Jg2nt4yxEoT7l973NqNa2W%2FxfiebSebID8VsNbc1kLy9OylQLd5OmUbmzney54nWTwrC0NbIVy5932sS%2BwteV%2Fa7ADLCpGRPigg78fYVXvwZx6jit1psbLSKcFaRmDs%2FPg5R8Owm%2B9QCf8gePTFK22NhYAgS57rfiOL00hUqcbA%2FKXxYL7bQepnE7oDOzb8q4Tg68wH697l5B6dmTIGaaWv%2FDmHI7fQyCYWPCXjBF7aT%2B5L7ql4XxP4Zkf5D%2BtKoSZjEb5KN%2FpIozmm5vjoLx2Q7%2FUl8fBqwtMKS12u2xJB%2BkpY6R4sgpFO1hd9A0MIHdLJoCwugfPz18bcvX6%2BLMefp6QRXdM0cm%2BW5dACYxelqP2Uha04vulJ3S8uBbSZb1e1hz4s2ZlVUbcwGugwksqlyIGGByiPtyihdQ11IWMlXTyv3%2Fwc%3D"></iframe>


Este flujo de trabajo se ejecuta usando R. R es un lenguaje de programación muy frecuentemente utilizado en ámbitos científicos. Se usa para hacer análisis de datos, dibujar gráficas, mapas, etc. En esta práctica nos familiarizaremos un poco con este lenguaje. Concretamente usaremos un interfaz gráfico llamado RStudio. [Aquí](https://www.youtube.com/watch?v=v0rBJ86aMa8) tienes un breve vídeo en el que cuento cómo instalar QGIS, R y Rstudio.



El flujo de trabajo anterior se realiza ejecutando secuencialmente las líneas del siguiente bloque de código:

```R
# Este script genera un mapa del índice de Shannon a partir de los datos de presencias de especies existentes en GBIF y de un mapa de vegetación de Sierra Nevada

# 1. Establece directorio de trabajo
setwd("/tu/ruta")

# 2. Instalar y cargar los paquetes necesarios
# 2.1 El paquete "sf" permite a R trabajar con shapefiles. Es decir capas vectoriales.
install.packages("sf")
library(sf)

# 2.2 El paquete "terra" permite a R trabajar con información geográfica en formato raster.
install.packages("terra")
library(terra)

# 2.3 El paquete "sqldf" permite a R hacer operaciones con tablas como si fuera una base de datos.
install.packages("sqldf")
library(sqldf)

# 3. Importamos el archivo csv de GBIF con sus atributos geográficos
presencias <- read.csv("0118822-200613084148143.csv", header = TRUE, sep ="\t", dec = ".")

# 4. Convertimos la tabla importada a un objeto geográfico tipo sf
presencias_geo <- st_as_sf(presencias, coords = c("decimalLongitude","decimalLatitude"), crs = 4326)

# 5. Reproyectamos la capa creada al sistema de coordenadas 23030 (UTM)
presencias_geo_23030 <- st_transform(presencias_geo, crs = 23030)

# 6 Importamos la capa con la delimitación de las comunidades ecológicas.
¿COMO HACEMOS ESTO? BUSCAREMOS EN INTERNET O LE PREGUNTAMOS A CHATGPT...
SE TRATA DE APRENDER CÓMO R PUEDE IMPORTAR LA CAPA DE COMUNIDADES ECOLÓGICAS DESCRITA MÁS ARRIBA. SE TRATA DE UN SHAPEFILE DE POLÍGONOS. EL OBJETO CREADO DEBE DE LLAMARSE "comunidades"

# 9. Asignamos a cada punto de presencia el código del polígono del mapa de vegetación en el que está. Unión espacial. OJO, ESTE PASO PUEDE TARDAR UNOS MINUTOS EN EJECUTARSE PORQUE REQUIERE HACER MUCHAS OPERACIONES
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

# 14. Calcular pi por especie y por polígono.
T_num_ind_sp_pol_mas_num_ind_pol<-sqldf("SELECT OBJECTID, scientificName, num_ind_sp_pol, num_ind_pol, (num_ind_sp_pol*1.0/num_ind_pol) pi FROM T_num_ind_sp_pol_mas_num_ind_pol")

# 15. Calcular el log2 pi por especie y por polígono (log = ln). Log2(pi)=log(pi)/log(2)
T_num_ind_sp_pol_mas_num_ind_pol<-sqldf("SELECT OBJECTID, scientificName, num_ind_sp_pol, num_ind_pol, pi, (log(pi)/log(2))*pi log2pi_pi FROM T_num_ind_sp_pol_mas_num_ind_pol")

# 16. Calcular H por polígono
T_Shannon<-sqldf("SELECT OBJECTID, sum(log2pi_pi)*-1 H FROM T_num_ind_sp_pol_mas_num_ind_pol GROUP BY OBJECTID")

# 17. Fusionar la tabla que tiene el índice de Shannon con la capa de comunidades.
comunidades<-merge(x = comunidades, y = T_Shannon, by.x = "OBJECTID", by.y = "OBJECTID")

# 18. Exportamos el objeto "comunidades" a un archivo raster que usaremos más adelante
# 18.1 Convertimos "comunidades" a un archivo vectorial legible por el paquete "terra". Al haber sido creado con el paquete "sf" hay que hacer esta conversión
comunidades_vect<-vect(comunidades)

#18.2 Creamos un raster vacío con la extensión de "comunidades_vect" y un tamaño de píxel de 100m
raster_base<-rast(comunidades_vect, res=100)

#18.3 Creamos un objeto raster en R resultado de rasterizar "comunidades_vect" usando como "plantilla" el llamado "raster_base" y añadiendo a cada píxel los valores contenidos en el campo "H" de "comunidades_vect"
shannon_snevada<-rasterize(comunidades_vect, raster_base, field="H")

# 18. Exportamos "shannon_snevada" a un archivo raster en formato .tif
writeRaster(shannon_snevada, "shannon_snevada.tif", overwrite=TRUE)


```



El flujo de trabajo descrito arriba permite obtener un mapa de diversidad de Sierra Nevada asumiendo que cada polígono del mapa de vegetación es una comunidad. Esto nos permitirá estudiar patrones espaciales de cambio de la diversidad a escala de todo el territorio. Pero nuestro objetivo en el contexto del trabajo de prácticas que tenemos que hacer es generar un valor numérico que muestre la diversidad promedio de cada uno de los ecosistemas con los que estamos trabajando. Para eso tendremos que añadir al flujo de trabajo que se describe a continuación los pasos necesarios para hacer lo siguiente:

+ Combinar de alguna manera (con R o con QGIS) el mapa de diversidad obtenido (en formato raster) con el mapa de distribución de los ecosistemas de Sierra Nevada.
+ Calcular el valor promedio de todos los píxeles del mapa de diversidad en cada uno de los ecosistemas de Sierra Nevada. 

Esta es la parte que tendréis que hacer vosotros individualmente o en grupo. Para ello necesitáis usar esta capa (*ecosistemas_snev_dissolve.shp*) que muestra la distribución de los ecosistemas de Sierra Nevada. Al mostrarla en QGIS veréis que es una capa vectorial con polígonos. Pero tiene una particularidad. Es una capa en la que todos los polígonos que tienen el mismo tipo de ecosistema se han fusionado en uno solo. Aunque visualmente aparezcan como muchos polígonos, en realidad para el SIG y para la tabla de atributos de la capa, computa como un único polígono. Por eso, cuando abráis la tabla de atributos, veréis solo 12 filas que corresponden con los 12 tipos de ecosistemas que hay en Sierra Nevada según esta capa. 

Tendréis que buscar un método para asignar acada polígono de esta capa el valor promedio de índice de Shannon de todos los píxeles que contiene cada tipo de ecosistema. Por ejemplo, para el polígono marcado en rojo de la imagen inferior, se calculará el valor promedio del índice de Shannon de todos los píxeles que tiene dentro (mostrados en una gama de colores del rojo al verde). Podéis hacer esto en QGIS o en R. Es importante que preguntéis a ChatGPT o a cualquier IA para dar con el método adecuado. Las palabras claves podrían ser: extraer información de un raster a una capa poligonal, asignar estadísticas de un raster a una capa de polígonos, etc.



![zonal](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/main/imagenes/zonal_statistics.png)





## Resultados esperables
El siguiente mapa muestra el resultado obtenido en esta práctica. Se trata de un fichero de formas vectorial en el que se ha asignado el valor del índice Shannon a cada polígono del mapa de vegetación inicial. El mapa se ha obtenido de la siguiente forma:

+ Cargamos en QGIS la capa raster obtenida al final del flujo de trabajo anterior.
+ Clasificamos en función de los valores numéricos de cada píxel de la siguiente manera:
  + Método de clasificación: Banda sencilla pseudocolor.
  + Rampa de colores: Spectral
  + Modo de clasificación: quantiles



![shannon](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2023-2024/imagenes/shannon_snev.png)



En el mapa resultante se pueden identificar varios patrones de distribución espacial de la biodiversidad en Sierra Nevada. En teoría estudiamos esto desde un punto de vista conceptual. Ahora toca reflexionar de manera práctica con el mapa delante: 

+ ¿Cómo cambia la diversidad al aumentar la altitud?

+ ¿A qué se puede deber dicho patrón?

+ ¿Crees que se repetiría el mismo patrón en otras montañas de la Tierra?

+ ¿hay algún patrón de cambio de diversidad en dirección este-oeste?

+ En caso afirmativo, ¿a qué puede deberse?

+ Hemos identificado una serie de patrones visualmente. ¿cómo crees que podríamos cuantificarlos y comprobar si realmente existen?



## Material a preparar para el trabajo de los ecosistemas











****

[Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/archive/refs/tags/2024_2025.zip) puedes descargar un archivo .zip que contiene este guión en formato html y todo el material que incluye.

****
Haz click [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/releases) para ver cómo ha cambiado este guión en los distintos cursos académicos.

****
 <p xmlns:cc="http://creativecommons.org/ns#" >El contenido de este repositorio se puede utilizar bajo la siguiente licencia:  <a  href="https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1"  target="_blank" rel="license noopener noreferrer"  style="display:inline-block;">CC BY-NC-SA 4.0<img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"  alt=""><img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"  alt=""><img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/nc.svg?ref=chooser-v1"  alt=""><img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1"  alt=""></a></p> 

<p>Esta licencia no aplica a enlaces a artículos, libros o imágenes no originales. Estos productos tienen su licencia correspondiente.</p>