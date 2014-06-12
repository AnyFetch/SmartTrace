#!/usr/sbin/dtrace -s

node*:::gc-start
{
  @[jstack(100, 8000)] = count();
}
