# Instrucciones para realizar la práctica denominada "Construcción de un mapa de diversidad de Sierra Nevada"


> + **_Versión_**: 2020-2021
> + **_Asignatura (grado)_**: Ecología (Ciencias ambientales). Curso 2020-2021
> + **_Autor_**: Curro Bonet-García (fjbonet@uco.es)
> + **_Duración_**: 3 horas.



## Objetivos

Esta práctica tiene los siguientes objetivos:
+ Disciplinares:
  + Reconocer el concepto de biodiversidad ya estudiado en las clases de teoría.
  + Aprender un método para cuantificar la diversidad biológica. Índice de Shannon.
  + Aprender a generar mapas de diversidad biológica. Mapas de distribución del índice de Shannon.
  + Reconocer patrones de distribución de la diversidad en un territorio concreto (Sierra Nevada).
  + Identificar las causas de los patrones anteriores.
  
+ Instrumentales:

  + Afianzar nuestro conocimiento de SIG.
  + Mejorar nuestro conocimiento de R.
  + Aprender algunos conceptos básicos de las bases de datos relacionales.  
  
   




## Contextualización ecológica

Esta sesión práctica está muy relacionada con el Tema 6 de teoría ([Comunidades. El concepto de diversidad](https://aprendiendo-cosas.github.io/Te_comunidades_diversidad_ecologia_ccaa/guion_comunidades_diversidad.html)). En concreto, usaremos los conocimientos adquiridos en esa sesión para construir un mapa de biodiversidad de Sierra Nevada. Esto quiere decir, que debes de repasar dichos conceptos con objeto de que el aprendizaje de esta práctica sea realmente efectivo...

Para cuantificar la diversidad biológica se pueden utilizar muchos índices. En nuestro caso usaremos el denominado índice de Shannon-Wiever, que es uno de los más robustos y comunmente utilizados. Para su cálculo se necesita la siguiente información:

+ Delimitación espacial de la comunidad para la que queremos calcular el índice de diversidad.
+ Listado de especies existente en esa comunidad.
+ Abundancia de cada especie en dicha comunidad.

La siguiente presentación muestra los conceptos básicos necesarios para hacer la práctica. También puedes verla aquí y descargarla aquí para Windows y aquí para Mac. Y aquí la tienes en formato pdf.




<p><iframe src="https://prezi.com/view/ACfMCVaCBbJVoGwMJZaY/embed" width="1200" height="900"> </iframe></p>



## Metodología y flujo de trabajo

Como se puede observar en la presentación anterior, para calcular la diversidad de una comunidad, necesitamos dos fuentes de información:
+ Recopilar información de distribución de especies en la zona de estudio (Sierra Nevada). Es el primer paso fundamental porque necesitamos esta información para calcular el índice de Shannon. Para conseguir datos de presencia de especies en Sierra Nevada usaremos una infraestructura digital denominada [GBIF](https://www.gbif.org/) (Global Biodiversity Information Facility). Se trata de un portal desde el que se tiene acceso a millones de datos de presencia de especies procedentes de colecciones biológicas (herbarios, colecciones animales, etc.) de todo el planeta. Esta iniciativa está promovida y mantenida por multitud de países que han puesto en común toda la información de la que disponen para conocer mejor la distribución de la biodiversidad en la Tierra. Accederemos a este portal y descargaremos toda la información de presencia de especies en Sierra Nevada. Esto nos dará una idea bastante aproximada de cómo se distribuye la diversida en esta zona. En nuestro caso, GBIF aporta una enorme cantidad de registros de presencia de especies en Sierra Nevada. Durante la práctica visitamos el portal de GBIF y simulamos la descarga. Como este proceso puede tardar unas horas, utilizamos datos que fueron descargados anteriormente por el profesor. Dichos datos de presencia de especies tienen el siguiente "aspecto" cuando son visualizados en QGIS. **Aquí** puedes descargar la capa con los datos de presencia de especies de Sierra Nevada.









+ Distribución de las comunidades ecológicas que conforman Sierra Nevada. Este paso es el más complejo conceptualmente, ya que las comunidades no tienen un límite espacial preciso. Es decir, están conectadas entre sí y no es fácil delimitar donde empieza una y acaba otra. Usaremos un mapa de vegetación para delimitar las comunidades de Sierra Nevada. Asumiremos que cada polígono de dicho mapa es una comunidad ecológica. **Aquí **puedes descargar el mapa de comunidades que usaremos en esta práctica.



A partir de estas dos fuentes de datos obtendremos el índice de Shannon para cada una de las comunidades de Sierra Nevada. Para ello seguiremos los pasos que se muestran en el siguiente flujo de trabajo (que puedes descargar aquí). 



La ejecución del anterior flujo de trabajo se realiza usando R. Para ello iremos ejecutando secuencialmente las líneas del siguiente bloque de código:

```R
#Este script calcula el Indice Shannon de Sierra Nevada
# usando la información existente en GBIF y un mapa de vegetación a escala 1:10.000

## Establece directorio de trabajo. Recuerda cambiarlo por el tuyo.
setwd("/Users/fjbonet_trabajo/Google_Drive/4_docencia/eco_ccaa_uco/actos_docentes/P_shannon_ecologia_ccaa/preparacion")

## Carga paquetes que necesitamos
install.packages("rgdal")
library(rgdal)

install.packages("sqldf")
library(sqldf)

## Importa la capa con las ocurrencias de GBIF
ocurrencias<-readOGR(dsn=".", layer="ocurrencias_sierra_nevada_23030", verbose = FALSE)

## Importa la capa con la delimitación de las comunidades ecológicas.
comunidades<-readOGR(dsn=".",layer="vegetacion_snevada_23030", verbose = FALSE)

## Unión espacial: asigna a cada punto el código de la comunidad en la que se encuentra.
ocurrencias$id_com <- over(ocurrencias, comunidades)$OBJECTID

## Extraer la "tabla de atributos" para hacer los cálculos del índice de Shannon
bio<-ocurrencias@data

## Calcular el índice de Shannon

### Calcular el número de individuos por especie y por comunidad (num_ind_sp_com)
T_num_ind_sp_com<-sqldf("SELECT id_com, scientific,  count(scientific) num_ind_sp_com  FROM bio GROUP BY id_com, scientific")

### Calcular el número total de individuos por comrícula.
T_num_ind_com<-sqldf("SELECT id_com, sum(num_ind_sp_com) num_ind_com FROM T_num_ind_sp_com GROUP BY id_com")

### Fusionar las tablas anteriores para calcular Pi
T_num_ind_sp_com_mas_num_ind_com<-sqldf("SELECT id_com, scientific, num_ind_sp_com, num_ind_com FROM T_num_ind_sp_com LEFT JOIN T_num_ind_com USING(id_com)")

### Calcular pi por especie y por comunidad
T_num_ind_sp_com_mas_num_ind_com<-sqldf("SELECT id_com, scientific, num_ind_sp_com, num_ind_com, (num_ind_sp_com*1.0/num_ind_com) pi FROM T_num_ind_sp_com_mas_num_ind_com")

### Calcular el log2 pi por especie y por comunidad (log = ln). Log2(pi)=log(pi)/log(2)
T_num_ind_sp_com_mas_num_ind_com<-sqldf("SELECT id_com, scientific, num_ind_sp_com, num_ind_com, pi, (log(pi)/log(2))*pi lnpi_pi FROM T_num_ind_sp_com_mas_num_ind_com")

### Calcular H por comunidad
T_Shannon<-sqldf("SELECT id_com, sum(lnpi_pi)*-1 H FROM T_num_ind_sp_com_mas_num_ind_com GROUP BY id_com")

## Fusionar la tabla que tiene el índice de Shannon con la distribución de comunidades.
comunidades<-merge(x = comunidades, y = T_Shannon, by.x = "OBJECTID", by.y = "id_com")

## Exportar la capa resultante a un shapefile.
writeOGR(comunidades, dsn=".", layer="Shannon_com_sierra_nevada", driver="ESRI Shapefile", overwrite=TRUE )

```



La siguiente presentación muestra paso a paso el flujo de trabajo. También puedes verla aquí y descargarla aquí para Windows y aquí para Mac. Y aquí la tienes en formato pdf.











## Vídeos de las sesiones

