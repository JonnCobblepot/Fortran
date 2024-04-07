# isso gera o modulo SO "integra_python"
#!/bin/bash
gfortran -g -fbounds-check -fbacktrace -Wall -O0 -o integra_python.so integra_python.f95 integra_python.c -I/usr/include/python3.10/ -fPIC -shared

