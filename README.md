# openmaptiles-styles

Styles for your selfhosted maps using tileserver-gl and Maplibre GL

Styles from [Openmaptiles](https://openmaptiles.org/styles/) and other free sources.

## Usage

* Clone the repository to your styles folder
* Get the mbtiles files
* Update tileserver `config.json` as in [example-tileserver-config.json](example-tileserver-config.json)


## Included Styles

### Maptiler Basic `maptiler-basic`

* Source: https://github.com/openmaptiles/maptiler-basic-gl-style
* License:  [BSD 3-Clause License](https://github.com/openmaptiles/maptiler-basic-gl-style/blob/master/LICENSE.md)

### OSM Bright `osm-bright`

* Source: https://github.com/openmaptiles/osm-bright-gl-style
* License:  [BSD 3-Clause License](https://github.com/openmaptiles/osm-bright-gl-style/blob/master/LICENSE.md)

### Positron

* https://github.com/openmaptiles/positron-gl-style
* [BSD 3-Clause License](https://github.com/openmaptiles/positron-gl-style/blob/master/LICENSE.md

### Dark Matter `dark-matter`

* https://github.com/openmaptiles/dark-matter-gl-style
* [BSD 3-Clause License](https://github.com/openmaptiles/dark-matter-gl-style/blob/master/LICENSE.md)

Customized Variants:

* Dark
* Dark Custom

### MapTiler 3D

TODO

* https://github.com/openmaptiles/maptiler-3d-gl-style
* [BSD 3-Clause License](https://github.com/openmaptiles/maptiler-3d-gl-style/blob/master/LICENSE.md)

### Maptiler Terrain

cannot be fully self hosted without Maptiler License, hillshade tiles are not available for free.

* https://github.com/openmaptiles/maptiler-terrain-gl-style
*

### Fiord Color

* https://github.com/openmaptiles/fiord-color-gl-style
* Based on Positron

### Toner

TODO

* https://github.com/openmaptiles/maptiler-toner-gl-style
* [BSD 3-Clause License](https://github.com/openmaptiles/maptiler-toner-gl-style/blob/master/LICENSE.md)

### OSM Liberty

* https://github.com/maputnik/osm-liberty
* [BSD license](https://github.com/maputnik/osm-liberty/blob/gh-pages/LICENSE.md)

Adapted to include 3D Buildings

Customized variants

* OSM Liberty Dark Custom
* OSM Liberty International
* OSM Liberty Dark Custom International

### Qwant

* https://qwant.github.io/qwant-basic-gl-style/
* [BSD 3-Clause License](https://qwant.github.io/qwant-basic-gl-style/)

## Data Sources for self hosting

### planet mbtiles

generate yourself with planetiler or download

source https://osm.dbtc.link/mbtiles/

### natural earth tiles

https://klokantech.github.io/naturalearthtiles/

https://github.com/lukasmartinelli/naturalearthtiles/releases/download/v1.0/natural_earth_2_shaded_relief.raster.mbtiles

#### natural earth png version mbtiles

package png from sources in mbtiles format

~~~bash
cd /container/tileserver/data
git clone --depth=1 -b gh-pages https://github.com/lukasmartinelli/naturalearthtiles.git
cd naturalearthtiles
docker run -it  -v /container/tileserver/data/naturalearthtiles/:/data/:rw jskeates/mbutil --image_format=png /data/tiles/natural_earth_2_shaded_relief.raster /data/natural_earth_2_shaded_relief.raster.png.mbtiles
~~~

## fonts

* download fonts from https://github.com/openmaptiles/fonts/releases/tag/v2.0
* extract in data/fonts/
