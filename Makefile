#
# Main makefile for installation of fortunes
#

FORTUNE_SFW=InternationalSpaceStationLogs
FORTUNE_OFF=
FORTUNE_ALL=${FORTUNE_SFW} ${FORTUNE_OFF}
FORTUNE_DAT=${FORTUNE_ALL:%=%.dat}
FORTUNE_DIR=/usr/share/fortune/
FORTUNE_BIN=fortune strfile

check: ${FORTUNE_BIN} ${PREFIX}${FORTUNE_DIR}

all: check ${FORTUNE_DAT}

offensive: check ${FORTUNE_OFF:%=%.dat}

unoffensive: check ${FORTUNE_SFW:%=%.dat}

install:

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

.PHONY: check all offensive unoffensive install uninstall clean ${FORTUNE_BIN}

