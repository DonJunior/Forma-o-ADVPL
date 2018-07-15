// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 08/04/2018 | Don Junior  	| Exemplo fonte MVC
//            |                 | Apostila Página 246
// -----------+-----------------+-----------------------------------------------------------

#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

User Function PGN246()

	Private oBrowse
	Private aRotina  := MenuDef()
	Private cCadastro := "CADASTRO VENDEDOR"
	
	oBrowse := FWMBrowse():New()
	
	oBrowse:SetAlias("SA3")
	oBrowse:SetDeion(cCadastro)
	oBrowse:Activate()
	
Return

// ----------------------------------------------------------------------------------------------------------------------------------------------------
// Função de criação do menu
// ----------------------------------------------------------------------------------------------------------------------------------------------------
Static Function MenuDef()

	Local aRotina := {}

	// "ViewDef.TNMT012" = ViewDef + NOME DO FONTE
	ADD Option aRotina Title "Visualizar" Action "ViewDef.PGN246" Operation 2 Access 0
	ADD Option aRotina Title "Incluir"    Action "ViewDef.PGN246" Operation 3 Access 0
	ADD Option aRotina Title "Alterar"    Action "ViewDef.PGN246" Operation 4 Access 0
	ADD Option aRotina Title "Excluir"    Action "ViewDef.PGN246" Operation 5 Access 0
	ADD Option aRotina Title "Imprimir"   Action "ViewDef.PGN246" Operation 8 Access 0
	ADD Option aRotina Title "Copiar"     Action "ViewDef.PGN246" Operation 9 Access 0

//	aRotina := FWLoadMenuDef(PGN246) // Retorna um menu já existente (PGN246 = nome do outro fonte)


Return aRotina


//----------------------------------------
// Função de criação do modelo de dados
//----------------------------------------
Static Function ModelDef()

	Local oModel
	Local oStruct := FWFormStruct(1,"SA3")
	
	oModel := MPFormModel():new("PGN246MD") // Nome do fonte + MD (Não pode ser o mesmo nome da User Function)
//	oModel := FWLoadView(PGN246) // Retorna uma view já existente (PGN246  = nome do outro fonte)


	oModel:AddFields("Field1",,oStruct)
	
	oModel:SetDeion(cCadastro)

Return oModel


//----------------------------------------
// Função de criação da interface
//----------------------------------------
Static Function ViewDef()
	
	Local oView
	Local oModel  := ModelDef()
	Local oStruct := FWFormStruct(2,"SA3")
	
	oView := FWFormView():New()

//	oView := FWLoadView(PGN246) // Retorna uma view já existente (PGN246 = nome do outro fonte)
	
	oView:SetModel(oModel)
	
	oView:AddField("Form1",oStruct,"Field1")
	oView:CreateHorizontalBox("BoxForm1",100)
	oView:SetOwnerView("Form1","BoxForm1")
	
Return oView


