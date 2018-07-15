// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 05/04/2018 | Don Junior  	| MBrowse para cadastro de alunos
//            |                 | Projeto Final - Formação ADVPL
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PRJ001()

	Local cAliasZZ2   := 'ZZ2'
	Private aRotina   := {}
	Private cCadastro := 'Cadastro de Alunos'

	AADD(aRotina,{"Pesquisar"  , "AxPesqui" ,0 ,1})
	AADD(aRotina,{"Visualizar" , "AxVisual" ,0 ,2})
	AADD(aRotina,{"Incluir"    , "AxInclui" ,0 ,3})
	AADD(aRotina,{"Alterar"    , "AxAltera" ,0 ,4})
	AADD(aRotina,{"Excluir"    , "AxDeleta" ,0 ,5})

	DbSelectArea(cAliasZZ2)
	DbsetOrder(1)
	
	MBrowse(6,1,22,75,cAliasZZ2)
	
Return