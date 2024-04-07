#define PY_SSIZE_T_CLEAN
#include <Python.h>
#include <stdio.h>
    
extern void check();
extern void adicionar_chave(char* nome, int nome_len, int numero);
extern void print_agenda();
extern void excluir_contato(char* nome, int nome_len);
extern void alterar_contato(char* nome, int nome_len, char* novo_nome, int novo_nome_len, int novo_numero);
    
// Protótipos das funções de wrapper
static PyObject* wrapper_adicionar_chave(PyObject* self, PyObject* args);
static PyObject* wrapper_excluir_contato(PyObject* self, PyObject* args);
static PyObject* wrapper_alterar_contato(PyObject* self, PyObject* args);
static PyObject* wrapper_print_agenda(PyObject* self, PyObject* args);
static PyObject* wrapper_check(PyObject* self, PyObject* args);
    
// Função wrapper para adicionar_chave
static PyObject* wrapper_adicionar_chave(PyObject* self, PyObject* args) {
    char* nome;
    Py_ssize_t nome_len;
    int numero;
    
    if (!PyArg_ParseTuple(args, "s#i", &nome, &nome_len, &numero)) {
        return NULL;
    }
    
    adicionar_chave(nome, (int)nome_len, numero);
    
    Py_RETURN_NONE;
}
    
// Função wrapper para excluir_contato
static PyObject* wrapper_excluir_contato(PyObject* self, PyObject* args) {
    char* nome;
    Py_ssize_t nome_len;
    
    if (!PyArg_ParseTuple(args, "s#", &nome, &nome_len)) {
        return NULL;
    }
    
    excluir_contato(nome, (int)nome_len);
    
    Py_RETURN_NONE;
}
    
// Função wrapper para alterar_contato
static PyObject* wrapper_alterar_contato(PyObject* self, PyObject* args) {
    char* nome;
    Py_ssize_t nome_len;
    char* novo_nome;
    Py_ssize_t novo_nome_len;
    int novo_numero;
    
    if (!PyArg_ParseTuple(args, "s#s#i", &nome, &nome_len, &novo_nome, &novo_nome_len, &novo_numero)) {
        return NULL;
    }
    
    alterar_contato(nome, (int)nome_len, novo_nome, (int)novo_nome_len, novo_numero);
    
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
    
// Estrutura de métodos
static PyMethodDef integra_python_methods[] = {
    {"adicionar_chave", wrapper_adicionar_chave, METH_VARARGS, "Adicionar um contato à agenda."},
    {"excluir_contato", wrapper_excluir_contato, METH_VARARGS, "Excluir um contato da agenda."},
    {"alterar_contato", wrapper_alterar_contato, METH_VARARGS, "Alterar um contato na agenda."},
    {"print_agenda", wrapper_print_agenda, METH_NOARGS, "Imprimir a agenda telefônica."},
    {"check", wrapper_check, METH_NOARGS, "Verificar o estado da agenda telefônica."},
    {NULL, NULL, 0, NULL}  // Marcação de término da lista de métodos
};
    
// Função de inicialização do módulo
static struct PyModuleDef integra_python_module = {
    PyModuleDef_HEAD_INIT,
    "integra_python",   // Nome do módulo
    NULL,               // Documentação do módulo, pode ser NULL
    -1,                 // Tamanho do estado global do módulo, -1 indica que o módulo não suporta subinterpretação
    integra_python_methods  // A estrutura de métodos
};
    
// Função de inicialização do módulo
PyMODINIT_FUNC PyInit_integra_python(void) {
    return PyModule_Create(&integra_python_module);
}