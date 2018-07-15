// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 15/04/2018 | Don Junior  	| Exemplo de relatório com TReport
//            |                 | Apostila Página 304
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'
#include 'topconn.ch'

User Function PGN304()
	
	Local oReport
	
	oReport := PGN304A()
	oReport:PrintDialog()

Return

// -----------------------------------------------------------------------------------------
// Chamada da TReport e definições do relatório
// -----------------------------------------------------------------------------------------
Static Function PGN304A()

	Local oReport
	Local oSection1

	oReport := TReport():New("Exemplo1","Cadastro de Produtos",/* cPerg */,{|oReport|PGN304B(oReport)},"Relatório de Produtos")
	
	// Definição do layout no formato retrato
	oReport:SetPortrait()
	
	// Definição de totais em linha ou coluna
	oReport:SetTotalInLine(.F.)
	
	// Impressão da primeira seção
	oSection1 := TRSection():New(oReport,"Produtos",{"SB1"},,.F.,.T.)
	TRCell():New(oSection1,"B1_COD"    ,"SB1","Produto"   ,"@!",030)
	TRCell():New(oSection1,"B1_DESC"   ,"SB1","Descrição" ,"@!",100)
	TRCell():New(oSection1,"B1_LOCPAD" ,"SB1","Arm.Padrão","@!",020)
	TRCell():New(oSection1,"B1_POSPI"  ,"SB1","NCM"       ,"@!",030)

	// Impressão do totalizador
	TRFunction():New(oSection1:Cell("B1_COD"),,"COUNT",,,,,.F.,.T.)

Return(oReport)


// -----------------------------------------------------------------------------------------
// Executa query e carrega os dados na seção
// -----------------------------------------------------------------------------------------
Static Function PGN304B(oReport)
	
	Local cFiltro
	Local cAliasSB1 := GetNextAlias()
	Local oSection1 := oReport:Section(1)
	
	cFiltro := "%AND B1_COD >= '" + MV_PAR01 + "'"
	cFiltro := " AND B1_COD <= '" + MV_PAR02 + "'%"
	
	BeginSql Alias cAliasSB1
		SELECT B1_COD, B1_DESC, B1_LOCPAD, B1_POSIPI
		  FROM %Table:SB1% SB1
		 WHERE B1_FILIAL = %xFilial:SB1%
		   AND B1_MSBLQL <> 1
		   AND SB1.%NotDel%
//		  %Exp:cFiltro%
		ORDER BY B1_COD
	EndSql

	DbSelectArea(cAliasSB1)
	(cAliasSB1)->(DbGoTop())
	
	oReport:SetMeter((cAliasSB1)->(LastRec()))
	
	While !(cAliasSB1)->(EOF())
	
		If oReport:Cancel()
			Exit
		EndIf
		
		oReport:IncMeter()
		
		IncProc("Imprimindo " + AllTrim((cAliasSB1)->B1_DESC))
		
		// Inicializa a primeira seção
		oSection1:Init()
		
		// Impressão de dados da tabela na seção
		oSection1:Cell("B1_COD"):SetValue((cAliasSB1)->B1_COD)
		oSection1:Cell("B1_DESC"):SetValue((cAliasSB1)->B1_DESC)
		oSection1:Cell("B1_LOCPAD"):SetValue((cAliasSB1)->B1_LOCPAD)
		oSection1:Cell("B1_POSIPI"):SetValue((cAliasSB1)->B1_POSIPI)
		oSection1:PrintLine()
		
		(cAliasSB1)->(DbSkip())
		
		// Impressão de linha
		oReport:ThinLine()
	
	EndDo
	
	// finalizando a seção
	oSection1:Finish()
	
Return