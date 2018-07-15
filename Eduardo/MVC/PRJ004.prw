// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 10/04/2018 | Don Junior  	| Rotina MVC para cadastro de Notas
//            |                 | Projeto Final - Formação ADVPL
// -----------+-----------------+-----------------------------------------------------------

#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

User Function PRJ004()

	Private oBrowse
	Private aRotina   := MenuDef()
	Private cCadastro := 'Cadastro de Notas'
	
	oBrowse := FWMBrowse():New()
	
	oBrowse:SetAlias("ZZ5")
	oBrowse:SetDescription(cCadastro)

	//Legendas
	oBrowse:AddLegend("ZZ5_NOTA == 10"                   ,"BLUE"   ,"EXCELENTE")
	oBrowse:AddLegend("ZZ5_NOTA >= 7"                    ,"GREEN"  ,"BOM"      )
	oBrowse:AddLegend("ZZ5_NOTA >= 5 .And. ZZ5_NOTA < 7" ,"YELLOW" ,"REGULAR"  )
	oBrowse:AddLegend("ZZ5_NOTA < 5"                     ,"RED"    ,"RUIM"     )

	oBrowse:Activate()
	
Return

// -----------------------------------------------------------------------------------------
// Função de criação do menu
// -----------------------------------------------------------------------------------------
Static Function MenuDef()

	Local aRotina := {}

	// "ViewDef.PRJ004" = ViewDef + NOME DO FONTE
	ADD Option aRotina Title "Visualizar" Action "ViewDef.PRJ004" Operation 2 Access 0
    ADD Option aRotina Title "Incluir"    Action "U_PRJ004A"      Operation 3 Access 0 // "ViewDef.PRJ004"
	ADD Option aRotina Title "Alterar"    Action "ViewDef.PRJ004" Operation 4 Access 0
	ADD Option aRotina Title "Excluir"    Action "U_PRJ004C"      Operation 5 Access 0 // "ViewDef.PRJ004"
	ADD Option aRotina Title "Imprimir"   Action "ViewDef.PRJ004" Operation 8 Access 0
	ADD Option aRotina Title "Copiar"     Action "ViewDef.PRJ004" Operation 9 Access 0
	ADD OPTION aRotina Title 'Legenda'    Action 'U_PRJ004L'      Operation 7 Access 0

Return aRotina


// -----------------------------------------------------------------------------------------
// Função de criação da interface
// -----------------------------------------------------------------------------------------
Static Function ViewDef()
	
	Local oView
	Local oModel  := ModelDef()
	Local oStruct := FWFormStruct(2,"ZZ5")

	oView := FWFormView():New()
	
	oView:SetModel(oModel)
	
	oView:AddField("Form1",oStruct,"Field1")
	oView:CreateHorizontalBox("BoxForm1",100)
	oView:SetOwnerView("Form1","BoxForm1")
	
Return oView


// -----------------------------------------------------------------------------------------
// Função de criação do modelo de dados
// -----------------------------------------------------------------------------------------
Static Function ModelDef()

	Local oModel
	Local oStruct := FWFormStruct(1,"ZZ5")
	
    // Nome do fonte + M (Não pode ser o mesmo nome da User Function)
	oModel := MPFormModel():new("PRJ004M")
//  oModel := MPFormModel():New('PRJ004M',,{|oModel|PRJ004B(oModel)}) // Erro
//	oModel := MPFormModel():New('PRJ004M',,{||FWFORMCOMMIT(SELF)}) // Erro
	
	oModel:AddFields("Field1",,oStruct)
	
	oModel:SetDescription(cCadastro)

Return oModel


// -----------------------------------------------------------------------------------------
// Função de exclusão 
// -----------------------------------------------------------------------------------------
User Function PRJ004C()

	//AxExclui(cString,nReg,nOpc,,,,cVldAlt)

Return


// -----------------------------------------------------------------------------------------
// Função de montagem da tela de legenda (BrwLegenda) 
// -----------------------------------------------------------------------------------------
User Function PRJ004L()
	
	Local aLegenda := {}
	
	AADD(aLegenda,{'BR_AZUL'     ,'EXCELENTE'})
	AADD(aLegenda,{'BR_VERDE'    ,'BOM'      })
	AADD(aLegenda,{'BR_AMARELO'  ,'REGULAR'  })
	AADD(aLegenda,{'BR_VERMELHO' ,'RUIM  '   })

	BrwLegenda("Legenda",,aLegenda)
    
Return


// -----------------------------------------------------------------------------------------
// Função Incluir com validação (AxInclui)
// -----------------------------------------------------------------------------------------
User Function PRJ004A(cString,nReg,nOpc)

	Local cVldAlt := "U_PRJ004B()"

	AxInclui(cString,nReg,nOpc,,,,cVldAlt)

Return


// -----------------------------------------------------------------------------------------
// Validação de cadastro duplicado 
// -----------------------------------------------------------------------------------------
User Function PRJ004B()

	Local cQuery := ''

	cQuery  +="SELECT ZZ5_CDAVAL"
	cQuery  +="  FROM " + RetSqlName("ZZ5") + " ZZ5"
	cQuery  +=" WHERE ZZ5.ZZ5_FILIAL = '" + M->ZZ5_FILIAL  + "'"
	cQuery  +="   AND ZZ5.ZZ5_CDALUN = '" + M->ZZ5_CDALUN  + "'"
	cQuery  +="   AND ZZ5.ZZ5_CDAVAL = '" + M->ZZ5_CDAVAL  + "'"
	cQuery  +="   AND ZZ5.ZZ5_CDMAT  = '" + M->ZZ5_CDMAT   + "'"
	cQuery  +="   AND ZZ5.ZZ5_ANO    = "  + cValToChar(M->ZZ5_ANO) // CAMPO NUMÉRICO SEM ASPAS
	cQuery  +="   AND ZZ5.ZZ5_PERIOD = '" + M->ZZ5_PERIOD  + "'"
	cQuery  +="   AND ZZ5.D_E_L_E_T_ = ' ' "

	If Select("ARQZ5") > 0
		dbSelectArea("ARQZ5")
		ARQZ5->(DbCloseArea())
	EndIf

	cQuery := ChangeQuery(cQuery)
	dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery), "ARQZ5",.T.,.T.)

	If ARQZ5->(!Eof())
		MsgStop("Nota já registrada para este Aluno/Período")
		Return .F.
	EndIf

Return .T.