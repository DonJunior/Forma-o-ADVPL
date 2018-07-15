// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 05/04/2018 | Don Junior  	| MBrowse para cadastro de Notas
//            |                 | Projeto Final - Formação ADVPL
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PRJ004()

	Local cAliasZZ5   := 'ZZ5'
	Private aRotina   := {}
	Private cCadastro := 'Cadastro de Notas'

	AADD(aRotina,{"Pesquisar"          , "AxPesqui" ,0 ,1})
	AADD(aRotina,{"Visualizar"         , "AxVisual" ,0 ,2})
	AADD(aRotina,{"Incluir"            , "AxInclui" ,0 ,3})
	AADD(aRotina,{"Alterar"            , "AxAltera" ,0 ,4})
	AADD(aRotina,{"Excluir"            , "AxDeleta" ,0 ,5})
	AADD(aRotina,{"Relatório de Notas" , "U_PRJ006" ,0 ,6})

	DbSelectArea(cAliasZZ5)
	DbsetOrder(1)
	
	MBrowse(6,1,22,75,cAliasZZ5)
	
Return