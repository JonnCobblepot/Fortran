#include <Python.h>
#include <stdio.h>

extern void matriz(int * nlinhas, int * ncolunas, int* mat);
extern void check(); // Declaração implícita da função check

// Função wrapper em C para chamar a função Fortran
static PyObject* wrapper_matriz(PyObject* self, PyObject* args) {
    PyObject* py_matriz;
    int * matriz_data;
    int nlinhas, ncolunas;

    // Parse dos argumentos Python
    if (!PyArg_ParseTuple(args, "ii", &nlinhas, &ncolunas)) {
        return NULL;
    }

    printf("(from C) - Dimensões recebidas: nlinhas = %d, ncolunas = %d\n", nlinhas, ncolunas);

    // Alocar memória para a matriz
    matriz_data = (int *) malloc(nlinhas * ncolunas * sizeof(int));
    if (matriz_data == NULL) {
        PyErr_SetString(PyExc_RuntimeError, "(from C) - Falha ao alocar memória para a matriz");
        return NULL;
    }

    // Inicializar a matriz com zeros
    memset(matriz_data, 0, nlinhas * ncolunas * sizeof(int));

    // Chamar a função Fortran para preencher a matriz
    matriz(&nlinhas, &ncolunas, matriz_data);

    // Criar uma lista Python a partir da matriz
    py_matriz = PyList_New(nlinhas);
    for (int i = 0; i < nlinhas; i++) {
        PyObject* py_linha = PyList_New(ncolunas);
        for (int j = 0; j < ncolunas; j++) {
            PyList_SET_ITEM(py_linha, j, PyLong_FromLong(matriz_data[i * ncolunas + j]));
        }
        PyList_SET_ITEM(py_matriz, i, py_linha);
    }

    // Liberar memória alocada para a matriz
    free(matriz_data);

    // Retornar a lista Python para o Python    
    return py_matriz;
}

// Função wrapper em C para chamar a função Fortran
static PyObject* wrapper_check(PyObject* self, PyObject* args) {
    check();
    Py_RETURN_NONE; // Não retorna nada
}

// Lista de métodos do módulo
static PyMethodDef module_methods[] = {
    {"matriz", wrapper_matriz, METH_VARARGS, "Cria uma matriz."},
    {"check", wrapper_check, METH_NOARGS, "Checa o estado interno."},
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








/*
#include <Python.h>
#include <stdio.h>

extern void check();

static PyObject *wrapper_check(PyObject *self, PyObject* args) {
    check();
    Py_RETURN_NONE;
}

// Declaração da função Fortran
extern void vetor(int * elementos, int * n );

// Função wrapper em C para chamar a função Fortran
static PyObject* wrapper_vetor(PyObject* self, PyObject* args) {
    PyObject* py_lista;
    int n;

    // Parse dos argumentos Python
    if (!PyArg_ParseTuple(args, "i", &n)) {
        return NULL;
    }

    // Declaração da variável elementos como um ponteiro para c_int
    int * elementos;

    // Alocar memória para elementos
    elementos = (int *) malloc(n * sizeof(int));
    if (elementos == NULL) {
        PyErr_SetString(PyExc_RuntimeError, "(from C) - Falha ao alocar memória para elementos");
        return NULL;
    }
    // Chama a função Fortran 'vetor' (sem passar o tamanho da lista como argumento)
    vetor(elementos, &n);


    // Cria uma lista Python a partir do array 'elementos' retornado pela função Fortran
    py_lista = PyList_New(n);
    for (int i = 0; i < n; i++) {
        PyList_SET_ITEM(py_lista, i, PyLong_FromLong(elementos[i]));
    }

    // Liberar memória alocada para elementos
    free(elementos);

    // Retornar a lista Python para o Python    
    return py_lista;
}

// Lista de métodos do módulo
static PyMethodDef module_methods[] = {
    {"vetor", wrapper_vetor, METH_VARARGS, "Monta uma lista 1 a 1."},
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

*/