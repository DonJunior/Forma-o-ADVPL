// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 11/04/2018 | Don Junior  	| Exemplo de TReport
//            |                 |
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'
#include 'topconn.ch'

User Function PRJ007()

	Local oReport

	oReport := PRJ007A()
	oReport:PrintDialog()
	
Return

//-------------------------------
// Chamada função TReport 
//-------------------------------
Static Function PRJ007A()

	Local oReport := Nil
	Local oSection1:= Nil
	Local oBreak
	Local oFunction

	Private cPergunta := 'RCOMR01'

	oReport:= TReport():New("Exemplo01", "Cadastro Produtos", cPergunta ,; 
	{|oReport| ReportPrint(oReport ) }, "Descrição do meu relatório")

	// Relatorio em retrato
	oReport:SetPortrait()

	// Define se os totalizadores serão impressos em linha ou coluna
	oReport:SetTotalInLine(.T.)
	oReport:lParamPage := .F. // Habilita ou não a página de parâmetros

	//Monstando a primeira seção
	oSection1:= TRSection():New(oReport, "Produtos", {"SB1"}, NIL, .F., .T.)

	TRCell():New(oSection1, "B1_COD" ,		"SB1",	"Produto" ,		"@!", 30 )
	TRCell():New(oSection1, "B1_DESC" ,		"SB1",	"Descrição",	"@!", 100)
	TRCell():New(oSection1, "B1_LOCPAD" ,	"SB1",	"Arm.Padrao" ,	"@!", 20 )
	TRCell():New(oSection1, "B1_PRV1" ,		"SB1",	"Preço" ,		"@e 999,999.99", 30 )

	TRFunction():New(oSection1:Cell("B1_COD"),NIL,"COUNT",,,,,.F.,.T.)
	
Return(oReport)

//-------------------------------
// Impressão dos dados 
//-------------------------------
Static Function ReportPrint(oReport)

	Local oSection1 := oReport:Section(1)
	Local cQuery := ""
	Local cNcm := ""

	Local lPrim := .T.
	Local cAlias := GetNextAlias()

	cPart := "% AND B1_COD >= '" + MV_PAR01 + "' "
	cPart += " AND B1_COD <= '" + MV_PAR02 + "' %"

	BeginSql alias cAlias
		SELECT B1_COD,B1_DESC,B1_LOCPAD,B1_PRV1
		FROM %table:SB1% SB1
		WHERE B1_FILIAL = %xfilial:SB1%
		AND B1_MSBLQL <> '1'
		AND SB1.%notDel%
		%exp:cPart%
		ORDER BY B1_COD
	EndSql

	dbSelectArea(cAlias)
	(cAlias)->(dbGoTop())

	oReport:SetMeter((cAlias)->(LastRec()))

	While !(cAlias)->( EOF() )
		If oReport:Cancel()
			Exit
		EndIf
		oReport:IncMeter()
		IncProc("Imprimindo " + alltrim((cAlias)->B1_DESC))

		oSection1:Init()

		oSection1:Cell("B1_COD" ):SetValue((cAlias)->B1_COD )
		oSection1:Cell("B1_DESC" ):SetValue((cAlias)->B1_DESC )
		oSection1:Cell("B1_LOCPAD"):SetValue((cAlias)->B1_LOCPAD )
		oSection1:Cell("B1_PRV1"):SetValue((cAlias)->B1_PRV1)
		oSection1:Printline()

		(cAlias)->(dbSkip())
	Enddo

	oSection1:Finish()

Return
