// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Carvalho	| Exemplo estrutura repetição While para cálculo numero par.
//            |                 | Apostila Página 192.
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

	MsgAlert("A soma dos 100 primeiros numeros pares é: " + cValToChar(nSomaPar))

Return