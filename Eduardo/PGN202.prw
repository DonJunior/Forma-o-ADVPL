// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Carvalho	| Exemplo Bloco de Código - DBEVAL().
//            |                 | Apostila Página 202.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN202()

	Local nCnt
	Local cTimeWhIni
	Local cTimeWhFim
	Local cTimeEvIni
	Local cTimeEvFim
	
	// Exemplo 1
	nCnt       := 0
	cTimeWhIni := Time()
	DbSelectArea("CT5")
	CT5->(DbSetOrder(1))
	CT5->(DbGoTop())
	
	While !CT5->(Eof()) .And. CT5->CT5_Filial == xFilial("CT5")
		nCnt++
		CT5->(DbSkip())
	EndDo
	cTimeWhFim := Time()
	MsgInfo("Total do While " + cValToChar(nCnt) + " em " + ElapTime(cTimeEvIni,cTimeEvFim) )

	// Exemplo 2
	nCnt       := 0
	cTimeEvIni := Time()
	DbEval({ | x | nCnt++},,{ || CT5->CT5_Filial == xFilial("CT5")} )
	cTimeEvFim := Time()
	MsgInfo("Total do DbEval " + cValToChar(nCnt) + " em " + ElapTime(cTimeEvIni,cTimeEvFim) )


Return