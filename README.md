```
guest1212:~/Workspaces/mongocrush (master) $ meteor create blank
blank: created.

To run your new app:
  cd blank
  meteor
guest1212:~/Workspaces/mongocrush (master) $ (cd blank && meteor)
[[[[[ ~/Workspaces/mongocrush/blank ]]]]]

=> Started proxy.
=> Started MongoDB.
=> Started your app.

=> App running at: http://localhost:3000/
^C
guest1212:~/Workspaces/mongocrush (master) $ du -sh blank/.meteor/local/db/
449M    blank/.meteor/local/db/
```

```
guest1212:~/Workspaces/mongocrush (master) $ make install
cp $HOME/.meteor/packages/meteor-tool/1.0.40/meteor-tool-os.linux.x86_64/tools/run-mongo.js run-mongo.js.orig
cp run-mongo.js.orig run-mongo.js
patch run-mongo.js < crush.patch
patching file run-mongo.js
cc -g -shared -fPIC -o libnfslie.so nfslie.c -ldl
cp run-mongo.js $HOME/.meteor/packages/meteor-tool/1.0.40/meteor-tool-os.linux.x86_64/tools
cp libnfslie.so $HOME/.meteor/packages/meteor-tool/1.0.40/meteor-tool-os.linux.x86_64/dev_bundle/lib
guest1212:~/Workspaces/mongocrush (master) $ (cd blank && meteor reset && meteor)
Project reset.
[[[[[ ~/Workspaces/mongocrush/blank ]]]]]

=> Started proxy.
=> Started MongoDB.
=> Started your app.

=> App running at: http://localhost:3000/
^C
guest1212:~/Workspaces/mongocrush (master) $ du -sh blank/.meteor/local/db/
1.1M    blank/.meteor/local/db/
```
