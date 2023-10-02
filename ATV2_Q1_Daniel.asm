;ATIVIDADE PRÁTICA 2 - QUESTÃO 1
;Daniel do Nascimento Gomes - 215215553

section .data
    prompt_nome db "Por favor, insira um nome: ", 0
    prompt_letra db "Agora, insira uma letra: ", 0
    msg_primeira_ultima db "A primeira letra é: %c, e a última letra é: %c", 10, 0
    msg_encontrada db "A letra foi encontrada", 10, 0
    msg_nao_encontrada db "A letra não foi encontrada", 10, 0
    fmt_entrada db "%s", 0
    fmt_entrada_caractere db " %c", 0

section .bss
    nome resb 128
    letra resb 1

section .text
    global main
    extern printf, scanf

main:
    ; Solicitação e leitura do nome
    mov rdi, prompt_nome
    call printf
    mov rdi, fmt_entrada
    mov rsi, nome
    call scanf

    ; Solicitação e leitura da letra
    mov rdi, prompt_letra
    call printf
    mov rdi, fmt_entrada_caractere
    mov rsi, letra
    call scanf

    ; Encontrar primeira e última letra
    mov rax, nome
    .encontrar_ultima_letra:
        inc rax
        cmp byte [rax], 0
        jne .encontrar_ultima_letra
    mov al, [rax-1]

    ; Imprimir primeira e última letra
    mov rdi, msg_primeira_ultima
    movzx rsi, byte [nome]
    movzx rdx, al
    call printf

    ; Verificar se a letra está no nome
    mov rax, nome
    movzx rbx, byte [letra]
    .verificar_letra:
        inc rax
        cmp byte [rax], 0
        je .letra_nao_encontrada
        cmp byte [rax], bl
        je .letra_encontrada
        jmp .verificar_letra
    .letra_encontrada:
        mov rdi, msg_encontrada
        jmp .fim_mensagem
    .letra_nao_encontrada:
        mov rdi, msg_nao_encontrada
    .fim_mensagem:
        call printf

    ; Sair
    mov rax, 60
    xor rdi, rdi
    syscall
