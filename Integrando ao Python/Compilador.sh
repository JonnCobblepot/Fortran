# isso gera o modulo SO "integra_python"
gfortran -o integra_python.so integra_python.f95 integra_python.c -I/usr/include/python3.6 -fPIC -shared