// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data:      | Autor:          | Descrição:
// -----------+-----------------+-----------------------------------------------------------
// 17/03/2018 | Don Junior      | Exemplo Bloco de Código - AEVAL().
//            |                 | Apostila Página 203.
// -----------+-----------------+-----------------------------------------------------------
// 17/03/2018 | Observação:     | Fonte apresentando erro de sintaxe na linha 36.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN203()

	Local nX
	Local cTimeForIni
	Local cTimeForFim
	Local cTimeAEvIni
	Local cTimeAEvFim
	Local aCampos     := {}
	Local aTitulos    := {}
	
	AADD(aCampos,"A1_FILIAL")
	AADD(aCampos,"A1_COD")

	// Exemplo AEval
	cTimeAEvIni := Time()
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	SX3->(DbGoTop())

/* // Syntax Error 	
	AEval(aCampos,{|X|SX3->(DbSeek(X)),IIf(Found(),AADD(aTitulos,AllTrim(SX3->X3_TITULO);
	                                                    );
	                                       ) ;
	              };
	     );
*/	
	
	cTimeAEvFim := Time()
	MsgInfo("Tamanho de aCampos pelo AEVAL " + cValToChar(Len(aCampos)))
	MsgInfo("Tamanho de aTitulos pelo AEVAL " + cValToChar(Len(aTitulos)))
	MsgInfo("Tempo do AEval " + ElapTime(cTimeAEvIni,cTimeAEvFim) )


	// Comparando desempenho do AEval com For
	cTimeForIni := Time()
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	SX3->(DbGoTop())
	
	For nX := 1 To Len(aCampos)
		If(SX3->(DbSeek(aCampos[nX])))
			AADD(aTitulos,AllTrim(SX3->X3_TITULO))
		EndIf
	Next nX
	cTimeForFim := Time()
	MsgInfo("Tamanho de aCampos pelo FOR " + cValToChar(Len(aCampos)))
	MsgInfo("Tamanho de aTitulos pelo FOR " + cValToChar(Len(aCampos)))
	MsgInfo("Tempo do FOR " + ElapTime(cTimeForIni,cTimeForFim) )


Return