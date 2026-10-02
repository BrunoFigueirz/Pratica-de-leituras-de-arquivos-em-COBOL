# Vendas por Região — Quebra de Controle

Programa COBOL que lê um arquivo de vendas ordenado por região e gera 
um relatório com o subtotal de vendas de cada região e o total geral 
no final.

## O que o programa faz

- Lê um arquivo sequencial já ordenado por região
- Exibe cada vendedor com sua região e valor de vendas
- Ao identificar a mudança de uma região para outra, imprime o 
  **subtotal** da região que terminou
- Ao final da leitura, imprime o subtotal da última região e o 
  **total geral** de todas as vendas

Esse é o padrão clássico de **quebra de controle** (control break), 
muito usado em relatórios de sistemas batch — folha de pagamento, 
extratos bancários, fechamento de vendas.

## Layout do arquivo de entrada (`VENDAS.DATA`)

| Campo     | Posição | Tamanho | PIC         |
|-----------|---------|---------|-------------|
| Região    | 1–15    | 15      | `X(15)`     |
| Vendedor  | 16–35   | 20      | `X(20)`     |
| Valor     | 36–43   | 8       | `9(6)V99`   |

> O arquivo precisa estar ordenado por região para a lógica de quebra 
> de controle funcionar corretamente.

## Como compilar e rodar

```bash
cobc -x Regioes.cbl -o Regioes
./Regioes
```

> Importante: o executável precisa ser rodado na mesma pasta onde está 
> o arquivo `VENDAS.DATA`, pois o caminho no `SELECT` é relativo.

## Exemplo de saída

=================================
CONTAGEM DE VENDAS
CENTRO-OESTE    Ana Paula Ribeiro      R$   450,00
CENTRO-OESTE    Marcos Lima            R$   320,05
CENTRO-OESTE    Juliana Castro         R$ 1.999,99
SUBTOTAL CENTRO-OESTE : R$ 2.769,99

NORDESTE        Pedro Henrique Alves   R$ 2.750,00
NORDESTE        Camila Torres          R$ 5.100,25
SUBTOTAL NORDESTE     : R$ 7.850,25
...
SUBTOTAL SUL          : R$ 6.440,75
=================================
TOTAL GERAL           : R$ 42.896,98


## O que pratiquei aqui

- Leitura de arquivo sequencial com `READ` / `AT END` / `NOT AT END`
- Acumuladores de subtotal e total geral
- Comparação de registro atual com o anterior (técnica de quebra de 
  controle)
- Flag de controle para tratar o primeiro registro do arquivo, 
  evitando a impressão de um subtotal "fantasma" no início
