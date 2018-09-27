# Destination directory
DEST_DIR = /usr/local/bin

GENERALSCRIPTS = 

SIRIUSSCRIPTS= $(shell ls sirius-*)

SCRIPTS = $(GENERALSCRIPTS)\
	  $(SIRIUSSCRIPTS)

FULLSCRIPTS = $(addprefix $(DEST_DIR)/, $(SCRIPTS))

install: uninstall $(SCRIPTS)
	cp $(SCRIPTS) $(DEST_DIR); cd $(DEST_DIR); chmod a+x $(SCRIPTS)

uninstall:
	-rm -rf $(FULLSCRIPTS)

develop: uninstall $(SCRIPTS)
	ln -srf $(SCRIPTS) $(DEST_DIR)

sirius: $(SIRIUSSCRIPTS)
	install $(SIRIUSSCRIPTS) $(DEST_DIR)

