# See http://lwn.net/Articles/415753/

if [ "$PS1" ] ; then
    mkdir -m 0700 /sys/fs/cgroup/cpu/user/$$
    echo $$ > /sys/fs/cgroup/cpu/user/$$/tasks
fi

# As root:
#mount -t cgroup cgroup /sys/fs/cgroup/cpu -o cpu
#mkdir -m 0777 /sys/fs/cgroup/cpu/user
