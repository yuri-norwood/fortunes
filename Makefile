#
# Main makefile for installation of fortunes
#

FORTUNE_DIR?=/usr/share/fortune/

all: fortune-bin ${PREFIX}${FORTUNE_DIR}

${PREFIX}${FORTUNE_DIR}:
	mkdir -p $@

fortune-bin:
	@if [ ! -x "$$(command -v fortune)" ] ; \
	then \
		echo "No fortune teller found." ; \
		exit 1 ; \
	fi

.PHONY: fortune-bin

