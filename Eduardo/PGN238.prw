// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 08/04/2018 | Don Junior  	| Exemplo Embedded SQL
//            |                 | Apostila Página 238
//            |                 | *** CÓDIGO INCOMPLETO ***
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'
#include 'topconn.ch'

User Function PGN238()

	Local cAliasPrd := GetNextAlias()

	BeginSql Alias cAliasPrd
		Column D1_QUANT As Nuneric(12,2)
		Column D1_EMISSAO As Date
		%NoParser%
		Select D1_DOC
			   D1_FORNECE
			   D1_LOJA
                           D1_SERIE
                           D1_QUANT
                           D1_ITEM
                           D1_EMISSAO
                WHERE D1_FILIAL       = %xFilial:SD1%
                      AND D1_EMISSAO = %Exp:pDataDe%
                      AND D1_EMISSAO = %Exp:pDataAte%
                      AND %NotDel%
	EndSql
	
Return