
NORMAL_TILES = $(shell find geomorphs -type f -name 'tile*.svg')
FLIPPED_TILES = $(shell find geomorphs -type f -name 'elit*.svg')
ALL_TILES = ${NORMAL_TILES} ${FLIPPED_TILES}
ALL_SVGS = ${ALL_TILES} geomorphs/legend.svg

OUTPUT_NORMAL_TILES != echo ${NORMAL_TILES} | sed -e 's/geomorphs\//assets\//g'
OUTPUT_FLIPPED_TILES != echo ${FLIPPED_TILES} | sed -e 's/geomorphs\//assets\//g'
ALL_OUTPUT_TILES = ${OUTPUT_NORMAL_TILES} ${OUTPUT_FLIPPED_TILES}
ALL_OUTPUT_SVGS = ${ALL_OUTPUT_TILES} assets/legend.svg

output_svg : all_geomorphs assets/legend.svg

all_geomorphs : ${ALL_OUTPUT_TILES} assets/index.json

clean :
	rm ${ALL_OUTPUT_SVGS}
	rm assets/index.json

assets/index.json : ${ALL_TILES}
	echo ${NORMAL_TILES} | sed -e 's/[^ ]\+/"assets\/\0",/g ; s/,$$//'
	echo "{ " \
		"\"H\": [`echo ${NORMAL_TILES} | sed -e 's/geomorphs\/\([^ ]\+\)/"assets\/\1",/g ; s/,$$//'`]," \
		"\"T\": [`echo ${NORMAL_TILES} | sed -e 's/geomorphs\/\([^ ]\+\)/"assets\/\1",/g ; s/,$$//'`]," \
		"\"P\": [`echo ${NORMAL_TILES} | sed -e 's/geomorphs\/\([^ ]\+\)/"assets\/\1",/g ; s/,$$//'`]," \
		"\"F\": [`echo ${NORMAL_TILES} | sed -e 's/geomorphs\/\([^ ]\+\)/"assets\/\1",/g ; s/,$$//'`]," \
		"\"H1\": [`echo ${FLIPPED_TILES} | sed -e 's/geomorphs\/\([^ ]\+\)/"assets\/\1",/g ; s/,$$//'`]" \
	"}" > assets/index.json

assets/%.svg : geomorphs/%.svg
	inkscape -l -o $@ $<
