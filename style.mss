/**********************************************************

Open Streets BC
===============

This base map is based on TileMill's included Open Streets,
DC but includes some extra data:

Vancouver Open Data Catalogue
-----------------------------

Two sets of data from: http://data.vancouver.ca/datacatalogue/

#bikeways - <ftp://webftp.vancouver.ca/OpenData/shape/bikeways_shp.zip>
#park_polygons - <ftp://webftp.vancouver.ca/OpenData/shape/park_polygons_shp.zip>

OpenStreetMap
-------------

We need shoreline information:

#shoreline_300 - coarse data - <http://tile.openstreetmap.org/shoreline_300.tar.bz2>
#processed_p - highly detailed data - <http://tile.openstreetmap.org/processed_p.tar.bz2>

Following are the original instructions you may need to get
OpenStreetMap data, you might need:

<http://downloads.cloudmade.com/americas/northern_america/canada/british_columbia/british_columbia.shapefiles.zip>

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
  background-color:darken(@water, 10);
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

/* Add the provinces and countries, based on data from road_trip */
#country_border::glow[zoom>2] {
  line-color:#ddd;
  line-opacity:0.33;
  line-width:4;
}

#country_border { line-color:#fff; }
#country_border[zoom<3] { line-width:0.4; }
#country_border[zoom=3] { line-width:0.6; }
#country_border[zoom=4] { line-width:0.8; }
#country_border[zoom=5] { line-width:1.0; }

#state_line::glow[ADM0_A3='USA'],
#state_line::glow[ADM0_A3='CAN'] {
  [zoom>2] {
    line-color:#fff;
    line-opacity:0.2;
    line-width:3;
  }
}
#state_line[ADM0_A3='USA'],
#state_line[ADM0_A3='CAN'] {
  [zoom>2] {
    line-dasharray:2,2,10,2;
    line-width:0.6;
  }
}
