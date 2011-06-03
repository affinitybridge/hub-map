/**********************************************************

Open Streets, DC
================

*An example of street-level map design.*

Data used by this map is © OpenStreetMap contributors, 
CC-BY-SA. See <http://openstreetmap.org> for more info.

This map makes use of OpenStreetMap shapefile extracts
provided by CloudMade at <http://downloads.cloudmade.com>.
You can swap out the DC data with any other shapefiles 
provided by CloudMade to get a map of your area.

To prepare a CloudMade shapefiles zip package for TileMill,
download it and run the following commands:

    unzip your_area.shapefiles.zip
    cd your_area.shapefiles
    shapeindex *.shp
    for i in *.shp; do \
        zip `basename $i .shp` `basename $i shp`*; done

***********************************************************/

/* PALETTE */
@water:#D6E5F5;
@forest:#D6E7B0;
@land:#D9D9D9;

Map {
  background-color:#B2B2B2;
}

.natural[TYPE='water'],
.water {
  polygon-fill:@water;
}

.natural[TYPE='forest'],
#park_polygons {
  polygon-fill:@forest;
}

/* These are not used, but if customizing this style you may
wish to use OSM's land shapefiles. See the wiki for info:
<http://wiki.openstreetmap.org/wiki/Mapnik#World_boundaries> */
#shoreline_300[zoom<7],
#processed_p[zoom>=7] {
  polygon-fill: @land;
}

#oil_sands {
  polygon-fill: #555555;
}