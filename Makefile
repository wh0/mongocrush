METEOR_TOOL_DIR := $$HOME/.meteor/packages/meteor-tool/1.0.40/meteor-tool-os.linux.x86_64

all: libnfslie.so run-mongo.js

libnfslie.so: nfslie.c
	$(CC) -g -shared -fPIC -o $@ $< -ldl

run-mongo.js: crush.patch | run-mongo.js.orig
	cp $| $@
	patch $@ < $<

run-mongo.js.orig:
	cp $(METEOR_TOOL_DIR)/tools/run-mongo.js $@

install: run-mongo.js libnfslie.so
	cp run-mongo.js $(METEOR_TOOL_DIR)/tools
	cp libnfslie.so $(METEOR_TOOL_DIR)/dev_bundle/lib

diff: run-mongo.js | run-mongo.js.orig
	diff -u $| $< > crush.patch || true
	touch $<

.PHONY: all install diff
