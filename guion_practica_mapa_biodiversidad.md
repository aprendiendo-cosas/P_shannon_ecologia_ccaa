# Construcción de un mapa de diversidad (índice de Shannon) de Sierra Nevada

> + **_Tipo de material_**: <span style="display: inline-block; font-size: 12px; color: white; background-color: #4caf50; border-radius: 5px; padding: 5px; font-weight: bold;"> Prácticas</span> 
> + **_Versión_**: 2025-2026
> + **_Asignatura (grado)_**: Ecología (Ciencias ambientales). 
> + **_Autor_**: Curro Bonet-García (fjbonet@uco.es)
> + **_Duración_**: 2 sesiones de 2 horas y otras 2 horas en casa.



## Objetivos

Esta práctica tiene los siguientes objetivos:
+ Disciplinares:
  + Aprender un método para cuantificar la diversidad biológica. Índice de Shannon.
  + Aprender a generar mapas de diversidad biológica. Mapas de distribución del índice de Shannon.
  + Reconocer patrones de distribución de la diversidad en un territorio concreto (Sierra Nevada).
  + Identificar las causas de los patrones anteriores.
  + Cuantificar la diversidad de los distintos tipos de ecosistemas con los que estamos trabajando en las prácticas. Concretamente, cada estudiante obtendrá un valor de diversidad promedio del ecosistema con el que trabaja. 

+ Instrumentales:
  + Afianzar nuestro conocimiento de SIG.
  + Seguir aprendiendo el lenguaje de programación R e iniciarnos en su manejo.
  + Aprender algunos conceptos básicos de las bases de datos relacionales.




## Contextualización ecológica

Esta sesión práctica está muy relacionada con el tema en el que hablamos de la diversidad de las [comunidades ecológicas](https://rawcdn.githack.com/aprendiendo-cosas/Te_comunidades_diversidad_ecologia_ccaa/main/guion_comunidades_diversidad.html). En concreto, usaremos los conocimientos adquiridos en esa sesión para construir un mapa de biodiversidad de Sierra Nevada. Esto quiere decir, que debes de repasar dichos conceptos con objeto de que el aprendizaje de esta práctica sea realmente efectivo.

Disponer de un mapa que muestre cómo se distribuye la diversidad en el territorio es muy útil por muchas razones. En primer lugar, nos ayuda a leer el paisaje con la mirada de la ecología. Como sabemos que la diversidad está relacionada con elementos clave como la resistencia y la resiliencia, sabiendo cómo se distribuye la diversidad estamos también adquiriendo información sobre cómo se distribuyen las propiedades anteriores en el territorio. Esta información es también muy valiosa para gestionar el territorio. Por ejemplo, los lugares en los que hay baja diversidad, pero tienen las condiciones ambientales adecuadas para que sea alta, requerirán actuaciones de restauración por nuestra parte.

Para cuantificar la diversidad biológica se pueden utilizar muchos índices. En nuestro caso usaremos el denominado índice de Shannon-Wiever, que es uno de los más robustos y comunmente utilizados.



## Metodología docente y flujo de trabajo

Como habrás leído en el apartado de objetivos, nos planteamos cuestiones muy diferentes en esta práctica. Por un lado hay objetivos ecológicos y por otros hay también objetivos instrumentales relacionados con el manejo de SIG y de R. Para satisfacer ambos tipos de objetivos seguiremos una metodología docente que combina estas dos:

- **Aproximación de complejidad creciente**: Cuando aprendemos algo nuevo, es útil ir incorporando ideas y conceptos poco a poco, aumentando la complejidad hasta llegar al "destino final" del aprendizaje. En nuestro caso, explicaré la metodología que seguiremos usando tres niveles de complejidad: uno con una presentación, otro en la pizarra y finalmente habrá disponible un esquema digital muy detallado. Este flujo de trabajo describe los pasos que seguiremos con R para generar el mapa de diversidad.
- **Enseñanza incremental:** Este método docente implica dividir las tareas en bloques cuyo abordaje implica satisfacer objetivos de aprendizaje específicos. Además, para avanzar en el flujo de trabajo será necesario ir completando los bloques de manera secuencial. Aplicar esta técnica implica que el guión se divide en bloques específicos y explicados de manera individual.
- **Andamiaje:** Esto consiste en que durante el aprendizaje yo os dejaré andamios en forma de pistas, sugerencias, pequeños retos, etc. para mejorar vuestras habilidades con R. No os daré el código completo, sino que os daré apoyos temporales que os ayudarán a realizar tareas que aún no sabéis hacer de forma autónoma. A lo largo de los bloques en los que se divide la metodología aparecerán varios de estos andamios. Se irán retirando progresivamente conforme vayáis aprendiendo. En los últimos bloques habrá menos pistas. Es decir, habrá un proceso de asunción paulatina de responsabilidad por vuestra parte. 

Atendiendo a todo lo anterior, el guión se divide en los siguientes apartados a partir de aquí:

+ Primer nivel de complejidad: ideas generales del flujo de trabajo a seguir y conexión la teoría.
+ Segundo nivel de complejidad: conexión del flujo de trabajo con los datos reales que usaremos. Descripción en la pizarra.
+ Tercer nivel de complejidad: traducción del flujo de trabajo a un programa de R.

Vamos a ello:



## *Primer nivel de complejidad*: ideas generales del flujo de trabajo a seguir y conexión con la teoría.

La siguiente presentación muestra los conceptos básicos necesarios para hacer la práctica. También puedes verla [aquí](https://prezi.com/view/ACfMCVaCBbJVoGwMJZaY) y descargarla [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2024_2025/presentacion/1_mapa_biodiv_ecologia_ccaa.exe) para Windows y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2024_2025/presentacion/1_mapa_biodiv_ecologia_ccaa.zip) para Mac. Y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2024_2025/presentacion/1_mapa_biodiv_ecologia_ccaa.pdf) la tienes en formato pdf. En esta presentación se describe de manera muy general cómo se realizará el mapa de biodiversidad. Se trata de la primera explicación de este tipo que realizamos durante la clase. 

<iframe src="https://prezi.com/p/embed/kCzf6valb3SyKKH5ZSUG/" id="iframe_container" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" allow="autoplay; fullscreen" height="515" width="560"></iframe>

En este primer nivel de complejidad aprenderemos:

+ Cómo podemos calcular el índice de Shannon de una comunidad a partir de unos datos tomados en campo.
+ Algunas nociones básicas de bases de datos relacionales. Vemos concretamente cómo se agrupan datos por un campo y cómo se unen tablas. Estos conceptos serán muy útiles en esta práctica.
+ Los conteos de individuos por especie se muestran ya de manera agregada. Contamos el número de individuos que hay de cada especie y ya tenemos esos datos en una tabla. En realidad, nuestros datos se organizan de otra manera. En el siguiente nivel de complejidad en qué consiste esta diferencia.



## *Segundo nivel de complejidad*: conexión del flujo de trabajo con los datos reales que usaremos. Descripción en la pizarra.

En este segundo nivel de complejidad explicaré con el apoyo de la pizarra y de manera más concreta lo que haremos durante esta práctica. Partiendo del esquema planteado en el primer nivel de complejidad, incorporaremos una serie de elementos nuevos:
+ Las fuentes de datos que usaremos para la práctica: mapa de distribución de comunidades ecológicas y mapa de presencia de especies.
+ Los procesos de importación de los datos en R.
+ Algunas funcionalidades de R relacionadas con los SIG. Es decir, cómo R puede ser un SIG muy potente.
+ Cómo se agrega la información numérica en las tablas para calcular el índice de Shannon.

 A continuación se muestra lo que se dibujó en la pizarra.

![pizarra](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/main/imagenes/pizarra_.jpg)



Como se puede describe en la presentación anterior, para calcular la diversidad de una comunidad, necesitamos dos fuentes de información:

+ Información de distribución de especies en la zona de estudio (Sierra Nevada). Es el primer paso fundamental porque necesitamos esta información para calcular el índice de Shannon. Para conseguir datos de presencia de especies en Sierra Nevada usaremos una infraestructura digital denominada [GBIF](https://www.gbif.org/) (Global Biodiversity Information Facility). Se trata de un portal desde el que se tiene acceso a millones de datos de presencia de especies procedentes de colecciones biológicas (herbarios, colecciones animales, etc.) de todo el planeta. Esta iniciativa está promovida y mantenida por multitud de países que han puesto en común toda la información de la que disponen para conocer mejor la distribución de la biodiversidad en la Tierra. Accederemos a este portal y descargaremos toda la información de presencia de especies en Sierra Nevada. Esto nos dará una idea bastante aproximada de cómo se distribuye la diversida en esta zona. En nuestro caso, GBIF aporta una enorme cantidad de registros de presencia de especies en Sierra Nevada. Durante la práctica visitamos el portal de GBIF y simulamos la descarga. Como este proceso puede tardar unas horas, utilizamos datos que fueron descargados anteriormente por el profesor. Dichos datos de presencia de especies tienen el siguiente "aspecto" cuando son visualizados en QGIS. [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2024_2025/geoinfo/csv_gbif_sierra_nevada.zip) puedes descargar la capa con los datos de presencia de especies de Sierra Nevada en el mismo formato en el que se obtienen de GBIF. Usaremos este archivo para generar el mapa de biodiversidad de Sierra Nevada.

![puntos](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/2024_2025/imagenes/puntos.png)



+ Distribución de las comunidades ecológicas que conforman Sierra Nevada. Este paso es el más complejo conceptualmente, ya que las comunidades no tienen un límite espacial preciso. Es decir, están conectadas entre sí y no es fácil delimitar donde empieza una y acaba otra. Usaremos un mapa de vegetación para delimitar las comunidades de Sierra Nevada. Asumiremos que cada polígono de dicho mapa es una comunidad ecológica. Es una asunción importante, pero es la mejor que podemos hacer con la información disponible. [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/2024_2025/geoinfo/vegetacion_snevada_23030.zip) puedes descargar el mapa de comunidades que usaremos en esta práctica. El enlace anterior contiene un fichero de formas (Shapefile) con la delimitación de los polígonos del mapa de vegetación a escala 1:10.000. La siguiente figura muestra la delimitación de estas comunidades en Sierra Nevada. Aunque el mapa no tiene escala, podrás reconocer el contorno del espacio protegido de Sierra Nevada. El mapa de vegetación que usamos procede de un mapa de vegetación de Andalucía generado por la REDIAM (Red de Información Ambiental de Andalucía), que es un organismo dependiente del gobierno regional y que se encarga de generar y publicar información ambiental de todo tipo.

![comunidades](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/2024_2025/imagenes/comunidades.png)



A partir de estas dos fuentes de datos obtendremos el índice de Shannon para cada una de las comunidades de Sierra Nevada. Es decir, usaremos los datos de presencia de cada especie que hay en cada una de las comunidades para calcular su índice de Shannon. En la siguiente figura puedes ver la distribución de ocurrencias de especies en unas cuantas comunidades.

![puntos_comunidades](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/2024_2025/imagenes/puntos_sobre_comunidades.png)





## *Tercer nivel de complejidad*: traducción del flujo de trabajo a un programa de R



### Bloque 1: Preparación del entorno de trabajo en R

+ **Objetivos de aprendizaje R**

  + Configuración del directorio de trabajo.

  + Instalación y carga de los paquetes necesarios.

+ **Objetivos de aprendizaje ecológico**

+ **Nivel de andamiaje**

  + Alto. El profesor lo hace y los estudiantes repiten después.
  
  


```R
# ------------ 1.1 DIRECTORIO DE TRABAJO ------------
# Establece directorio de trabajo
# IMPORTANTE: Cambia esta ruta a la carpeta donde guardaste los archivos. Recuerda cambiar el sentido de la barra en función de tu sistema operativo
setwd("/tu/ruta")

# Verificar que estamos en el directorio correcto
getwd()  # Debe mostrar la ruta que acabas de establecer

# ------------ 1.2 INSTALACIÓN DE PAQUETES ------------
# Los paquetes son "bibliotecas" que añaden funcionalidad a R. Recuerda que solo hay que instalarlos una vez, pero cuando cierres R tendrás que volver a cargarlos en memoria con la función library

# sf: Para trabajar con datos vectoriales (puntos, polígonos)
install.packages("sf")
library(sf)

# terra: Para trabajar con datos raster (mapas en formato cuadrícula)
install.packages("terra")
library(terra)

# sqldf: Para manipular tablas como si fueran bases de datos
install.packages("sqldf")
library(sqldf)
```





### Bloque 2: Importación y transformación de datos de presencia de especies

+ **Objetivos de aprendizaje R**

  + Importar datos tabulares con una componente espacial.

  + Inspeccionar la estructura de datos.

  + Aprender a reproyectar datos geográficos con R.

+ **Objetivos de aprendizaje ecológico**
  + Comprender qué es GBIF y qué tipo de datos contiene.
  + Entender las limitaciones de los datos de GBIF.
  + Identificar los campos relevantes para nuestro estudio.
  + Evaluar la cantidad de datos de presencia.
+ **Nivel de andamiaje**

  + Medio-alto. El profesor lo hace casi todo y los estudiantes repiten después. Solo hay un paso en el que los estudiantes deben de recordar lo visto en la práctica anterior.

#### Procedimiento en R

+ Primero usamos la función `read.csv` para cargar en R el archivo llamado `0118822-200613084148143.csv` que puedes descargar [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/refs/heads/main/geoinfo/csv_gbif_sierra_nevada.zip). Como es una función que ya hemos usado, trata de aplicarla tú en función de la experiencia previa. Para saber si el archivo `csv` tiene encabezado, cuáles son los delimitadores de campos y de decimales, solo tienes que abrirlo con un editor de texto. Si tienes dudas sobre cómo proceder, pregunta a algún compañero o a una IA. El objeto de R que deberá almacenar los datos de presencia se llama `presencias`. 

```{R}
# ------------ 2.1 IMPORTACIÓN DE DATOS DE GBIF ------------

# GBIF contiene millones de registros de presencia de especies
# Cada fila = una observación de una especie en un lugar y momento concretos

presencias <- read.csv(#busca los parámetros necesarios para que este alínea funcione)
```

+ Para comprobar que hemos importado bien los datos, observamos la estructura y contenidos de la tabla `presencias`.

```R
# ¿Cuántos registros de presencia tenemos?
# la función nrow() cuenta el número de filas de un data frame (tabla)
nrow(presencias)

# Ver nombres de todas las columnas disponibles
# la función names() devuelve los nombres de las columnas de un data frame
names(presencias)

# Ver las primeras 6 filas para entender la estructura
# la función head() muestra las primeras filas de un data frame
head(presencias)

```
+ A partir de la información anterior,
  + ¿Qué columnas nos indican la especie del punto de presencia en cuestión?
  + ¿Cuáles contienen información sobre la ubicación geográfica del punto? 
  + ¿En qué sistema de coordenadas se representa la ubicación espacial de cada punto?

+ Las respuestas a las preguntas anteriores nos permiten saber cuántas especies diferentes hay en la tabla:

```R
# Ver las primeras 6 filas para entender la estructura
# la función head() muestra las primeras filas de un data frame
head(presencias)

# ¿Cuántas especies diferentes aparecen?
# la función length() cuenta el número de elementos en un vector (que puede ser una tabla o una columna)
# la función unique() devuelve los valores únicos de un vector. En este caso de la columna scientificName
length(unique(presencias$scientificName))

```

+ Para terminar este bloque, te propongo que crees una gráfica de barras que muestre la información de abundancia de cada especie como lo hacen las gráficas de "rango abundancia" que vimos en teoría. Es decir, un gráfico parecido al que se muestra a continuación. Busca información en internet o pregunta a tu IA favorita. Recuerda que partes de la tabla `presencias`. Para generar la gráfica tienes que dar los siguientes pasos:

  + Generar una tabla que cuente la abundancia de cada especie. Llama a esa tabla `abundancias`. Para obtenerla puedes usar una función llamada `table `que cuenta las ocurrencias de cada valor de una tabla.
  + Luego ordena esa tabla de mayor a menor. Crea una tabla llamada `abundancias_ordenadas` usando la función `sort`.
  + Finalmente, usa la función `barplot` para generar el gráfico.

  Podrás ver el código más abajo. No lo uses directamente hasta que hayas pasado al menos 5' intentándolo tú misma/o. Este paso no es necesario para generar el mapa de diversidad, pero haciéndolo mejoramos nuestro conocimiento de R.

![equitatividad](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/refs/heads/main/imagenes/equitatividad.png)





Una vez que obtengas el gráfico, nos preguntamos: ¿dirías que Sierra Nevada en general es muy equitativa o poco? ¿ves razonable los resultados obtenidos en la gráfica?




### Bloque 3: Importación de la capa de comunidades ecológicas.

+ **Objetivos de aprendizaje R**

  + Importar datos geográficos vectoriales (shapefile)

  + Inspeccionar la estructura de datos.

  + Recordar el concepto de sistema de referencia espacial

  + Conocer los formatos de R para almacenar información geográfica.
+ **Objetivos de aprendizaje ecológico**
  + Entender la estructura de datos del mapa de vegetación.
  + Entender las asunciones que hacemos al considerar que los polígonos del mapa de vegetación son comunidades ecológicas.
+ **Nivel de andamiaje**

  + Alto. El profesor lo hace y los estudiantes repiten después.



### Bloque 4: Unión espacial y preparación de datos para el cálculo de la diversidad

+ **Objetivos de aprendizaje R**

  + Realizar una unión espacial (spatial join) entre puntos y polígonos (asignar a cada punto el polígono en el que se encuentra)

  + Filtrar atributos relevantes

+ **Objetivos de aprendizaje ecológico**
  + Entender que los datos con los que trabajamos son incompletos.
  + Comprender las implicaciones que tiene la unión espacial que vamos a hacer.

+ **Nivel de andamiaje**

  + Alto. El profesor lo hace y los estudiantes repiten después.



### Bloque 5: Cálculo de abundancias relativas de especies por comunidad

+ **Objetivos de aprendizaje R**

  + Entender algunas operaciones básicas de SQL con bases de datos (agrupar por campos, relación entre tablas)
+ **Objetivos de aprendizaje ecológico**
  + Comprender bien qué la diversidad depende del número de especies y de la abundancia relativa de cada especie.
  + Calcular la abundancia y la frecuencia relativa.
+ **Nivel de andamiaje**

  + Alto. El profesor lo hace y los estudiantes repiten después.



### Bloque 6: Cálculo del índice de Shannon por comunidad

+ **Objetivos de aprendizaje R**

  + Entender algunas operaciones básicas de SQL con bases de datos (agrupar por campos, relación entre tablas)
  + Comprender cómo agrupar los valores intermedios para obtener el índice de Shannon para cada polígono.
  + Entender el concepto de unión de tablas.
+ **Objetivos de aprendizaje ecológico**
  + Aplicar el índice de Shannon para cada polígono (=comunidad)
+ **Nivel de andamiaje**

  + Alto. El profesor lo hace y los estudiantes repiten después.



### Bloque 7: Integración de resultados y exportación a formato SIG (vectorial y raster)

+ **Objetivos de aprendizaje R**

  + Fusionar resultados tabulares (tabla con valores de H para cada comunidad) con datos espaciales (distribución de comunidades) para obtener el mapa final.
  + Convertir entre formatos vectorial y raster.
  + Exportar para visualizar fácilmente en SIG
+ **Objetivos de aprendizaje ecológico**
  + Entender las diferencias entre el mapa de inicial de comunidades y el resultado final que asigna a cada polígono un valor del índice de Shannon.
+ **Nivel de andamiaje**

  + Alto. El profesor lo hace y los estudiantes repiten después.



## Resultados esperables
El siguiente mapa muestra el resultado obtenido en esta práctica. Se trata de un fichero ráster en el que se ha asignado el valor del índice Shannon a cada polígono del mapa de vegetación inicial. El mapa se ha obtenido de la siguiente forma:

+ Cargamos en QGIS la capa raster obtenida al final del flujo de trabajo anterior.
+ Clasificamos en función de los valores numéricos de cada píxel de la siguiente manera:
  + Método de clasificación: Banda sencilla pseudocolor.
  + Rampa de colores: Spectral
  + Modo de clasificación: quantiles



![shannon](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/2024_2025/imagenes/shannon_snev.png)



En el mapa resultante se pueden identificar varios patrones de distribución espacial de la biodiversidad en Sierra Nevada. En teoría estudiamos esto desde un punto de vista conceptual. Ahora toca reflexionar de manera práctica con el mapa delante: 

+ ¿Cómo cambia la diversidad al aumentar la altitud?

+ ¿A qué se puede deber dicho patrón?

+ ¿Crees que se repetiría el mismo patrón en otras montañas de la Tierra?

+ ¿hay algún patrón de cambio de diversidad en dirección este-oeste?

+ En caso afirmativo, ¿a qué puede deberse?

+ Hemos identificado una serie de patrones visualmente. ¿cómo crees que podríamos cuantificarlos y comprobar si realmente existen?






## Conexión de la práctica con el trabajo sobre tipos de ecosistemas

El flujo de trabajo descrito arriba permite obtener un mapa de diversidad de Sierra Nevada asumiendo que cada polígono del mapa de vegetación es una comunidad. Esto nos permitirá estudiar patrones espaciales de cambio de la diversidad a escala de todo el territorio. Pero nuestro objetivo en el contexto del trabajo de prácticas que tenemos que hacer es generar un valor numérico que muestre la diversidad promedio de cada uno de los ecosistemas con los que estamos trabajando. Para eso tendremos que añadir al flujo de trabajo que se describe a continuación los pasos necesarios para hacer lo siguiente:

+ Combinar de alguna manera (con R o con QGIS) el mapa de diversidad obtenido (en formato raster) con el mapa de distribución de los ecosistemas de Sierra Nevada.
+ Calcular el valor promedio de todos los píxeles del mapa de diversidad en cada uno de los ecosistemas de Sierra Nevada. 

Esta es la parte que tendréis que hacer vosotros individualmente. Para ello necesitáis usar [esta](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/refs/tags/2024_2025/geoinfo/ecosistemas_snev_dissolve.zip) capa (*ecosistemas_snev_dissolve.shp*) que muestra la distribución de los ecosistemas de Sierra Nevada. Al mostrarla en QGIS veréis que es una capa vectorial con polígonos. Pero tiene una particularidad. Es una capa en la que todos los polígonos que tienen el mismo tipo de ecosistema se han fusionado en uno solo. Aunque visualmente aparezcan como muchos polígonos, en realidad para el SIG y para la tabla de atributos de la capa, computa como un único polígono. Por eso, cuando abráis la tabla de atributos, veréis solo 12 filas que corresponden con los 12 tipos de ecosistemas que hay en Sierra Nevada según esta capa. 

Tendréis que buscar un método para asignar acada polígono de esta capa el valor promedio de índice de Shannon de todos los píxeles que contiene cada tipo de ecosistema. Por ejemplo, para el polígono marcado en rojo de la imagen inferior, se calculará el valor promedio del índice de Shannon de todos los píxeles que tiene dentro (mostrados en una gama de colores del rojo al verde). Podéis hacer esto en QGIS o en R. Es importante que preguntéis a ChatGPT o a cualquier IA para dar con el método adecuado. Las palabras claves podrían ser: extraer información de un raster a una capa poligonal, asignar estadísticas de un raster a una capa de polígonos, etc.

Y para terminar, una pista muy buena: habéis hecho ya algo parecido con Jorge en la asignatura de SIG. Recordad cuando asignásteis a cada ecosistema su altura...



![zonal](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/2024_2025/imagenes/zonal_statistics.png)







El resultado a obtener en la parte de asignar valores promedios de diversidad a cada tipo de ecosistema es una tabla parecida a esta:



| nombre                                           | Shape_Leng          | Shape_Area             | id_poligon | _mean | _stdev |
| ------------------------------------------------ | ------------------- | ---------------------- | ---------- | ----- | ------ |
| Robledales                                       | 52.892.133.605.783  | 13.169.454.140.145.700 | 1487       | x     | x      |
| Pastos de media montaña                          | 320.664.866.227.179 | 32.480.149.403.061.500 | 461        | x     | x      |
| Sistemas acuáticos                               | 453.913.381.244.217 | 637.886.087.970.162    | 1174       | x     | x      |
| Pastizales, canchales y roquedos de Alta Montaña | 584.048.237.224.741 | 4.128.511.106.604.420  | 1          | x     | x      |
| Encinares                                        | 256.310.502.294.566 | 29.595.384.661.394.400 | 79         | x     | x      |
| Pinares autóctonos sobre dolomías                | 15.731.043.794.798  | 817.195.403.492.786    | 756        | x     | x      |
| Enebrales-piornales                              | 137.637.568.034.509 | 6.368.878.775.305.160  | 766        | x     | x      |
| Cultivos de montaña extensivos                   | 99.446.226.983.354  | 6.026.301.713.036.190  | 951        | x     | x      |
| Pinares de repoblación                           | 149.243.344.304.335 | 6.430.065.174.753.230  | 1244       | x     | x      |
| Pinares autóctonos de P. sylvestris              | 795.679.016.504.942 | 10.146.799.532.010.600 | 1172       | x     | x      |
| Borreguiles                                      | 476.411.929.684.921 | 659.306.197.944.578    | 891        | x     | x      |
| Matorral media montaña                           | 17.686.177.336.196  | 16.753.416.186.208.000 | 208        | x     | x      |



En los campos *_mean* y *_stdev* se almacenarán respectivamente los valores promedio y la desviación estándard de la diversidad para cada tipo de ecosistema. Ahora toca reflexionar sobre los resultados obtenidos:

+ ¿Qué ecositema tiene menos diversidad?, ¿por qué?
+ ¿Cuál es más diverso?, ¿por qué?
+ ¿En qué categoría podríamos poner los bosques de ribera? ¿por qué no aparecen en la lista?
+ También tenéis que pensar una forma de representar la diversidad de vuestro ecosistema en el trabajo de manera que se pueda comparar fácilmente con los demás ecosistemas.







****

[Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/archive/refs/tags/2024_2025.zip) puedes descargar un archivo .zip que contiene este guión en formato html y todo el material que incluye.

****
Haz click [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/releases) para ver cómo ha cambiado este guión en los distintos cursos académicos.

****
 <p xmlns:cc="http://creativecommons.org/ns#" >El contenido de este repositorio se puede utilizar bajo la siguiente licencia:  <a  href="https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1"  target="_blank" rel="license noopener noreferrer"  style="display:inline-block;">CC BY-NC-SA 4.0<img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"  alt=""><img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"  alt=""><img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/nc.svg?ref=chooser-v1"  alt=""><img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1"  alt=""></a></p> 

<p>Esta licencia no aplica a enlaces a artículos, libros o imágenes no originales. Estos productos tienen su licencia correspondiente.</p>