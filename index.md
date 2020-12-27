
Ce cours présente quelques outils **R** pour la **visualisation de données**. Il nécessite des connaissances de base en **R** et en programmation et se structure en 3 parties :

* `Visualisation avec ggplot2` : présentation du package **ggplot2** pour faire des représentations graphiques avec **R** ;
* `Introduction à la cartographie` : construction de cartes avec les packages `ggmap`, `sf` et `leaflet` ;
* `Visualisation interactive` : présentation de packages qui permettent de faire facilement des graphes interactifs, des tableaux de bord ou des applications web (**shiny**).



### Documents de cours

- Version française
    * [slides](pres_visu.pdf)
    * [slides (version imprimable)](pres_visu_article.pdf)
    * [tutoriel](https://lrouviere.github.io/TUTO_VISU/)
    
- Version anglaise
    * [slides](pres_dataviz.pdf)
    * [slides (version imprimable)](pres_dataviz_article.pdf)
    * [tutoriel](https://lrouviere.github.io/TUTO_DATAVIZ/)
    
- Partie Shiny
    * [cours](pres_shiny.pdf)
    * Applications :
        * app_structure : [ui.R](SHINY_APP/app_structure/ui.R), [server.R](SHINY_APP/app_structure/server.R)
        
    * Corrections :
        * input/outputs : [ui.R](SHINY_APP/app_input_output_correction/ui.R), [server.R](SHINY_APP/app_input_output_correction/server.R)
        * structure : [ui.R](SHINY_APP/app_structure_correction/ui.R), [server.R](SHINY_APP/app_structure_correction/server.R)
        * reactive/isolation/observe/html... : [ui.R](SHINY_APP/app_plus_loin/ui.R), [server.R](SHINY_APP/app_plus_loin/server.R), [global.R](SHINY_APP/app_plus_loin/global.R)
      
    


<!---
- [slides au format rapport](pres_R_article1.pdf)
--->



### Jeux de données

- Ggplot
  - [ozone.txt](ozone.txt)
  - [taches_solaires.csv](taches_solaires.csv)
  
- Cartes
  - [dpt.zip](dpt.zip)
  - [postesSynop.csv](postesSynop.csv)
  - [synop.2018011215.csv](synop.2018011215.csv)
  - [tauxchomage.csv](tauxchomage.csv)
  - [villes_fr.csv](villes_fr.csv)
  - [coord_ville_exo1.csv](coord_ville_exo1.csv) (géolocalisation des villes pour l'exercice 1 si besoin)
  - [coord_ville_nc.csv](coord_ville_nc.csv) (géolocalisation des villes pour la partie sf si besoin)
  - [donnees_temp_fr.csv](donnees_temp_fr.csv) (données température pour le challenge si besoin)
  - [station_temp_fr.csv](station_temp_fr.csv) (données station pour le challenge si besoin)
  - [regions-20180101-shp.zip](https://www.data.gouv.fr/fr/datasets/contours-des-regions-francaises-sur-openstreetmap/#_)
  - [sta.Paris.csv](sta.Paris.csv) (données sur les stations velib si besoin)
  
- Visu intéractive
  - [Dataset1-Media-Example-NODES.csv](Dataset1-Media-Example-NODES.csv)
  - [Dataset1-Media-Example-EDGES.csv](Dataset1-Media-Example-EDGES.csv)
  
  
  
