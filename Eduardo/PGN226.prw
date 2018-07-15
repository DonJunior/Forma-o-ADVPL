// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 01/04/2018 | Don Junior  	| Exemplo Enchoice
//            |                 | Apostila Página 226 
//            |                 | *** FONTE NÃO ABRE A SA2 - CÓDIGO INCOMPLETO ***
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN226()

	Local oDlg
	Local aSize     := {} 
	Local aObj      := {}
	Local aInfo     := {}
	Local cAliasSA2 := "SA2"

	 // Retorna a área útil da janela
	 aSize := MsAdvSize()
	
	// Enchoice dividida em 3 áreas em pixel
	AADD(aObj,{100,080,.T.,.F.})
	AADD(aObj,{100,100,.T.,.T.})
	AADD(aObj,{100,015,.T.,.F.})
	
	// Cálculo automático dos objetos (altura/largura) em pixel
	aInfo := {aSize[1],aSize[2],aSize[3],aSize[4],3,3}
	aObj  := MsObjSize(aInfo,aObj)
	
	oDlg := MsDialog():New(aSize[7],aSize[1],aSize[6],aSize[5],;
	        "MsDialog",,,,,CLR_BLACK,CLR_WHITE,,,.T.)
	        
	Enchoice(cAliasSE2,nReg,nOpc,,,,,aObj[1])
	
	oDlg:Activate(,,,.T.)
	
Return
