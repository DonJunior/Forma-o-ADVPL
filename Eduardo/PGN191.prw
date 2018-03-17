// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data:      | Autor:          | Descri��o:
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Junior      | Exemplo estrutura repeti��o FOR para c�lculo numero par.
//            |                 | Apostila P�gina 191
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN191()
	
	Local nCnt
	Local nSomaPar := 0
	
	For nCnt := 0 To 100 Step 2
		nSomaPar += nCnt
	Next nCnt

	MsgAlert("A soma dos 100 primeiros numeros pares �: " + cValToChar(nSomaPar))
	         
Return