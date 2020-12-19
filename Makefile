.DEFAULT: serve

.PHONY: serve
serve:
	hugo server --buildDrafts
