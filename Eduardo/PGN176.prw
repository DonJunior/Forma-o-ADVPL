// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Carvalho	| Exemplo estrutura repeti��o FOR para c�lculo Fatorial.
//            |                 | Apostila P�gina 176.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN176()
	
	Local nCnt
	Local nResultado := 1
	Local nFator     := 5
	
	// C�lculo Fatorial
	For nCnt := nFator To 1 Step - 1
		nResultado *= nCnt
	Next nCnt

	// Exibi��o do resiltado
	MsgAlert("O Fatorial de: " + cValToChar(nFator) +;
	         " �: " + cValToChar(nResultado))
	         
// Fim do programa	
Return