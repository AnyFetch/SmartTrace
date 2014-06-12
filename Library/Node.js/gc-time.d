#!/usr/sbin/dtrace -s

dtrace:::BEGIN
{
  start = timestamp;
}

node*:::gc-start
{
  self->ts = timestamp;
}

node*:::gc-done
{
  @gc = sum((timestamp - self->ts));
  @cnt = count();
  self->ts = 0
}

tick-10s
{
  printf("%d sec", (timestamp - start) / 1000000000);
  printa(@gc);
  printa(@cnt);
}
