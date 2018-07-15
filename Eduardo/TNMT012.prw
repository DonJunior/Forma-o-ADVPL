// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 02/04/2018 | Don Junior  	| Exemplo fonte MVC
//            |                 | 
// -----------+-----------------+-----------------------------------------------------------

#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

User Function TNMT012()

	Private oBrowse
	Private aRotina  := MenuDef()
	Private cCadastro := "CADASTRO VENDEDOR"
	
	oBrowse := FWMBrowse():New()
	
	oBrowse:SetAlias("SA3")
	oBrowse:SetDescription(cCadastro)
	oBrowse:Activate()
	
Return

//----------------------------------------
// Função de criação do menu
//----------------------------------------
Static Function MenuDef()

	Local aRotina := {}

	// "ViewDef.TNMT012" = ViewDef + NOME DO FONTE
	ADD Option aRotina Title "Visualizar" Action "ViewDef.TNMT012" Operation 2 Access 0
	ADD Option aRotina Title "Incluir"    Action "ViewDef.TNMT012" Operation 3 Access 0
	ADD Option aRotina Title "Alterar"    Action "ViewDef.TNMT012" Operation 4 Access 0
	ADD Option aRotina Title "Excluir"    Action "ViewDef.TNMT012" Operation 5 Access 0
	ADD Option aRotina Title "Imprimir"   Action "ViewDef.TNMT012" Operation 8 Access 0
	ADD Option aRotina Title "Copiar"     Action "ViewDef.TNMT012" Operation 9 Access 0

Return aRotina


//----------------------------------------
// Função de criação da interface
//----------------------------------------
Static Function ViewDef()
	
	Local oView
	Local oModel  := ModelDef()
	Local oStruct := FWFormStruct(2,"SA3")

	oView := FWFormView():New()
	
	oView:SetModel(oModel)
	
	oView:AddField("Form1",oStruct,"Field1")
	oView:CreateHorizontalBox("BoxForm1",100)
	oView:SetOwnerView("Form1","BoxForm1")
	
Return oView


//----------------------------------------
// Função de criação do modelo de dados
//----------------------------------------
Static Function ModelDef()

	Local oModel
	Local oStruct := FWFormStruct(1,"SA3")
	
	oModel := MPFormModel():new("TNMT012M") // Nome do fonte + M (Não pode ser o mesmo nome da User Function)
	oModel:AddFields("Field1",,oStruct)
	
	oModel:SetDescription(cCadastro)

Return oModel




















