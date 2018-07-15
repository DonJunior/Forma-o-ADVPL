// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 26/03/2018 | Don Junior  	| Exemplo MBrowse tabela SA3 (Cadastro de vendedores)
// 27/03/2018 | Don Junior  	| Rotina customizada para inclusão e alteração
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function d

	Local cAliasSA3   := 'SA3'
	Private nOpcao    := 0
	Private aRotina   := {}
	Private cCadastro := 'Cadastro de Vendedores'

	AADD(aRotina,{"Pesquisar"  , "AxPesqui"      ,0 ,1})
	AADD(aRotina,{"Visualizar" , "AxVisual"      ,0 ,2})
	AADD(aRotina,{"Incluir"    , "U_TNMT010A(1)" ,0 ,3})
	AADD(aRotina,{"Editar"     , "U_TNMT010A(2)" ,0 ,4})
	AADD(aRotina,{"Excluir"    , "AxDeleta"      ,0 ,5})

	DbSelectArea(cAliasSA3)
	DbsetOrder(1)

	MBrowse(6,1,22,75,cAliasSA3)

Return

//--------------------------------------------------
// Tela de Inclusão/Alteração
//--------------------------------------------------
User Function TNMT010A(nOpc)

	Local cTexto1   := "Nome:"
	Local cTexto2   := "Endereço"
	Local cTexto3   := "Bairro"

	Private nOpcao
	Private oEnder
	Private oBairro
	Private oNmVend
	Private cNmVend := ""
	Private cEnder  := ""
	Private cBairro := ""
	
	nOpcao := nOpc

	If nOpcao == 2
		cNmVend := SA3->A3_COD
		cEnder  := SA3->A3_END
		cBairro := SA3->A3_BAIRRO
	Else
		cNmVend := GetSxeNum("SA3","A3_COD")
		cEnder  := CriaVar("A3_END", .T.)
		cBairro := Space(TamSX3("A3_BAIRRO")[1])
	EndIf

	DEFINE MSDIALOG oDlg TITLE cCadastro STYLE DS_MODALFRAME FROM 000,000 TO 200,350 PIXEL

	@ 001,001 TO 070, 177 OF oDlg PIXEL
	@ 010,010 SAY cTexto1 SIZE 55, 07 OF oDlg PIXEL
	@ 010,050 MSGET oNmVend Var cNmVend SIZE 55, 11 OF oDlg PIXEL When nOpcao == 1

	@ 030,010 SAY cTexto2 SIZE 55, 07 OF oDlg PIXEL
	@ 030,050 MSGET oEnder Var cEnder SIZE 55, 11 OF oDlg PIXEL PICTURE "@!"

	@ 050,010 SAY cTexto3 SIZE 55, 07 OF oDlg PIXEL
	@ 050,050 MSGET oBairro Var cBairro SIZE 55, 11 OF oDlg PIXEL PICTURE "@!"
	
	DEFINE SBUTTON FROM 080, 060 TYPE 1 ACTION TNMT010B() ENABLE OF oDlg
	DEFINE SBUTTON FROM 080, 100 TYPE 2 ACTION TNMT010C() ENABLE OF oDlg

	ACTIVATE MSDIALOG oDlg CENTERED

Return


//-------------------------------
// Chamada Inclusão/Alteração 
//-------------------------------
Static Function TNMT010B()

	If nOpcao == 1 //Inclui
		// Controle de lock da tabela
		While !RecLock("SA3",.T.)
		EndDo
		SA3->A3_COD := cNmVend
	ElseIf nOpcao == 2 // Alteração
		While !RecLock("SA3",.F.)
		EndDo
	EndIf
	
	SA3->A3_END    := cEnder
	SA3->A3_BAIRRO := cBairro
	SA3->(MsUnlock())
	
	ConfirmSX8()
	
	oDlg:End()
	
Return

//-------------------------------
// Botão Cancelar + Rollback 
//-------------------------------
Static Function TNMT010C()

	RollBackSXE()
	oDlg:End()
	
Return