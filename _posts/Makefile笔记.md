---
title: Makefile笔记
updated: 1556366363
date: 2019-04-17 22:20:21
tags:
 - c
 - Makefile
---


```makefile
CC       := gcc
CFLAGS   := -lpthread -g
TARGETS  := shit
INC      := $(shell find -L ./ -name "*.h")

a:
	gcc a.c ${INC} $(par) ${CFLAGS} -o shit # example: make a run par="-O2"

run:
	./shit

clean:
	rm ./shit

fuck:
	@echo $(par) # example: make fuck par="fuck you"

dump:
	objdump ./shit -S > fuck

gdb:
	gdb ./shit -tui

cgdb:
	cgdb ./shit
```
