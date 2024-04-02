# Este script genera un mapa del índice de Shannon a partir de los datos de presencias de especies existentes en GBIF y de un mapa de vegetación de Sierra Nevada

# 1. Establece directorio de trabajo
setwd("/Users/fjbonet_trabajo/Library/CloudStorage/OneDrive-UniversidaddeCórdoba/4_docencia/eco_ccaa_uco/actos_docentes/P_shannon_ecologia_ccaa/preparacion/borrar/csv_gbif_sierra_nevada")

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
comunidades<-st_read("vegetacion_snevada_23030.shp")

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
