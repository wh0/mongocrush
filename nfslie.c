#define _GNU_SOURCE

#include <dlfcn.h>
#include <linux/magic.h>
#include <sys/vfs.h>

static int (*fstatfs64_impl)(int fd, struct statfs64 *buf);
__attribute__((constructor)) static void init() {
	fstatfs64_impl = dlsym(RTLD_NEXT, "fstatfs64");
}

int fstatfs64(const int fd, struct statfs64 * const buf) {
	const int ret = fstatfs64_impl(fd, buf);
	if (ret != 0) return ret;
	buf->f_type = NFS_SUPER_MAGIC;
	return ret;
}
