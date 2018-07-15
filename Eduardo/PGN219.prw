// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data:      | Autor:          | Descrição:
// -----------+-----------------+-----------------------------------------------------------
// 17/03/2018 | Don Junior      | Exemplo MsDialog.
//            |                 | Apostila Página 219.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN219()

	Local cTitulo := "Busca por Fornecedor"
	Local cTexto  := "Informe o CGC"
	Private cCgc  := Space(18)
	
	Define MsDialog oDlg Title cTitulo From 000,000 To 080,300 Pixel
	@001,001 To 040,150 Of oDlg Pixel
	@010,010 Say cTexto Size 55, 07 Of oDlg Pixel
	@010,050 MsGet cCgc Size 55, 11 Of oDlg Pixel Picture "@R 99.999.999/9999-99" Valid !Vazio()
	
	Define SButton From 010,120 Type 1 Action(PGN219A()) Enable Of oDlg
	Define SButton From 025,120 Type 2 Action(oDlg:End()) Enable Of oDlg
	
	Activate MsDialog oDlg Centered

Return

Static Function PGN219A()

	If CGC(cCgc)
		MsgInfo("CGC: " + Transform(cCgc,"@R 99.999.999/9999-99" + " Válido!"))
		cCgc := Space(18)
	EndIf

Return