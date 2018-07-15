SS// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 12/04/2018 | Don Junior  	| Exemplo de TReport
//            |                 |
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'
#include 'topconn.ch'

User Function TNMT014()

	Local oBreak
	Local oReport
	Local oSection
	Local oFunction
	Local cCadastro   := "Cadastro Vendedores"
	Private cPergunta := 'TNMT014'

	oReport := TReport():New("TNMT014",cCadastro,cPergunta,{|oReport| ReportPrint(oReport )},cCadastro)

	// Relatorio em retrato
	oReport:SetPortrait()

	// Define se os totalizadores serão impressos em linha ou coluna
	oReport:SetTotalInLine(.T.)
	
	// Habilita ou não a página de parâmetros
	oReport:lParamPage := .T.

	//Monstando a primeira seção
	oSection1:= TRSection():New(oReport,"Vendedores",{"SA3"},,.F.,.T.)

	TRCell():New(oSection1, "A3_COD"    , "SA3", "CÓDIGO"   , "@!"       , 06 )
	TRCell():New(oSection1, "A3_NOME"   , "SA3", "NOME"     , "@!"       , 40 )
	TRCell():New(oSection1, "A3_END"    , "SA3", "ENDEREÇO" , "@!"       , 40 )
	TRCell():New(oSection1, "A3_BAIRRO" , "SA3", "BAIRRO"   , "@!"       , 20 )
	TRCell():New(oSection1, "A3_COMISS" , "SA3", "COMISSÃO" , "@E 999.99", 10 )

	TRFunction():New(oSection1:Cell("A3_COD"),,"COUNT",,,,,.F.,.T.)

	oReport:PrintDialog()
	
Return

//-------------------------------
// Impressão dos dados 
//-------------------------------
Static Function ReportPrint(oReport)

	Local cNcm      := ""
	Local cQuery    := ""
	Local lPrim     := .T.
	Local cAliaSA3  := GetNextAlias()
	Local oSection1 := oReport:Section(1)
	
	cQuery  += "SELECT A3_COD,A3_NOME,A3_END,A3_BAIRRO, A3_COMISS "
	cQuery  += "FROM " + RetSqlName("SA3") + " SA3 " 
	cQuery  += "WHERE SA3.D_E_L_E_T_ = ' ' "
	cQuery  += "AND SA3.A3_FILIAL    = '" + xfilial("SA3") + "'"
	cQuery  += "AND SA3.A3_COD       = '" + MV_PAR01 + "' "
	cQuery  += "AND SA3.A3_COD       = '" + MV_PAR01 + "' "
	cQuery  += "ORDER BY SA3.A3_COD "

	If Select("ARQA3") > 0
		dbSelectArea("ARQA3")
		ARQA3->(DbCloseArea())
	EndIf

	cQuery := ChangeQuery(cQuery)
	dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery), "ARQA3",.T.,.T.)

	DbSelectArea(ARQA3)
	ARQA3->(DbGoTop())

	oReport:SetMeter(ARQA3->(LastRec()))

	While !ARQA3->(EOF())
		If oReport:Cancel()
			Exit
		EndIf
		
		oReport:IncMeter()
		IncProc("Imprimindo " + AllTrim(ARQA3->B1_DESC))

		oSection1:Init()

		oSection1:Cell("A3_COD"):SetValue(ARQA3->A3_COD )
		oSection1:Cell("A3_NOME"):SetValue(ARQA3->A3_NOME )
		oSection1:Cell("A3_END"):SetValue(ARQA3->A3_END )
		oSection1:Cell("A3_BAIRRO"):SetValue(ARQA3->A3_BAIRRO)
		oSection1:Cell("A3_COMISS"):SetValue(ARQA3->A3_COMISS)
		oSection1:Printline()

		ARQA3->(dbSkip())
	Enddo

	oSection1:Finish()

Return
