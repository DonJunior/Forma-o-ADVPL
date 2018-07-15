// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 05/04/2018 | Don Junior  	| MBrowse para cadastro de Professores
//            |                 | Projeto Final - Formação ADVPL
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'


User Function PRJ005()

	Local cAliasZZ6   := 'ZZ6'
	Private aRotina   := {}
	Private cCadastro := 'Cadastro de Professores'

	AADD(aRotina,{"Pesquisar"  , "AxPesqui" ,0 ,1})
	AADD(aRotina,{"Visualizar" , "AxVisual" ,0 ,2})
	AADD(aRotina,{"Incluir"    , "AxInclui" ,0 ,3})
	AADD(aRotina,{"Alterar"    , "AxAltera" ,0 ,4})
	AADD(aRotina,{"Excluir"    , "AxDeleta" ,0 ,5})

	DbSelectArea(cAliasZZ6)
	DbsetOrder(1)
	
	MBrowse(6,1,22,75,cAliasZZ6)
	
Return