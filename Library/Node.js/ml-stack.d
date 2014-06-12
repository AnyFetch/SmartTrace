#!/usr/sbin/dtrace -s

inline string target = "node";

syscall::mmap:entry
/execname == target/
{
  @[jstack(100, 8000)] = sum(arg1);
}
