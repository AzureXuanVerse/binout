.POSIX:

export GENSHIN_DATA_REPO := $(HOME)/git/GenshinData

undefine CHECKOUT
CHECKOUT += v1.5.1-d633c8cfe5
CHECKOUT += v1.6.1-9ea6dc3292
CHECKOUT += v2.6.0-ecb5c64aa4
CHECKOUT += v2.7.0-ebb117f78d
CHECKOUT += v3.0.0-1a6597f5a6
CHECKOUT += v3.4.0-cbe446c9e6
CHECKOUT += v3.5.0-19eed979c8
CHECKOUT += v3.6.0-9aa4937b7d
CHECKOUT += v3.7.0-23109cab0d
CHECKOUT += v3.8.0-6b5b54aa48
CHECKOUT += v4.0.0-c7b9feddec
CHECKOUT += v4.0.1-96ee7720b7
CHECKOUT += v4.1.0-8fdce7e52f
CHECKOUT += v4.2.0-572765c019
CHECKOUT += v4.3.0-2b35f6dae2
CHECKOUT += v4.4.0-4c60f9ad83
CHECKOUT += v4.5.0-038f489619
CHECKOUT += v4.6.0-c9ce2e3eb1
CHECKOUT += v4.7.0-6073902d79
CHECKOUT += v4.8.0-a0d0783e9d
CHECKOUT += v5.0.0-92fb72e414
CHECKOUT += v5.1.0-0c1d78ff92

all: $(CHECKOUT)
$(CHECKOUT):
	./scripts/checkout $@ $(lastword $(subst -, ,$@))
	git commit -m "Add $@" -- $@ || true

translate:
	./scripts/translate $(CHECKOUT)
	git add v*
	git commit -m "Translate fields" -- v* || true

rebuild:
	git branch -D live || true
	./scripts/rebuild

.PHONY: all translate rebuild
