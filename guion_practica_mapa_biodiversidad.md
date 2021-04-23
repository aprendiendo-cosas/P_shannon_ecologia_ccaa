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
  + Aprendere a generar mapas de diversidad biológica. Mapas de distribución del índice de Shannon.
  + Reconocer patrones de distribución de la diversidad en un territorio concreto (Sierra Nevada).
  + Identificar las causas de los patrones anteriores.
  
+ Instrumentales:

  + Afianzar nuestro conocimiento de SIG.
  + Mejorar nuestro conocimiento de R.
  + Aprender algunos conceptos básicos de las bases de datos relacionales.  
  
   




## Contextualización ecológica

Esta sesión práctica está muy relacionada con el Tema 6 de teoría ([Comunidades. El concepto de diversidad](https://aprendiendo-cosas.github.io/Te_comunidades_diversidad_ecologia_ccaa/guion_comunidades_diversidad.html)). En concreto, usaremos los conocimientos adquiridos en esa sesión para construir un mapa de biodiversidad de Sierra Nevada. 

Para cuantificar la diversidad biológica se pueden utilizar muchos índices. En nuestro caso usaremos el denominado índice de Shannon-Wiever, que es uno de los más robustos y comunmente utilizados. Para su cálculo se necesita la siguiente información:

+ Delimitación espacial de la comunidad para la que queremos calcular el índice de diversidad.
+ Listado de especies existente en esa comunidad.
+ Abundancia de cada especie en dicha comunidad.

La siguiente presentación (que puede verse aquí o descargarse aquí para Windows y aquí para Mac)


<p><iframe src="https://prezi.com/view/ACfMCVaCBbJVoGwMJZaY/embed" width="1200" height="900"> </iframe></p>



## Metodología y flujo de trabajo

Como se puede observar en la presentación anterior, para calcular la diversidad de una comunidad, necesitamos dos fuentes de información:
+ Recopilar información de distribución de especies en la zona de estudio (Sierra Nevada). Es el primer paso fundamental porque necesitamos esta información para calcular el índice de Shannon. Para conseguir datos de presencia de especies en Sierra Nevada usaremos una infraestructura digital denominada [GBIF](https://www.gbif.org/) (Global Biodiversity Information Facility). Se trata de un portal desde el que se tiene acceso a millones de datos de presencia de especies procedentes de colecciones biológicas (herbarios, colecciones animales, etc.) de todo el planeta. Esta iniciativa está promovida y mantenida por multitud de países que han puesto en común toda la información de la que disponen para conocer mejor la distribución de la biodiversidad en la Tierra. Accederemos a este portal y descargaremos toda la información de presencia de especies en Sierra Nevada. Esto nos dará una idea bastante aproximada de cómo se distribuye la diversida en esta zona. En nuestro caso, GBIF aporta una enorme cantidad de registros de presencia de especies en Sierra Nevada. Durante la práctica visitamos el portal de GBIF y simulamos la descarga. Como este proceso puede tardar unas horas, utilizamos datos que fueron descargados anteriormente por el profesor. Dichos datos de presencia de especies tienen el siguiente "aspecto" cuando son visualizados en QGIS. 









+ Distribución de las comunidades ecológicas que conforman Sierra Nevada. Este paso es el más complejo conceptualmente, ya que las comunidades no tienen un límite espacial preciso. Es decir, están conectadas entre sí y no es fácil delimitar donde empieza una y acaba otra. Usaremos un mapa de vegetación para delimitar las comunidades de Sierra Nevada. Asumiremos que cada polígono de dicho mapa es una comunidad ecológica. 












## Vídeos de las sesiones


