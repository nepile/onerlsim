# ==============================================================================
# Makefile - Automation Script
# Created: Neville, September 2026
# ==============================================================================

# parsing the arguments
ifeq (run,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

# Caught the '-b' flag
BATCH_MODE :=
ifneq (,$(findstring b,$(firstword -$(MAKEFLAGS))))
  BATCH_MODE := -b
endif

# Detect Operating System
ifdef OS
    DETECTED_OS := Windows
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        DETECTED_OS := Linux
    else ifeq ($(UNAME_S),Darwin)
        DETECTED_OS := macOS
    endif
endif

# Define script paths
CMD_DIR := cmd

# Main Targets
.PHONY: compile run create-docs

# Compilation Target
compile:
ifeq ($(DETECTED_OS),Windows)
	@echo "--- [Windows] Compiling Program ---"
	cmd /c "$(CMD_DIR)\compile.bat"
else
	@echo "--- [$(DETECTED_OS)] Compiling Program ---"
	@echo "Setting execution permissions for compile.sh..."
	chmod +x $(CMD_DIR)/compile.sh
	./$(CMD_DIR)/compile.sh
endif

# Execution Target
run:
ifeq ($(DETECTED_OS),Windows)
	@echo "--- [Windows] Running Program ---"
	cmd /c "$(CMD_DIR)\one.bat" $(BATCH_MODE) $(RUN_ARGS)
else
	@echo "--- [$(DETECTED_OS)] Running Program ---"
	@echo "Setting execution permissions for one.sh..."
	chmod +x $(CMD_DIR)/one.sh
	./$(CMD_DIR)/one.sh $(BATCH_MODE) $(RUN_ARGS)
endif

# Javadoc Generation Target
create-docs:
	@echo "--- [$(DETECTED_OS)] Generating Javadocs ---"
ifeq ($(DETECTED_OS),Windows)
	@if not exist docs mkdir docs
	javadoc -d docs -sourcepath src -cp "lib/*;src" -subpackages core:ui:gui:input:movement:report:routing:applications:interfaces
else
	@mkdir -p docs
	javadoc -d docs -sourcepath src -cp "lib/*:src" -subpackages core:ui:gui:input:movement:report:routing:applications:interfaces
endif
	@echo "--- Javadoc has been created. Please open 'docs' folder ---"