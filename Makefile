
NORMAL_TILES = $(shell find geomorphs -type f -name 'tile*.svg')
FLIPPED_TILES = $(shell find geomorphs -type f -name 'elit*.svg')
ALL_TILES = ${NORMAL_TILES} ${FLIPPED_TILES}
ALL_SVGS = ${ALL_TILES} geomorphs/legend.svg

OUTPUT_NORMAL_TILES != echo ${NORMAL_TILES} | sed -e 's/geomorphs\//assets\//g'
OUTPUT_FLIPPED_TILES != echo ${FLIPPED_TILES} | sed -e 's/geomorphs\//assets\//g'
ALL_OUTPUT_TILES = ${OUTPUT_NORMAL_TILES} ${OUTPUT_FLIPPED_TILES}
ALL_OUTPUT_SVGS = ${ALL_OUTPUT_TILES} assets/legend.svg

all: output_svg tile_sampler.html

output_svg : all_geomorphs assets/legend.svg

all_geomorphs : ${ALL_OUTPUT_TILES} assets/index.json

clean :
	rm ${ALL_OUTPUT_SVGS}
	rm assets/index.json

assets/index.json : ${ALL_TILES} Makefile
	echo "{ " \
		"\"H\": [`echo ${NORMAL_TILES} | sed -e 's/geomorphs\/\([^ ]\+\)/"assets\/\1",/g ; s/,$$//'`]," \
		"\"T\": [`echo ${NORMAL_TILES} | sed -e 's/geomorphs\/\([^ ]\+\)/"assets\/\1",/g ; s/,$$//'`]," \
		"\"P\": [`echo ${NORMAL_TILES} | sed -e 's/geomorphs\/\([^ ]\+\)/"assets\/\1",/g ; s/,$$//'`]," \
		"\"F\": [`echo ${NORMAL_TILES} | sed -e 's/geomorphs\/\([^ ]\+\)/"assets\/\1",/g ; s/,$$//'`]," \
		"\"H1\": [`echo ${FLIPPED_TILES} | sed -e 's/geomorphs\/\([^ ]\+\)/"assets\/\1",/g ; s/,$$//'`]" \
	"}" > assets/index.json

tile_sampler.html : ${ALL_TILES} assets/legend.svg Makefile
	echo '<html><head><title>Tiles</title></head><body>' > $@
	echo '<div style="float: right"><h2>Legend</h2><img src="assets/legend.svg" /></div>' >> $@
	echo ${OUTPUT_NORMAL_TILES} | sed -e 's/[^ ]\+/<img src="\0"\/>/g' >> $@
	echo ${OUTPUT_FLIPPED_TILES} | sed -e 's/[^ ]\+/<img src="\0" style="transform: rotateY(180deg)"\/>/g' >> $@
	echo '</body></html>' >> $@

assets/%.svg : geomorphs/%.svg
	inkscape -l -o $@ $<
