@echo off
ml /c /coff %1.asm
link /subsystem:console %1.obj