BINDIR=bin
ALL_GO_FILES=$(shell find ./ -type f -name '*.go')
#make sure that first item is main.go
GO_FILES=./main.go $(filter-out ./main.go,$(ALL_GO_FILES))

all: $(BINDIR)/golang-makefile

$(BINDIR)/golang-makefile: $(GO_FILES) | $(BINDIR)
	go build -o $@ $<

.PHONY: clean
clean:
	$(RM) -r $(BINDIR)

$(BINDIR):
	mkdir -p $@
