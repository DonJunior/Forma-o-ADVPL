// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data:      | Autor:          | Descrição:
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Junior      | Exemplo estrutura repetição FOR para cálculo numero par.
//            |                 | Apostila Página 191
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN191()
	
	Local nCnt
	Local nSomaPar := 0
	
	For nCnt := 0 To 100 Step 2
		nSomaPar += nCnt
	Next nCnt

	MsgAlert("A soma dos 100 primeiros numeros pares é: " + cValToChar(nSomaPar))
	         
Return