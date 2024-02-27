#include <Python.h>

// Declaração da função Fortran
extern void soma_(float *a, float *b, float *c);

// Função wrapper em C para chamar a função Fortran
static PyObject* wrapper_soma(PyObject* self, PyObject* args) {
    float a, b, c;

    // Parse dos argumentos Python
    if (!PyArg_ParseTuple(args, "ff", &a, &b)) {
        return NULL;
    }

    // Chamada da função Fortran
    soma_(&a, &b, &c);

    // Retornar o resultado para o Python
    return Py_BuildValue("f", c);
}

// Lista de métodos do módulo
static PyMethodDef module_methods[] = {
    {"soma", wrapper_soma, METH_VARARGS, "Soma dois números."},
    {NULL, NULL, 0, NULL}  // Marca de fim da lista
};

// Inicialização do módulo
static struct PyModuleDef moduledef = {
    PyModuleDef_HEAD_INIT,
    "meu_modulo",  // Nome do módulo
    NULL,           // Documentação do módulo
    -1,             // Estado do módulo, -1 significa que o módulo não suporta sub-interpretação
    module_methods
};

PyMODINIT_FUNC PyInit_meu_modulo(void) {
    return PyModule_Create(&moduledef);
}
