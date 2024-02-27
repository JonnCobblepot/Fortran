from integra_python import soma, check

# Chama a função check no fortran que tem acesso a variável my_internal_state
check()

for a,b in [(1.0,2.0),(-1.0,2.0)]:
    c = soma(a,b)
    print(f'(from python) a soma de {a} com {b} dá {c}')
    check()
