// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Carvalho	| Exemplo estrutura repeti��o FOR.
//            |                 | Apostila P�gina 174
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN174()
	
	Local nCnt
	Local nSoma := 0
	
	For nCnt := 1 To 10
		nSoma += nCnt
	Next nCnt

	MsgAlert("A soma �: " + cValToChar(nSoma))
	
Return