// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Carvalho	| Exemplo estrutura repeti��o While para c�lculo numero par.
//            |                 | Apostila P�gina 192.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN192()

	Local nNumber := 0
	Local nSomaPar := 0 

	While nNumber <= 100

		nSomaPar += nNumber
		nNumber  += 2

	EndDo

	MsgAlert("A soma dos 100 primeiros numeros pares �: " + cValToChar(nSomaPar))

Return