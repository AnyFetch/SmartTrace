#!/usr/sbin/dtrace -s

profile-97
/execname == "node" && arg1/
{
  @[jstack(100, 8000)] = count();
}
