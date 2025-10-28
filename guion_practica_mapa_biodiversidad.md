# Construcción de un mapa de diversidad (índice de Shannon) de Sierra Nevada

> + **_Tipo de material_**: <span style="display: inline-block; font-size: 12px; color: white; background-color: #4caf50; border-radius: 5px; padding: 5px; font-weight: bold;"> Prácticas</span> 
> + **_Versión_**: 2025-2026
> + **_Asignatura (grado)_**: Ecología (Ciencias ambientales). 
> + **_Autor_**: Curro Bonet-García (fjbonet@uco.es)
> + **_Duración_**: 2 sesiones de 2 horas y otras 2 horas en casa.

![portada](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/main/imagenes/portada.png)

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

La siguiente presentación muestra los conceptos básicos necesarios para hacer la práctica. También puedes verla [aquí](https://prezi.com/view/cUj8WyKbNsFotcpylja0/) y descargarla [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/main/presentacion/1_mapa_biodiv_ecologia_ccaa.exe) para Windows y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/main/presentacion/1_mapa_biodiv_ecologia_ccaa.zip) para Mac. Y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/main/presentacion/1_mapa_biodiv_ecologia_ccaa.pdf) la tienes en formato pdf. En esta presentación se describe de manera muy general cómo se realizará el mapa de biodiversidad. Se trata de la primera explicación de este tipo que realizamos durante la clase. 

<iframe src="https://prezi.com/p/embed/cUj8WyKbNsFotcpylja0/" id="iframe_container" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" allow="autoplay; fullscreen" height="515" width="560"></iframe>

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

A continuación se muestra lo que se dibujó en la pizarra. Hay varias versiones:

*Versión más pausada hecha el día de antes de la práctica en la pizarra de mi despacho...*

![pizarra](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/main/imagenes/esquemas_pizarra/pizarra_despacho.jpg)

*Versión algo más cutre hecha en la pizarra digital de la clase en la sesión del GM-2*

![Diapo1](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/main/imagenes/esquemas_pizarra/Diapositiva1.jpeg)

![Diapo2](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/main/imagenes/esquemas_pizarra/Diapositiva2.jpeg)

![Diapo3](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/main/imagenes/esquemas_pizarra/Diapositiva3.jpeg)

![Diapo4](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/main/imagenes/esquemas_pizarra/Diapositiva4.jpeg)

A continuación se describen con más detalle las fuentes de datos que utilizaremos en esta práctica. También se ofrecen los enlaces para descargar los datos.

### Información de distribución de especies en Sierra Nevada a partir de GBIF
Es el primer paso fundamental porque necesitamos esta información para calcular el índice de Shannon. Para conseguir datos de presencia de especies en Sierra Nevada usaremos una infraestructura digital denominada [GBIF](https://www.gbif.org/) (Global Biodiversity Information Facility). Se trata de un portal desde el que se tiene acceso a millones de datos de presencia de especies procedentes de colecciones biológicas (herbarios, colecciones animales, etc.) de todo el planeta. Esta iniciativa está promovida y mantenida por multitud de países que han puesto en común toda la información de la que disponen para conocer mejor la distribución de la biodiversidad en la Tierra. Accederemos a este portal y descargaremos toda la información de presencia de especies en Sierra Nevada. Esto nos dará una idea bastante aproximada de cómo se distribuye la diversida en esta zona. En nuestro caso, GBIF aporta una enorme cantidad de registros de presencia de especies en Sierra Nevada. Durante la práctica visitamos el portal de GBIF y simulamos la descarga. Como este proceso puede tardar unas horas, utilizamos datos que fueron descargados anteriormente por el profesor. Dichos datos de presencia de especies tienen el siguiente "aspecto" cuando son visualizados en QGIS. [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/main/geoinfo/csv_gbif_sierra_nevada.zip) puedes descargar la capa con los datos de presencia de especies de Sierra Nevada en el mismo formato en el que se obtienen de GBIF. Usaremos este archivo para generar el mapa de biodiversidad de Sierra Nevada.

![puntos](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/2024_2025/imagenes/puntos.png)


### Distribución de las comunidades ecológicas que conforman Sierra Nevada.
Este paso es el más complejo conceptualmente, ya que las comunidades no tienen un límite espacial preciso. Es decir, están conectadas entre sí y no es fácil delimitar donde empieza una y acaba otra. Usaremos un mapa de vegetación para delimitar las comunidades de Sierra Nevada. Asumiremos que cada polígono de dicho mapa es una comunidad ecológica. Es una asunción importante, pero es la mejor que podemos hacer con la información disponible. [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/main/geoinfo/vegetacion_snevada_23030.zip) puedes descargar el mapa de comunidades que usaremos en esta práctica. El enlace anterior contiene un fichero de formas (Shapefile) con la delimitación de los polígonos del mapa de vegetación a escala 1:10.000. La siguiente figura muestra la delimitación de estas comunidades en Sierra Nevada. Aunque el mapa no tiene escala, podrás reconocer el contorno del espacio protegido de Sierra Nevada. El mapa de vegetación que usamos procede de un mapa de vegetación de Andalucía generado por la REDIAM (Red de Información Ambiental de Andalucía), que es un organismo dependiente del gobierno regional y que se encarga de generar y publicar información ambiental de todo tipo.

![comunidades](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/2024_2025/imagenes/comunidades.png)



A partir de estas dos fuentes de datos obtendremos el índice de Shannon para cada una de las comunidades de Sierra Nevada. Es decir, usaremos los datos de presencia de cada especie que hay en cada una de las comunidades para calcular su índice de Shannon. En la siguiente figura puedes ver la distribución de ocurrencias de especies en unas cuantas comunidades.

![puntos_comunidades](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/2024_2025/imagenes/puntos_sobre_comunidades.png)



## *Tercer nivel de complejidad*: traducción del flujo de trabajo a un programa de R

En los siguientes bloques se muestra paso a paso cómo generar el mapa de diversidad de Sierra Nevada. Podrás ver el código de R que se usa en cada bloque. Y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/raw/main/geoinfo/shannon_sierra_nevada.R.zip) puedes descargar el programa de R completo.



### Bloque 1: Preparación del entorno de trabajo en R

#### Características del bloque
+ **Objetivos de aprendizaje R**
  + Configuración del directorio de trabajo.
  
  + Instalación y carga de los paquetes necesarios.
  
+ **Objetivos de aprendizaje ecológico**

+ **Nivel de andamiaje**

  + Alto. El profesor lo hace y los estudiantes repiten después.
  

#### Procedimiento en R


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



---

### Bloque 2: Importación y transformación de datos de presencia de especies

#### Características del bloque
+ **Objetivos de aprendizaje R**

  + Importar datos tabulares con una componente espacial.
  + Inspeccionar la estructura de datos.

+ **Objetivos de aprendizaje ecológico**
  + Comprender qué es GBIF y qué tipo de datos contiene.
  + Entender las limitaciones de los datos de GBIF.
  + Identificar los campos relevantes para nuestro estudio.
  + Evaluar la cantidad de datos de presencia.
+ **Nivel de andamiaje**
  + Medio-alto. El profesor lo hace casi todo y los estudiantes repiten después. Solo hay un paso en el que los estudiantes deben de recordar lo visto en la práctica anterior.

#### Procedimiento en R

+ **2.1.** Primero usamos la función `read.csv` para cargar en R el archivo llamado `0118822-200613084148143.csv` que ya debes haber descargado en la sección anterior. Como es una función que ya hemos usado, trata de aplicarla tú en función de la experiencia previa. Para saber si el archivo `csv` tiene encabezado, cuáles son los delimitadores de campos y de decimales, solo tienes que abrirlo con un editor de texto. El objeto de R que deberá almacenar los datos de presencia se llama `presencias`. 

<details>
<summary>Haz click aquí para mostrar el código a continuación. Usa esta opción si no lo consigues por ti mismo/a</summary>

```r
presencias <- read.csv("0118822-200613084148143.csv", header = TRUE, sep = ",", dec = ".")
```
</details>

+ **2.2.** Para comprobar que hemos importado bien los datos, observamos la estructura y contenidos de la tabla `presencias`.

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

+ **2.3.** A partir de la información anterior,
  + ¿Qué columnas nos indican la especie del punto de presencia en cuestión?
  + ¿Cuáles contienen información sobre la ubicación geográfica del punto? 

+ **2.4** Las respuestas a las preguntas anteriores nos permiten saber cuántas especies diferentes hay en la tabla:

```R
# Ver las primeras 6 filas para entender la estructura
# la función head() muestra las primeras filas de un data frame
head(presencias)

# ¿Cuántas especies diferentes aparecen?
# la función length() cuenta el número de elementos en un vector (que puede ser una tabla o una columna)
# la función unique() devuelve los valores únicos de un vector. En este caso de la columna scientificName
length(unique(presencias$scientificName))

```

+ **2.5** A continuación te propongo una actividad voluntaria que no es necesaria para el objetivo final de la práctica. La idea es que crees una gráfica de barras que muestre la información de abundancia de cada especie como lo hacen las gráficas de "rango abundancia" que vimos en teoría. Es decir, un gráfico parecido al que se muestra a continuación. Busca información en internet o pregunta a tu IA favorita. Recuerda que partes de la tabla `presencias`. Para generar la gráfica tienes que dar los siguientes pasos:

  + Generar una tabla que cuente la abundancia de cada especie. Llama a esa tabla `abundancias`. Para obtenerla puedes usar una función llamada `table `que cuenta las ocurrencias de cada valor de una tabla.
  + Luego ordena esa tabla de mayor a menor. Crea una tabla llamada `abundancias_ordenadas` usando la función `sort`.
  + Finalmente, usa la función `barplot` para generar el gráfico.

  Podrás ver el código más abajo. No lo uses directamente hasta que hayas pasado al menos 5' intentándolo tú misma/o. Este paso no es necesario para generar el mapa de diversidad, pero haciéndolo mejoramos nuestro conocimiento de R.

![equitatividad](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/refs/heads/main/imagenes/equitatividad.png)

<details>
<summary>Haz click aquí para mostrar el código a continuación. Usa esta opción si no lo consigues por ti mismo/a</summary>

```r
# Generar histograma de abundancias de especies ordenadas de mayor a menor abundancia en el eje x

# la función table() cuenta las ocurrencias de cada valor en un tabla. Es decir, cuenta cuántos valores diferentes hay en el campo `scientificName` de `presencias
abundancias <- table(presencias$scientificName)

# ordenar las abundancias de mayor a menor usando la función sort()
abundancias_ordenadas <- sort(abundancias, decreasing = TRUE)

# Genera una gráfica de barras mostrando las abundancias de especies ordenadas de mayor a menor abundancia en el eje x.
barplot(abundancias_ordenadas,
        las = 2,               # Rota los nombres de las especies para que se vean mejor
        col = "lightblue",     # Color de las barras
        main = "Abundancia de especies registradas", # Título del gráfico
        ylab = "Número de registros",                # Etiqueta del eje y
        xlab = "Especies")                           # Etiqueta del eje x

```
</details>

Una vez que obtengas el gráfico, nos preguntamos: ¿dirías que Sierra Nevada en general es muy equitativa o poco? ¿ves razonable los resultados obtenidos en la gráfica?

+ **2.6.** Si no te has animado a generar el gráfico, sigue por aquí.
+ **2.7.** La tabla que hemos importado de GBIF tiene dos campos con coordenadas. Pero R no ha reconocido este objeto como una capa georreferenciada de manera automática. Tenemos que decirle explícitamente que el objeto importado es una capa geográfica. Eso se hace aplicando la función `st_as_sf` que convierte una tabla común (data frame) en un objeto espacial de R. El código es el siguiente. En el código solo tienes que reemplazar los guiones por los nombres de los campos que muestran las coordenadas X e Y en la tabla de `presencias`. El otro argumento de la función es `crs`. Ahí ponemos el código del sistema de coordenadas en el que están los datos de `presencias`: 23030. El objeto resultante se llama `presencias_23030` tiene el mismo número de filas y columnas que `presencias`. La única diferencia es que es un objeto espacial.

```R
# Convertir las coordenadas UTM en un objeto espacial usando la función st_as_sf
# En el código de abajo solo tienes que incluir los nombres de los campos de la capa "presencias" que muestran las coordenadas de cada punto en UTM
presencia_23030 <- st_as_sf(presencias, coords = c("----", "----"),crs = 23030)
```

+ **2.8.** Como tal objeto espacial, podemos representarlo gráficamente. Para dibujar un mapa sencillo que nos de una idea del aspecto de nuestros datos, podemos usar las funciones `plot` y `st_geometry`. Este último argumento indica a R que use la geometría del objeto para hacer la visualización. Tienes el código a continuación

```R
# Hacer un mapa sencillo para ver si tiene sentido geográficamente
plot(st_geometry(presencia_23030), 
     pch = 20,                  # Tipo de símbolo (puntos pequeños)
     cex = 0.1,                 # Tamaño de puntos
     col = "darkgreen",         # Color
     main = "Presencias de especies en Sierra Nevada")
```






---


### Bloque 3: Importación de la capa de comunidades ecológicas.

#### Características del bloque
+ **Objetivos de aprendizaje R**
  + Importar datos geográficos vectoriales (shapefile)
  + Inspeccionar la estructura de datos.
  + Recordar el concepto de sistema de referencia espacial
  + Conocer los formatos de R para almacenar información geográfica.
+ **Objetivos de aprendizaje ecológico**
  + Entender la estructura de datos del mapa de vegetación.
  + Entender las asunciones que hacemos al considerar que los polígonos del mapa de vegetación son comunidades ecológicas.
+ **Nivel de andamiaje**
  + Medio. Intentamos hacer este bloque juntos en clase. El código está presente en el guión pero oculto. Se abre solo cuando le das a una opción.

#### Procedimiento en R

+ **3.1.** Pistas
  + Queremos importar a R la capa llamada `vegetación_snevada_23030.shp`
  + Para ello necesitamos usar una función del paquete `sf` que ya hemos cargado en memoria.
  + La función que necesitamos es similar a `read_csv()` pero para capas geográficas.
  + Puedes buscar en google o preguntar a tu IA favorita...
<details>
<summary>Intenta generar el código por tus medios. Si después de 5' no lo has conseguido haz click aquí</summary>

```r
comunidades<-st_read("vegetacion_snevada_23030.shp")
```
</details>

---

### Bloque 4: Unión espacial y preparación de datos para el cálculo de la diversidad

#### Características del bloque
+ **Objetivos de aprendizaje R**

  + Realizar una unión espacial (spatial join) entre puntos y polígonos (asignar a cada punto el polígono en el que se encuentra)

  + Filtrar atributos relevantes

+ **Objetivos de aprendizaje ecológico**
  + Entender que los datos con los que trabajamos son incompletos.
  + Comprender las implicaciones que tiene la unión espacial que vamos a hacer.

+ **Nivel de andamiaje**

  + Alto. El profesor lo hace y los estudiantes repiten después.

#### Procedimiento en R

+ **4.1.** La unión espacial implica asignar a cada punto de la capa `presencias_23030` el código del polígono de la capa `comunidades` en el que se encuentra. Para ello usamos la función `join` que además de los atributos de las dos capas, permite borrar aquellos puntos que no caen sobre ningún polígono. Para ello usamos el argumento `left = FALSE`. 

```R
# Hacemos unión espacial. Asigna a cada punto el código de la comunidad en la que se encuentra.

presencias_x_comunidades <- st_join(
  presencias_23030,  # Puntos (presencias_23030)
  comunidades,           # Polígonos (comunidades_23030)
  left = FALSE           # Eliminar puntos que no caen en ningún polígono
)
```

+ **4.2.** Una vez hecha la unión, comprueba cuántas filas tiene la capa `presencias_23030` y cuántas el resultado de la unión espacial (`presencias_x_comunidades`). ¿Por que han desaparecido tantos puntos?
+ **4.3**. El siguiente paso consiste en preparar la capa de `presencias_x_comunidades` para hacer los calculos del índice de Shannon. Esto implica crear una tabla que contenga solo los datos alfanuméricos (campos con valores numéricos). Necesitamos hacer esto porque el paquete con el que haremos los cálculos (`sqldf`) no es capaz de operar con capas geográficas. Procedemos así

```R
# Convertimos el objeto espacial sf a una tabla "normal"(dataframe)
bio <- as.data.frame(presencias_x_comunidades)
```

+ **4.4.** Ahora vamos a simplificar un poco la tabla. Tenemos muchos campos y en realidad solo nos interesan dos: `OBJECTID` y `scientificName`. Para quitar el resto de campos, creamos un clon del objeto creado anteriormente (`bio`) pero que contenga solo esos campos. Para eso usamos la función `c` de R. En realidad no es una función, es una forma de seleccionar campos en una tabla. El código es así:

```R
# Quedarnos SOLO con las dos columnas que necesitamos:
# - OBJECTID: identifica el polígono (comunidad)
# - scientificName: identifica la especie
bio <- bio[c('OBJECTID', 'scientificName')]
```


---


### Bloque 5: Cálculo de abundancias relativas de especies por comunidad

#### Características del bloque
+ **Objetivos de aprendizaje R**

  + Entender algunas operaciones básicas de SQL con bases de datos (agrupar por campos, relación entre tablas)
+ **Objetivos de aprendizaje ecológico**
  + Comprender bien qué la diversidad depende del número de especies y de la abundancia relativa de cada especie.
  + Calcular la abundancia y la frecuencia relativa.
+ **Nivel de andamiaje**

  + Alto. El profesor lo hace y los estudiantes repiten después. Este bloque es un poco trabalenguas. Por eso lo hacemos con un nivel de andamiaje alto. Para que a nadie se le trabe la lengua :)

#### Procedimiento en R

+ **5.1**. Primero contaremos cuántos individuos hay de cada especie en cada comunidad. Esto se hace usando una consulta SQL (Standarized Query Leanguage). Es un lenguaje muy parecido al humano, así que te resultará fácil de entender. Este lenguaje usa las siguientes funciones:
  + `SELECT`: Nos permite elegir las columnas que queremos en la tabla resultado. En este primer caso, necesito estas columnas:
    + `OBJECTID`: Código de la comunidad.
    + `scientificName`: Nombre científico de la especie contabilizada.
    + `num_ind_sp_com`: Es un campo nuevo que creamos en la consulta. Representa el número de individuos por especie y por comunidad. Este campo ha de crearse haciendo alguna operación matemática con algún campo de la tabla. En nuestro caso, como queremos contar cuántas especies diferentes hay, usamos el argumento `count(scientificName)`.
  + `FROM`: Nos permite indicar a qué tabla vamos a referirnos para hacer los cálculos. En nuestro caso la tabla es `bio`. 
  + `GROUP BY`:  Esta función nos permite elegir los campos en función de los cuales se realizará la agrupación. En nuestro caso se hará a través de los campos `OBJECTID` y `scientificName` puesto que queremos agrupar por comunidad y por especie. 

​	El código sería algo así:

```R
# Contar el número de individuos por especie en cada comunidad (numerador de la abundancia relativa)
T_num_ind_sp_com <- sqldf("
  SELECT 
    OBJECTID,                          -- ID del polígono (comunidad)
    scientificName,                    -- Nombre de la especie
    count(scientificName) AS num_ind_sp_com  -- Contar individuos
  FROM bio 
  GROUP BY OBJECTID, scientificName    -- Agrupar por comunidad y especie
")
```

+ **5.2.** Ahora comprobamos la estructura de la tabla. Visualizamos sus 10 primeros registros con el siguiente código.

```R
# Visualizamos los 10 primeros registros de la tabla creada
head(T_num_ind_sp_com, 10)
```

+ **5.3.** El siguiente paso consiste en generar el valor del denominador que usaremos para calcular la abundancia relativa. Es decir, el número total de individuos que hay en en cada comunidad. Para ello repetimos una función `SELECT` parecida a la anterior, pero usando distintos campos y agrupando únicamente por el identificador de la comunidad `OBJECTID`. El resultado del cálculo se almacena en una tabla llamada `T_num_ind_com`. El código es el siguiente

```R
# Sumamos el número total de individuos que hay en cada comunidad (Denominador de la abundancia relativa)
T_num_ind_com <- sqldf("
  SELECT 
    OBJECTID, 
    sum(num_ind_sp_com) AS num_ind_com   -- Sumar todos los individuos
  FROM T_num_ind_sp_com 
  GROUP BY OBJECTID                      -- Agrupar solo por comunidad
")

```

+ **5.4.** Al igual que antes, visualizamos los 10 primeros registros de la tabla creada:

```R
# Visualizamos los 10 primeros registros de la tabla creada
head(T_num_ind_com, 10)
```

+ **5.5.** Ahora toca unir las dos tablas anteriores a través de un campo común: `OBJECTID`. De esta forma asignaremos a cada especie por comunidad el número de individuos totales de dicha comunidad. Para hacer esto, usamos una función de SQL llamada `LEFT JOIN`, que permite unir dos tablas que tienen un campo común. El resultado se almacena en una tabla llamada `T_num_ind_sp_com_mas_num_ind_com`: Tabla con el número de invididuos por especie y comunidad más el número de individuos por comunidad:

```R
# Unimos las tablas T_num_ind_com (denominador) y T_num_ind_sp_com (numerador)
T_num_ind_sp_com_mas_num_ind_com <- sqldf("
  SELECT 
    OBJECTID, 
    scientificName, 
    num_ind_sp_com,           -- De la tabla T_num_ind_sp_com
    num_ind_com               -- De la tabla T_num_ind_com
  FROM T_num_ind_sp_com 
  LEFT JOIN T_num_ind_com USING(OBJECTID)  -- Unir por OBJECTID
")
```

+ **5.6** Ahora verificamos el resultado. Ya debemos saber qué función utilizar. Así, que, adelante ;)

<details>
<summary>Haz click aquí para mostrar el código a continuación. Usa esta opción si no lo consigues por ti mismo/a</summary>

```r
head(T_num_ind_sp_com_mas_num_ind_com, 10)
```
</details>

+ **5.7** Los siguientes puntos consisten en calcular la abundancia relativa y el logaritmo en base dos de la misma. En esta ocasión usaremos una aproximación distinta en R. No usaremos instrucciones SQL, sino sintaxis propia del núcleo de R. Con el símbolo `$` creamos un campo nuevo dentro de la tabla `T_num_ind_sp_com_mas_num_ind_com` . Ese campo se llamará `pi`. Resulta de dividir el numerador entre el denominador calculados anteriormente. Así:

```R
# Calculamos la abundancia relativa de cada especie sin usar el paquete sqldf
T_num_ind_sp_com_mas_num_ind_com$pi <- 
  T_num_ind_sp_com_mas_num_ind_com$num_ind_sp_com / 
  T_num_ind_sp_com_mas_num_ind_com$num_ind_com

# Comprobamos que el resultado tiene sentido
head(T_num_ind_sp_com_mas_num_ind_com, 10)
```

+ **5.8.** Ahora calculamos el logaritmo en base 2 de la abundancia relativa. La función de R que hace esto se llama `log2`. Trata de crear tú el código usando la misma sintáxis de antes. El nuevo campo a crear en la tabla `T_num_ind_sp_com_mas_num_ind_com` se llamará `log2pi`. 

<details>
<summary>Haz click aquí para mostrar el código a continuación. Usa esta opción si no lo consigues por ti mismo/a</summary>


```r
# Calculamos el logaritmo en base 2 de la abundancia relativa
T_num_ind_sp_com_mas_num_ind_com$log2pi <- 
  log2(T_num_ind_sp_com_mas_num_ind_com$pi)
```

</details>

+ **5.9**. Por último en este bloque, obtenemos un campo nuevo llamado `pi_log2pi` que resulta de multiplicar los campos `pi` y `log2pi`.

<details>
<summary>Haz click aquí para mostrar el código a continuación. Usa esta opción si no lo consigues por ti mismo/a</summary>


```r
# Calculamos el término Pi * log2(Pi)
T_num_ind_sp_com_mas_num_ind_com$pi_log2pi <- 
  T_num_ind_sp_com_mas_num_ind_com$pi * 
  T_num_ind_sp_com_mas_num_ind_com$log2pi
```

</details>

---



### Bloque 6: Cálculo del índice de Shannon por comunidad

#### Características del bloque
+ **Objetivos de aprendizaje R**

  + Entender algunas operaciones básicas de SQL con bases de datos (agrupar por campos, relación entre tablas)
  + Comprender cómo agrupar los valores intermedios para obtener el índice de Shannon para cada polígono.
  + Entender el concepto de unión de tablas.
+ **Objetivos de aprendizaje ecológico**
  + Aplicar el índice de Shannon para cada polígono (=comunidad)
+ **Nivel de andamiaje**
  + Bajo. Los estudiantes ponen en práctica lo aprendido y realizan el proceso por sí mismos.



#### Procedimiento en R

+ **6.1** Este bloque tiene un único paso que consiste hacer el sumatorio de la expresión del índice de Shannon. Tenemos que sumar los valores del campo `pi_log2pi` de la tabla `T_num_ind_sp_com_mas_num_ind_com` agrupando por comunidad (campo `OBJECTID`). El resultado se almacena en un campo nuevo llamado `H` que está también en una tabla nueva llamada `T_Shannon`. ¿Te animas a intentarlo tú solo/a?. El punto **5.3** del bloque anterior te da muchas pistas sobre cómo proceder.
<details>
<summary>Haz click aquí para mostrar el código a continuación. Usa esta opción si no lo consigues por ti mismo/a</summary>

```r
# Calculamos el índice de Shannon H por comunidad sumando los términos Pi * log2(Pi) y multiplicando por -1
T_Shannon <- sqldf("
  SELECT 
    OBJECTID, 
    sum(pi_log2pi) * -1 AS H   -- Índice de Shannon
  FROM T_num_ind_sp_com_mas_num_ind_com
  GROUP BY OBJECTID              -- Agrupar por comunidad
")

```
</details>

+ **6.2.** Verificamos que la tabla creada existe y tiene sentido.

```R
#Verificamos la existencia y contenido de la tabla creada
head(T_Shannon)
```



---

### Bloque 7: Integración de resultados numéricos con el mapa de comunidades y exportación a formato SIG (vectorial y raster)

#### Características del bloque
+ **Objetivos de aprendizaje R**
  + Fusionar resultados tabulares (tabla con valores de H para cada comunidad) con datos espaciales (distribución de comunidades) para obtener el mapa final.
  + Convertir entre formatos vectorial y raster.
  + Exportar para visualizar fácilmente en SIG
+ **Objetivos de aprendizaje ecológico**
  + Entender las diferencias entre el mapa de inicial de comunidades y el resultado final que asigna a cada polígono un valor del índice de Shannon.
+ **Nivel de andamiaje**

  + Alto. El profesor lo hace y los estudiantes repiten después.

#### Procedimiento en R

+ **7.1** Ya tenemos una tabla con el índice de Shannon para cada comunidad. Ahora, como queremos obtener un mapa, debemos unir dicha tabla a la capa vectorial que muestra la distribución de las comunidades. Para ello usamos la función `merge` de R. Dicha función requiere que indiquemos:

  + `x`: Capa espacial. En nuestro caso es `comunidades`.
  + `y`: Tabla los valores que se unirán a la espacial. En nuestro caso es `T_Shannon`.
  + `by.x`: Indica el campo de unión en la tabla de `comunidades`. Es el campo ` OBJECTID`
  + `by.y`: Indica el campo de unión en la tabla `T_Shannon`. El campo es, también, ` OBJECTID`.

  La sintaxis es así:

  ```R
  # Unimos la tabla T_Shannon con la capa vectorial de comunidades
  comunidades <- merge(
    x = comunidades,           # Capa espacial (polígonos)
    y = T_Shannon,             # Tabla con índice H
    by.x = "OBJECTID",         # Campo de unión en comunidades
    by.y = "OBJECTID"          # Campo de unión en T_Shannon
  )
  ```

+ **7.2.** Para comprobar que todo ha ido bien, podemos pedirle a R que nos muestre el contenido de la tabla. O al menos sus 10 primeros registros. ¿Recuerdas cómo se hace?

<details>
<summary>Haz click aquí para mostrar el código a continuación. Usa esta opción si no lo consigues por ti mismo/a</summary>

```r
# Mostramos los 10 primeros registros de la tabla de atributos de comunidades para verificar que el índice H se ha añadido correctamente
head(comunidades, 10)
```
</details>


+ **7.3** El penúltimo paso del bloque y de la práctica consiste en generar un fichero de formas (shapefile) llamado `Shannon_sierra_nevada` a partir de la capa `comunidades`que tenemos en R. Ya tienes manejo suficiente como para hacerlo por ti mismo/a. 

<details>
<summary>Haz click aquí para mostrar el código a continuación. Usa esta opción si no lo consigues por ti mismo/a</summary>

```r
# Exportamos la capa de comunidades con el índice de Shannon a un archivo shapefile para visualizar en QGIS
st_write(comunidades, "Shannon_sierra_nevada.shp", append=FALSE)
```
</details>

+ **7.4** También podemos exportar la capa a formato Raster. Esto nos resultará útil cuando queramos conocer el valor promedio de diversidad de cada tipo de ecosistema. Podríamos hacer este paso en QGIS, pero ya que somos unos expertos en R, vamos a intentarlo. Os doy alguna pista:

  + Para rasterizar una capa en R primero hay que crear un raster vacío que llamaremos `plantilla_raster`. Para eso usamos la función `rast`. Diremos que dicha plantilla tiene 100 m de resolución y el mismo sistema de coordenadas que `comunidades`.
  + Luego, usaremos la función `rasterize` para convertir la capa vectorial `comunidades` en un raster en formato R. Llamaremos `Shannon_raster` a esta capa.
  + El último paso consiste en exportar ese objeto a un archivo con extensión `tif`. Eso lo haremos con la función `writeRaster`. 

  ¿Te animas a intentarlo tú?

<details>
<summary>Haz click aquí para mostrar el código a continuación. Usa esta opción si no lo consigues por ti mismo/a</summary>

```r
# Exportamos a formato raster con resolución de 100 metros
# Primero, creamos una plantilla raster con la extensión y resolución deseada
plantilla_raster <- rast(comunidades, 
  resolution = 100, 
  crs = st_crs(comunidades)$proj4string) 

# Creamos un archivo Tiff para el índice de Shannon
shannon_raster <- rasterize(
  comunidades,               # Capa vectorial con el índice H
  plantilla_raster,         # Plantilla raster
  field = "H"               # Campo que contiene el índice de Shannon
)
# Guardamos el raster en un archivo GeoTIFF
writeRaster(shannon_raster, "Shannon_sierra_nevada.tif", overwrite=TRUE)
```
</details>


+ **7.5** Ya solo queda abrir el shapefile creado con QGIS, dale colores en virtud del campo `H` y observar los patrones espaciales existentes: 
  + Cargamos en QGIS la capa raster obtenida al final del flujo de trabajo anterior.
  + Clasificamos en función de los valores numéricos de cada píxel de la siguiente manera:
    + Método de clasificación: Banda sencilla pseudocolor.
    + Rampa de colores: Spectral
    + Modo de clasificación: quantiles



## Resultados esperables

El siguiente mapa muestra el resultado obtenido en esta práctica. Se trata de una representación del fichero vectorial obtenido. En esta representación se ha asignado el valor del índice Shannon a cada polígono del mapa de vegetación inicial. El mapa se ha obtenido de la siguiente forma:




![shannon](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/main/imagenes/shannon_snev.png)



En el mapa resultante se pueden identificar varios patrones de distribución espacial de la biodiversidad en Sierra Nevada. En teoría estudiamos esto desde un punto de vista conceptual. Ahora toca reflexionar de manera práctica con el mapa delante: 

+ ¿Cómo cambia la diversidad al aumentar la altitud?

+ ¿A qué se puede deber dicho patrón?

+ ¿Crees que se repetiría el mismo patrón en otras montañas de la Tierra?

+ ¿hay algún patrón de cambio de diversidad en dirección este-oeste?

+ En caso afirmativo, ¿a qué puede deberse?

+ Hemos identificado una serie de patrones visualmente. ¿cómo crees que podríamos cuantificarlos y comprobar si realmente existen?






## Conexión de la práctica con el trabajo sobre tipos de ecosistemas

El flujo de trabajo descrito arriba permite obtener un mapa de diversidad de Sierra Nevada asumiendo que cada polígono del mapa de vegetación es una comunidad. Esto nos permitirá estudiar patrones espaciales de cambio de la diversidad a escala de todo el territorio. Pero para nuestro trabajo tenemos dos objetivos:

### Creación de una tabla con los valores promedio de H en cada tipo de ecosistema

Para hacer esto tendremos que añadir al flujo de trabajo los siguientes pasos:

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



### Mapa de diversidad de tu ecosistema

Además de este resultado numérico para cada ecosistema, también será interesante que creéis un mapa de diversidad de todas las comunidades ocupadas por vuestro ecosistema. Esto os permitirá saber si, por ejemplo, los encinares del sur son más o menos diversos que los del norte. Para hacer esto bastará con que recortéis en Qgis la capa que hemos obtenido en esta práctica en formato vectorial usando como molde la delimitación de vuestro ecosistema que está contenido en la capa de ecosistemas descargada anteriormente. Es decir, tendréis que hacer una operación `clip` en la que la capa destino es la que contiene la información del índice de Shannon y la que hace de "molde" es el mapa de ecosistemas. Puedes hacer esto en QGIS con la función de recortar un raster con un fichero vectorial. 

El siguiente mapa muestra algo con el aspecto de lo que deberías obtener.



![diversidad_encinar](https://raw.githubusercontent.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/main/imagenes/diversidad_encinares.png)





****

[Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/archive/refs/tags/2024_2025.zip) puedes descargar un archivo .zip que contiene este guión en formato html y todo el material que incluye.

****
Haz click [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ccaa/releases) para ver cómo ha cambiado este guión en los distintos cursos académicos.

****
 <p xmlns:cc="http://creativecommons.org/ns#" >El contenido de este repositorio se puede utilizar bajo la siguiente licencia:  <a  href="https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1"  target="_blank" rel="license noopener noreferrer"  style="display:inline-block;">CC BY-NC-SA 4.0<img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"  alt=""><img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"  alt=""><img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/nc.svg?ref=chooser-v1"  alt=""><img  style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"   src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1"  alt=""></a></p> 

<p>Esta licencia no aplica a enlaces a artículos, libros o imágenes no originales. Estos productos tienen su licencia correspondiente.</p>