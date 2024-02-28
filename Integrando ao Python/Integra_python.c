#include <Python.h>

extern void check();

static PyObject *wrapper_check(PyObject *self, PyObject* args) {
    check();
    Py_RETURN_NONE;
}

// Declaração da função Fortran
extern void soma(double *a, double *b, double *c);

// Função wrapper em C para chamar a função Fortran
static PyObject* wrapper_soma(PyObject* self, PyObject* args) {
    double a, b, c;

    // Parse dos argumentos Python
    if (!PyArg_ParseTuple(args, "dd", &a, &b)) {
        return NULL;
    }

    // Chamada da função Fortran
    soma(&a, &b, &c);

    // Retornar o resultado para o Python
    return Py_BuildValue("d", c);
}

// Lista de métodos do módulo
static PyMethodDef module_methods[] = {
    {"soma", wrapper_soma, METH_VARARGS, "Soma dois números."},
    {"check", wrapper_check, METH_VARARGS, "Checa o estado interno."},
    {NULL, NULL, 0, NULL}  // Marca de fim da lista
};

// Inicialização do módulo
static struct PyModuleDef moduledef = {
    PyModuleDef_HEAD_INIT,
    "integra_python",  // Nome do módulo
    NULL,           // Documentação do módulo
    -1,             // Estado do módulo, -1 significa que o módulo não suporta sub-interpretação
    module_methods
};

PyMODINIT_FUNC PyInit_integra_python(void) {
    return PyModule_Create(&moduledef);
}