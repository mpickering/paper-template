.PHONY: all $(SOURCE_NAMES) lhs compile build-dir

### Constants ###
BUILD := build

OUTPUT := $(BUILD)/paper.pdf

LHS := $(shell find src -type f -name '*.lhs')
SOURCES := $(shell find src -type f -name 'Main.lhs')
SOURCE_NAMES := $(SOURCES:%.lhs=%)

all: $(OUTPUT)

build-dir:
	mkdir -p $(BUILD)

### Final pdf ###
$(OUTPUT): $(SOURCE_NAMES) build-dir
	texfot --no-stderr latexmk -interaction=nonstopmode -pdf -no-shell-escape -bibtex -jobname=$(BUILD)/paper $(BUILD)/Main.tex

### lhs2tex ###
lhs: $(SOURCE_NAMES)

$(SOURCE_NAMES): build-dir $(LHS)
	@echo "lhs2TEX: Compiling $@.lhs"
	@lhs2TeX -P "src:" $@.lhs -o $(BUILD)/$(notdir $@).tex

compile:
	cabal new-build

clean:
	rm -rf $(BUILD)
