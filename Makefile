#
# Main makefile for installation of fortunes
#

FORTUNE_DIR=/usr/share/fortune/
FORTUNE_BIN=fortune strfile
FORTUNE_TXT=InternationalSpaceStationLogs
FORTUNE_DAT=${FORTUNE_TXT:%=%.dat}

all: ${FORTUNE_BIN} ${PREFIX}${FORTUNE_DIR} ${FORTUNE_DAT}

install: all

uninstall:

clean:
	rm -f ${FORTUNE_DAT}

${PREFIX}${FORTUNE_DIR}:
	mkdir -p $@

${FORTUNE_DAT}: %.dat : %
	strfile  $<

${FORTUNE_BIN}:
	@if [ ! -x "$$(command -v $@)" ] ; \
	then \
		echo "'$@' is not installed." 1>&2 ; \
		exit 1 ; \
	fi

.PHONY: all install uninstall clean ${FORTUNE_BIN}

