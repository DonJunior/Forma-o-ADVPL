// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 08/04/2018 | Don Junior  	| Exemplo TcGenQry - Executa uma query
//            |                 | diretamente no banco de dados ativo
//            |                 | Apostila Página 237
//            |                 | *** CÓDIGO INCOMPLETO ***
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'
#include 'topconn.ch'

User Function PGN237()

	Local cSql      := ""
	Local cAliasFor := GetNextAlias()

	cSql += "SELECT SA2.A2_COD, SA2.A2_LOJA, SA2.A2_NREDUZ, SA2.A2_EST, SA2.A2_MSBLQL "
	cSql += "FROM " + RetSqlName("SA2") + " SA2 "
	cSql += "WHERE SA2.A2_FILIAL = '" + xFilial("SA2") + "' "
	cSql += "AND SA2.D_E_L_E_T_ = ' '"
	
	cSql := ChangeQuery(cSql)
	
	TcQuery(cSql) Alias(cAliasSql)New
	DbUseArea(.T.,"TopConn",TcGenQry(,,cSql),(cAliasFor),.F.,.T.)
	
Return