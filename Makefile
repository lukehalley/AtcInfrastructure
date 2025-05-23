db:
	make -f makefile.db

runner:
# Main build targets: build, test, clean, deploy
	make -f makefile.runner# TODO: Add GitHub Actions workflow validation to lint target
# clean target removes build artifacts and caches
