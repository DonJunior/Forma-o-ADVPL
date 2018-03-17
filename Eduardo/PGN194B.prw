// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data:      | Autor:          | Descrição:
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Junior      | Exemplo ARRAY.
//            |                 | Apostila Página 194/195 (Item 7.4.1).
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN194B()
	
	Local aLetras := {"A","B","C"}
	
	MsgInfo("Letra " + aLetras[2]) // Exibe segundo elemento
	MsgInfo("Tamanho do Array " + cValToChar(Len(aLetras)))
	
	AADD(aLetras,"D") // Adicionando um elemento ao array

	MsgInfo("Novo Tamanho do Array " + cValToChar(Len(aLetras)))

Return