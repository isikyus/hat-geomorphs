
OUTPUT_NORMAL_TILES = $(shell find . -type f -name 'tile*.svg' | sed -e 's/^/..\/assets\//')
OUTPUT_FLIPPED_TILES = $(shell find . -type f -name 'elit*.svg' | sed -e 's/^/..\/assets\//')
ALL_TILES = ${OUTPUT_NORMAL_TILES} ${OUTPUT_FLIPPED_TILES}

geomorphs : ${ALL_TILES}

clean :
	rm ${ALL_TILES}

../assets/%.svg : %.svg
	inkscape -l -o $@ $<
