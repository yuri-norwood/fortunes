#
# Main makefile for installation of fortunes
#
# This must be the first non-comment line
.POSIX:

DESTINATION=/usr/share/games/fortunes

FORTUNE_SFW=InternationalSpaceStationLogs
FORTUNE_OFF=PrincipiaDiscordia Insults ILoveToConspire
FORTUNE_ALL=${FORTUNE_SFW} ${FORTUNE_OFF}
FORTUNE_DAT=${FORTUNE_ALL:%=%.dat}
FORTUNE_DIR=${PREFIX}${DESTINATION}

usage:
	@printf '%s\n'     "Usage: make [DESTINATION=<fortune directory>] [usage | [[clean] [all | offensive | unoffensive] [install | uninstall]]]"
	@printf '%s\n'     "Targets:"
	@printf '\t%s\n'   "usage:"
	@printf '\t\t%s\n' "Show this message."
	@printf '\t%s\n'   "clean:"
	@printf '\t\t%s\n' "Clean up all locally generated files, mainly the various .dat"
	@printf '\t\t%s\n' "files."
	@printf '\t%s\n'   "all:"
	@printf '\t\t%s\n' "Generate the .dat files for all configured fortunes, including"
	@printf '\t\t%s\n' "offensive fortunes."
	@printf '\t%s\n'   "offensive:"
	@printf '\t\t%s\n' "Generate the .dat files for ONLY the (potentially) offensive"
	@printf '\t\t%s\n' "fortunes."
	@printf '\t%s\n'   "unoffensive:"
	@printf '\t\t%s\n' "Generate the .dat files for ONLY the safe, unoffensive"
	@printf '\t\t%s\n' "fortunes."
	@printf '\t%s\n'   "install:"
	@printf '\t\t%s\n' "Install all currently generated .dat files and their"
	@printf '\t\t%s\n' "respective fortunes. Note: this requires some .dat files to"
	@printf '\t\t%s\n' "have been generated by a previously specified generation"
	@printf '\t\t%s\n' "target, one of [all | offensive | unoffensive]."
	@printf '\t%s\n'   "uninstall:"
	@printf '\t\t%s\n' "Uninstall all currenlt install .dat files and their respective"
	@printf '\t\t%s\n' "fortunes. Note: this may remove fortunes installed by others"
	@printf '\t\t%s\n' "projects or packages if there are name collisions."
	@exit 1

check: ${FORTUNE_DIR} ${FORTUNE_DIR}/off

all: ${FORTUNE_DAT}

offensive: ${FORTUNE_OFF:%=%.dat}

unoffensive: ${FORTUNE_SFW:%=%.dat}

install: check
	@for fortune in ${FORTUNE_SFW}                                 ; \
	do                                                               \
		if [ -f "$${fortune}"     ]                              \
		&& [ -f "$${fortune}.dat" ]                            ; \
		then                                                     \
			echo "Installing $${fortune}"                  ; \
			cp -f "$${fortune}"     "${FORTUNE_DIR}/."     ; \
			cp -f "$${fortune}.dat" "${FORTUNE_DIR}/."     ; \
		fi                                                     ; \
	done
	@for fortune in ${FORTUNE_OFF}                                 ; \
	do                                                               \
		if [ -f "$${fortune}"     ]                              \
		&& [ -f "$${fortune}.dat" ]                            ; \
		then                                                     \
			echo "Installing $${fortune}"                  ; \
			cp -f "$${fortune}"     "${FORTUNE_DIR}/off/." ; \
			cp -f "$${fortune}.dat" "${FORTUNE_DIR}/off/." ; \
		fi                                                     ; \
	done

uninstall: check
	@for fortune in ${FORTUNE_SFW}                     ; \
	do                                                   \
		rm -f "${FORTUNE_DIR}/$${fortune}"         ; \
		rm -f "${FORTUNE_DIR}/$${fortune}.dat"     ; \
	done
	@for fortune in ${FORTUNE_OFF}                     ; \
	do                                                   \
		rm -f "${FORTUNE_DIR}/off/$${fortune}"     ; \
		rm -f "${FORTUNE_DIR}/off/$${fortune}.dat" ; \
	done

clean:
	rm -f ${FORTUNE_DAT}

${FORTUNE_DIR} ${FORTUNE_DIR}/off:
	mkdir -p $@

${FORTUNE_DAT}: %.dat : %
	strfile  $<

.PHONY: check all offensive unoffensive install uninstall clean

