EMACS=emacs
ORG_CONFIG_FILE=web.el

# EMACS_OPTS=--batch --eval "(load-file \"$(ORG_CONFIG_FILE)\")" -f publish
EMACS_OPTS=--batch -l ~/.emacs.d/init.el --eval "(load-file \"$(ORG_CONFIG_FILE)\")" -f publish

DEST_HOST=''
OUTPUT_DIR=output

all: html

html:
	@echo "Generating HTML..."
	@mkdir -p $(OUTPUT_DIR)
	@$(EMACS) $(EMACS_OPTS)
	@echo "HTML generation done"

clean: 	
	@rm -rf $(OUTPUT_DIR)
	@rm -rf ~/.org-timestamps/demo-site.cache
	@rm -rf ~/.org-timestamps/demo-static.cache

upload: 
	@cd $(OUTPUT_DIR) && scp -r . $(DEST_HOST) && cd ..
