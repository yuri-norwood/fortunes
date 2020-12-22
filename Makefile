#
# Main makefile for installation of fortunes
#

DESTINATION=/usr/share/fortune

FORTUNE_SFW=InternationalSpaceStationLogs
FORTUNE_OFF=
FORTUNE_ALL=${FORTUNE_SFW} ${FORTUNE_OFF}
FORTUNE_DAT=${FORTUNE_ALL:%=%.dat}
FORTUNE_DIR=${PREFIX}${DESTINATION}
FORTUNE_BIN=fortune strfile

check: ${FORTUNE_BIN} ${FORTUNE_DIR}

all: check ${FORTUNE_DAT}

offensive: check ${FORTUNE_OFF:%=%.dat}

unoffensive: check ${FORTUNE_SFW:%=%.dat}

install:
	@for fortune in ${FORTUNE_ALL}                             ; \
	do                                                           \
		if [ -f "$${fortune}"     ]                          \
		&& [ -f "$${fortune}.dat" ]                        ; \
		then                                                 \
			echo "Installing $${fortune}"              ; \
			cp -f "$${fortune}"     "${FORTUNE_DIR}/." ; \
			cp -f "$${fortune}.dat" "${FORTUNE_DIR}/." ; \
		fi                                                 ; \
	done

uninstall:
	@for fortune in ${FORTUNE_ALL}                 ; \
	do                                               \
		rm -f "${FORTUNE_DIR}/$${fortune}"     ; \
		rm -f "${FORTUNE_DIR}/$${fortune}.dat" ; \
	done

clean:
	rm -f ${FORTUNE_DAT}

${FORTUNE_DIR}:
	mkdir -p $@

${FORTUNE_DAT}: %.dat : %
	strfile  $<

${FORTUNE_BIN}:
	@if [ ! -x "$$(command -v $@)" ]           ; \
	then                                         \
		echo "'$@' is not installed." 1>&2 ; \
		exit 1                             ; \
	fi

.PHONY: check all offensive unoffensive install uninstall clean ${FORTUNE_BIN}

