// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Carvalho	| Exemplo estrutura repetição FOR para cálculo Fatorial.
//            |                 | Apostila Página 176.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN176()
	
	Local nCnt
	Local nResultado := 1
	Local nFator     := 5
	
	// Cálculo Fatorial
	For nCnt := nFator To 1 Step - 1
		nResultado *= nCnt
	Next nCnt

	// Exibição do resiltado
	MsgAlert("O Fatorial de: " + cValToChar(nFator) +;
	         " é: " + cValToChar(nResultado))
	         
// Fim do programa	
Return