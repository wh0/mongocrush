# Force sparse MongoDB data files.

And reduce the size of namespace files.

---

## Instructions

Run `make install`.
This patches a version of the Meteor tool so that it runs the MongoDB server differently.
Check what version it patches in the **Makefile**.
You can use `make uninstall` to go back to stock.

### Force sparse data files
MongoDB doesn't preallocate its data files [when it runs on NFS](https://github.com/mongodb/mongo/blob/r2.6.7/src/mongo/util/file_allocator.cpp#L153).
We simulate this condition with a shim over the `fstatfs64` function, implemented in **nfslie.c**.
This probably leads to instability if you later run out of disk space that MongoDB thinks you should have.

### Reduce the size of namespace files
> Each collection and index counts as a namespace. ...
> The default value of 16 megabytes provides for approximately 24,000 namespaces.

We reduce it to 1 MB.
Now you can only have like 1,500 namespaces.
You're really gonna have to tighten your belt to build an app under that constraint.

### Disable journaling
**Note: I haven't seen this in the latest version of stock, so I didn't include it in the patch this time.**
Journal files take like 384 MB right off the bat, in a blank app.
Only you can rationalize forgoing this durability.
