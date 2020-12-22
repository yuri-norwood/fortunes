#
# Main makefile for installation of fortunes
#

FORTUNE_DIR=/usr/share/fortune/
FORTUNE_BIN=fortune strfile

all: ${FORTUNE_BIN} ${PREFIX}${FORTUNE_DIR}

${PREFIX}${FORTUNE_DIR}:
	mkdir -p $@

${FORTUNE_BIN}:
	@if [ ! -x "$$(command -v $@)" ] ; \
	then \
		echo "'$@' is not installed." 1>&2 ; \
		exit 1 ; \
	fi

.PHONY: all ${FORTUNE_BIN}

