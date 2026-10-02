       IDENTIFICATION DIVISION.
       PROGRAM-ID. Regioes.
       AUTHOR. BRUNO SOUSA.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT VENDAS ASSIGN TO "VENDAS.DATA"
               ORGANIZATION IS LINE SEQUENTIAL.


       DATA DIVISION.
       FILE SECTION.
       FD VENDAS.

       01 DETALHESREGIAO.
           05 REGIAO                   PIC X(15).
           05 VENDEDOR                 PIC X(20).
           05 VALOR                    PIC 9(6)V99.
       
       WORKING-STORAGE SECTION.
       01 CONTADOR-DE-REGIOES.
           05 REGIAO-ANTERIOR          PIC X(15) VALUE SPACES.
           05 SUBTOTAL-POR-REGIOES         PIC 9(8)V99 VALUE 0.
           05 TOTAL-REGIOES            PIC 9(8)V99 VALUE 0.

       01 FIM-LEITURA                  PIC X 
       VALUE "N".
       01 PRIMERIA-LEITURA             PIC X VALUE "S".

       PROCEDURE DIVISION.

       DISPLAY "================================="
       DISPLAY "      CONTAGEM DE VENDADS        "
       DISPLAY "================================="

       OPEN INPUT VENDAS.

       PERFORM UNTIL FIM-LEITURA = "S"
           READ VENDAS
               AT END
                   MOVE "S" TO FIM-LEITURA
               NOT AT END
                   DISPLAY REGIAO " " VENDEDOR " " VALOR 

                   IF PRIMERIA-LEITURA = "S"
                       MOVE REGIAO TO REGIAO-ANTERIOR
                       MOVE "N" TO PRIMERIA-LEITURA
                   END-IF

                 IF REGIAO = REGIAO-ANTERIOR
                           ADD VALOR TO SUBTOTAL-POR-REGIOES
                       ELSE
                           DISPLAY "================================="
                           DISPLAY "SUBTOTAL " REGIAO-ANTERIOR ": "
                               SUBTOTAL-POR-REGIOES
                           DISPLAY "================================="
                           MOVE 0 TO SUBTOTAL-POR-REGIOES
                           MOVE REGIAO TO REGIAO-ANTERIOR
                           ADD VALOR TO SUBTOTAL-POR-REGIOES
                       END-IF

                       ADD VALOR TO TOTAL-REGIOES
           END-READ
       END-PERFORM.

           DISPLAY "==============================="
           DISPLAY "SUBTOTAL " REGIAO-ANTERIOR ": " SUBTOTAL-POR-REGIOES
           DISPLAY "==============================="

           CLOSE VENDAS.

           DISPLAY "================================="
           DISPLAY "TOTAL GERAL: " TOTAL-REGIOES
           DISPLAY "================================="

           STOP RUN.
       END PROGRAM Regioes.

