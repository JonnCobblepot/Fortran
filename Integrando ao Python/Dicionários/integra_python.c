#define PY_SSIZE_T_CLEAN
#include <Python.h>
#include <stdio.h>

extern void check();
extern void adicionar_chave(char* nome, int nome_len, int* numeros, int numeros_len);
extern void print_agenda();
extern void modificar_contato(char* nome, int nome_len, int novo_numero);

// Protótipos das funções de wrapper
static PyObject* wrapper_adicionar_chave(PyObject* self, PyObject* args);
static PyObject* wrapper_print_agenda(PyObject* self, PyObject* args);
static PyObject* wrapper_check(PyObject* self, PyObject* args);
static PyObject* wrapper_modificar_contato(PyObject* self, PyObject* args);

// Função wrapper para adicionar_chave
static PyObject* wrapper_adicionar_chave(PyObject* self, PyObject* args) {
    char* nome;
    Py_ssize_t nome_len;
    PyObject* numeros_obj;
    Py_ssize_t numeros_len;
    int* numeros;
    int i;

    if (!PyArg_ParseTuple(args, "s#O", &nome, &nome_len, &numeros_obj)) {
        return NULL;
    }

    numeros_len = PyList_Size(numeros_obj);
    numeros = (int*)malloc(numeros_len * sizeof(int));
    if (numeros == NULL) {
        PyErr_SetString(PyExc_RuntimeError, "(from C) - Falha ao alocar memória para os números");
        return NULL;
    }

    for (i = 0; i < numeros_len; i++) {
        numeros[i] = PyLong_AsLong(PyList_GetItem(numeros_obj, i));
    }

    adicionar_chave(nome, (int)nome_len, numeros, (int)numeros_len);
    free(numeros);

    Py_RETURN_NONE;
}

// Função wrapper para print_agenda
static PyObject* wrapper_print_agenda(PyObject* self, PyObject* args) {
    print_agenda();
    Py_RETURN_NONE;
}

// Função wrapper para check
static PyObject* wrapper_check(PyObject* self, PyObject* args) {
    check();
    Py_RETURN_NONE;
}

// Função wrapper para modificar_contato
static PyObject* wrapper_modificar_contato(PyObject* self, PyObject* args) {
    char* nome;
    Py_ssize_t nome_len;
    int novo_numero;

    if (!PyArg_ParseTuple(args, "s#i", &nome, &nome_len, &novo_numero)) {
        return NULL;
    }

    modificar_contato(nome, (int)nome_len, novo_numero);

    Py_RETURN_NONE;
}

// Lista de métodos exportados
static PyMethodDef module_methods[] = {
    {"adicionar_chave", wrapper_adicionar_chave, METH_VARARGS, "Adiciona uma nova entrada à agenda telefônica."},
    {"print_agenda", wrapper_print_agenda, METH_NOARGS, "Imprime o conteúdo da agenda telefônica."},
    {"check", wrapper_check, METH_NOARGS, "Verifica o estado do dicionário."},
    {"modificar_contato", wrapper_modificar_contato, METH_VARARGS, "Modifica um contato existente na agenda telefônica."},
    {NULL, NULL, 0, NULL} // Fim da lista de métodos
};  

// Definição do módulo Python
static struct PyModuleDef moduledef = {
    PyModuleDef_HEAD_INIT,
    "integra_python",
    NULL,
    -1,
    module_methods
};

// Função de inicialização do módulo
PyMODINIT_FUNC PyInit_integra_python(void) {
    return PyModule_Create(&moduledef);
}
