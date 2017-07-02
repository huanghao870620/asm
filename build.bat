@echo off
ml /c /coff %1.asm
link /subsystem:windows %1.obj