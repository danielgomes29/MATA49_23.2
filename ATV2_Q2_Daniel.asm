;ATIVIDADE PRÁTICA 2 - QUESTÃO 2
;Daniel do Nascimento Gomes - 215215553

section .data
    prompt_ano db "Anos: ", 0
    prompt_mes db "Meses: ", 0
    prompt_dia db "Dias: ", 0
    formato_entrada db "%u", 0
    formato_saida db "Total de dias: %u", 10, 0

section .bss
    anos resq 1
    meses resq 1
    dias resq 1
    total_dias resq 1

section .text
    global main
    extern scanf, printf, fflush, stdout

main:
    mov rdi, prompt_ano
    call printf
    mov rdi, formato_entrada
    mov rsi, anos
    call scanf

    mov rdi, prompt_mes
    call printf
    mov rdi, formato_entrada
    mov rsi, meses
    call scanf

    mov rdi, prompt_dia
    call printf
    mov rdi, formato_entrada
    mov rsi, dias
    call scanf

    mov eax, [anos]
    imul eax, 365
    mov ebx, [meses]
    imul ebx, 30
    add eax, ebx
    add eax, [dias]
    mov [total_dias], eax

    mov rdi, formato_saida
    mov rsi, [total_dias]
    call printf

    mov rax, 60
    xor rdi, rdi
    syscall
