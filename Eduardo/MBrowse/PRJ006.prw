// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 10/04/2018 | Don Junior  	| Relatório de Notas por Aluno 
//            |                 |
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'
#include 'topconn.ch'

User Function PRJ006()

	Local   aPeriodo := {}
	Local   cTexto1    := "Matricula:"
	Local   cTexto2    := "Período"
	Private cPeriodo   := Space(1)
	Private cMatricula := Space(10)
	Private cCadastro  := 'Relatório de Notas por Aluno'
	Private oPeriodo
	Private oMatricula
	
	AADD(aPeriodo,"1-Primeiro")
	AADD(aPeriodo,"2-Segundo")
	AADD(aPeriodo,"3-Terceiro")
	AADD(aPeriodo,"4-Quarto")
	
	
	DEFINE MSDIALOG oDlg TITLE cCadastro STYLE DS_MODALFRAME FROM 000,000 TO 200,350 PIXEL

	@ 001,001 TO 070, 177 OF oDlg PIXEL
	@ 010,010 SAY cTexto1 SIZE 55, 07 OF oDlg PIXEL
	@ 010,050 MSGET oMatricula Var cMatricula SIZE 55, 11 F3 "ZZ2" OF oDlg PIXEL

	@ 030,010 SAY cTexto2 SIZE 55, 07 OF oDlg PIXEL
//	@ 030,050 MSGET oPeriodo Var cPeriodo SIZE 55, 11 OF oDlg PIXEL PICTURE "@!"
	@ 030,050 COMBOBOX oPeriodo VAR cPeriodo ITEMS aPeriodo SIZE 55, 11 OF oDlg PIXEL

	DEFINE SBUTTON FROM 080, 060 TYPE 1 ACTION PRJ006B() ENABLE OF oDlg
	DEFINE SBUTTON FROM 080, 100 TYPE 2 ACTION PRJ006C() ENABLE OF oDlg

	ACTIVATE MSDIALOG oDlg CENTERED

Return

//-------------------------------
// Chamada impressão relatório 
//-------------------------------
Static Function PRJ006B()

	Local nLin
	Local cQuery   := ''
	Private oPrint
	Private oFontLin
	Private oFontCab

	cQuery  += "SELECT ZZ5_CDALUN, ZZ2_NOME, ZZ4_DESCR, ZZ3_NOME, ZZ5_NOTA, ZZ5_ANO, ZZ5_PERIOD "
	cQuery  += "FROM " + RetSqlName("ZZ2") + " ZZ2, " 
	cQuery  += RetSqlName("ZZ3") + " ZZ3, "  
	cQuery  += RetSqlName("ZZ4") + " ZZ4, "
	cQuery  += RetSqlName("ZZ5") + " ZZ5 "
	cQuery  += "WHERE ZZ2.D_E_L_E_T_ = ' ' "
	cQuery  += "AND ZZ3.D_E_L_E_T_   = ' ' "
	cQuery  += "AND ZZ4.D_E_L_E_T_   = ' ' "
	cQuery  += "AND ZZ5.D_E_L_E_T_   = ' ' "
	cQuery  += "AND ZZ5.ZZ5_CDALUN   = '" + cMatricula  + "'"
	cQuery  += "AND ZZ5.ZZ5_PERIOD   = '" + SubStr(cPeriodo,1,1)  + "'"
	cQuery  += "AND ZZ2.ZZ2_CDALUN   = ZZ5.ZZ5_CDALUN "
	cQuery  += "AND ZZ3.ZZ3_CDMAT    = ZZ5.ZZ5_CDMAT "
	cQuery  += "AND ZZ4.ZZ4_CDAVAL   = ZZ5.ZZ5_CDAVAL "
	cQuery  += "ORDER BY ZZ4.ZZ4_DESCR "

	If Select("ARQZ5") > 0
		dbSelectArea("ARQZ5")
		ARQZ5->(DbCloseArea())
	EndIf

	cQuery := ChangeQuery(cQuery)
	dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery), "ARQZ5",.T.,.T.)

	oPrint := FWMsPrinter():New('PRJ006')
	oPrint:StartPage()

	oFontLin := TFont():New( 'Arial', 12,12,,.F.,,,,.T.,.F.)
	oFontCab := TFont():New( 'Arial', 12,24,,.F.,,,,.T.,.F.)

	// Cabeçalho do relatório
	oPrint:Say(110, 010, Space(60) + cCadastro, oFontCab)
	oPrint:Say(140, 010, Replicate("-", 140), oFontCab)

	// Detalhes do relatório
	nLin := 200
	oPrint:Say(nLin, 0010, "MATRÍCULA" , oFontLin)
	oPrint:Say(nLin, 0180, "ALUNO"     , oFontLin)
	oPrint:Say(nLin, 0500, "AVALIAÇÃO" , oFontLin)
    oPrint:Say(nLin, 0690, "MATÉRIA"   , oFontLin)
    oPrint:Say(nLin, 0900, "NOTA"      , oFontLin)
    oPrint:Say(nLin, 1000, "ANO"       , oFontLin)
    oPrint:Say(nLin, 1200, "PERÍODO"   , oFontLin)		
	
	// Linha
	oPrint:Line(nLin += 10 , 010 , nLin , 2000)
 
	ARQZ5->(DbGoTop())
	nLin += 30
	While !ARQZ5->(EOF())
		oPrint:Say(nLin, 0010, ARQZ5->ZZ5_CDALUN          , oFontLin)
		oPrint:Say(nLin, 0180, ARQZ5->ZZ2_NOME            , oFontLin)
		oPrint:Say(nLin, 0500, ARQZ5->ZZ4_DESCR           , oFontLin)
		oPrint:Say(nLin, 0690, ARQZ5->ZZ3_NOME            , oFontLin)
		oPrint:Say(nLin, 0900, Transform(ARQZ5->ZZ5_NOTA,"@E 99,99"), oFontLin)
		oPrint:Say(nLin, 1000, cValToChar(ARQZ5->ZZ5_ANO) , oFontLin)
		oPrint:Say(nLin, 1200, ARQZ5->ZZ5_PERIOD          , oFontLin)		
		nLin += 30
		ARQZ5->(DbSkip())
	EndDo

	oPrint:EndPage()
	oPrint:Preview()
	
	oDlg:End()
	
Return

//-------------------------------
// Botão Cancelar 
//-------------------------------
Static Function PRJ006C()

	oDlg:End()
	
Return