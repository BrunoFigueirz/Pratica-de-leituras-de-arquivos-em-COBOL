# Contagem de Funcionários por Gênero

Programa COBOL que lê um arquivo de funcionários, exibe os dados de 
cada um na tela e totaliza quantos homens e mulheres existem no 
cadastro.

## O que o programa faz

- Abre e lê um arquivo sequencial, registro por registro
- Exibe matrícula, gênero e nome completo de cada funcionário
- Conta o total de homens e o total de mulheres
- Exibe um resumo final com os dois totais

## Layout do arquivo de entrada (`FUNCIONARIOS.DATA`)

| Campo                  | Posição | Tamanho | PIC      |
|-------------------------|---------|---------|----------|
| Matrícula do Funcionário | 1–5     | 5       | `9(5)`   |
| Primeiro Nome            | 6–25    | 20      | `X(20)`  |
| Último Nome               | 26–45   | 20      | `X(20)`  |
| Gênero                    | 46      | 1       | `X(1)`   |

## Como compilar e rodar

```bash
cobc -x Salarios.cbl -o Salarios
./Salarios
```

> Importante: o executável precisa ser rodado na mesma pasta onde está 
> o arquivo `FUNCIONARIOS.DATA`, pois o caminho no `SELECT` é relativo.

## Exemplo de saída

```text
===========================
CONTAGEM DE FUNCIONARIOS
===========================

12321 M Joao Silva
13434 F Maria Silva
43543 F Luiza Albuquerque
53453 M Mario Oliveira
43454 F Samara Correia
87978 M Alberico Soares
87886 M Carlos Souza
76535 M Joao Ramalho
54543 F Roberta Martins
Resumo :
TOTAL HOMENS: 005
TOTAL MULHERES: 004
```

## O que pratiquei aqui

- Estrutura básica de um programa COBOL (`IDENTIFICATION`, `ENVIRONMENT`,
  `DATA`, `PROCEDURE`)
- Leitura de arquivo sequencial com `READ` / `AT END` / `NOT AT END`
- Contadores com `ADD`
- `FUNCTION TRIM` para tratamento de texto
