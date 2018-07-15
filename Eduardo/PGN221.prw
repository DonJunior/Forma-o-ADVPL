// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 26/03/2018 | Don Junior  	| Exemplo MBrowse
//            |                 | Apostila Página 221
// -----------+-----------------+-----------------------------------------------------------

#include 'totvs.ch'

#Define CLRF Chr(13) + Chr(10)

User Function PGN221()

	Local cAliasSA2 := 'SA2'
	Private ctitulo := 'Cadastro de Fornecedores'
	Private aRotina := {}

	AADD(aRotina,{"Pesquisar"  , "AxPesqui" ,0 ,1})
	AADD(aRotina,{"Visualizar" , "AxVisu"   ,0 ,2})
	AADD(aRotina,{"Incluir"    , "AxInclui" ,0 ,3})
	AADD(aRotina,{"Alterar"    , "AxAltera" ,0 ,4})
	AADD(aRotina,{"Excluir"    , "AxDeleta" ,0 ,5})

	DbSelectArea(cAliasSA2)
	DbsetOrder(1)
	
	MBrowse(6,1,22,75,cAliasSA2)
	
Return