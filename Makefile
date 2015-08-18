.PHONY: all update build

all: update build commit

update:
	crowdin-cli download

build:
	for i in */WinSparkle/*.po; do \
	  msgfmt "$$i" -o "$${i%%.po}.mo"; \
	done

commit:
	git add */WinSparkle/*.po */WinSparkle/*.mo
	git commit -m "Update from Pomotodo's crowding project"