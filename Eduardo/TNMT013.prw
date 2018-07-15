// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/04/2018 | Don Junior  	| Exemplo FWMsPrinter() - Geração de relatórios
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

	// Cabeçalho do relatório
	oPrint:Say(nLin, 003, Replicate("-", 80), oFontCab)
	oPrint:Say(nLin, 003, "|" + Space(26) + " Relatório de Vendedores " + Space(26) + "|", oFontCab)
	oPrint:Say(nLin, 003, Replicate("-", 80), oFontCab)

	// Detalhes do relatório
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

