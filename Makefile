#
# Main makefile for installation of fortunes
#

FORTUNE_DIR=/usr/share/fortune/
FORTUNE_BIN=fortune strfile
FORTUNE_TXT=InternationalSpaceStationLogs

all: ${FORTUNE_BIN} ${PREFIX}${FORTUNE_DIR} ${FORTUNE_TXT:%=%.dat}

install: all

uninstall:

${PREFIX}${FORTUNE_DIR}:
	mkdir -p $@

${FORTUNE_TXT:%=%.dat}:
	strfile ${@:%.dat=%}

${FORTUNE_BIN}:
	@if [ ! -x "$$(command -v $@)" ] ; \
	then \
		echo "'$@' is not installed." 1>&2 ; \
		exit 1 ; \
	fi

.PHONY: all install uninstall ${FORTUNE_BIN}

