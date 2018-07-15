// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/04/2018 | Don Junior  	| Exemplo FWMsPrinter() - Gera��o de relat�rios
//            |                 | 
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function TNMT013()

	Private nLin
	Private oPrint
	Private oFontLin
	Private oFontCab

	oPrint := FWMsPrinter():New('TNMT013')
	oPrint:StartPage()

	nLin     := 30
	oFontLin := TFont():New( 'Arial', 12,12,,.F.,,,,.T.,.F.)
	oFontCab := TFont():New( 'Arial', 12,18,,.F.,,,,.T.,.F.)

	// Cabe�alho do relat�rio
	oPrint:Say(nLin, 003, Replicate("-", 80), oFontCab)
	oPrint:Say(nLin, 003, "|" + Space(26) + " Relat�rio de Vendedores " + Space(26) + "|", oFontCab)
	oPrint:Say(nLin, 003, Replicate("-", 80), oFontCab)

	// Detalhes do relat�rio
	SA3->(DbGoTop())
	nLin += 50
	While !SA3->(EOF())
		oPrint:Say(nLin, 010, SA3->A3_NOME, oFontLin)
		oPrint:Say(nLin, 300, SA3->A3_BAIRRO, oFontLin)
		nLin += 30
		SA3->(DbSkip())
	EndDo

	oPrint:EndPage()
	oPrint:Preview()

Return

