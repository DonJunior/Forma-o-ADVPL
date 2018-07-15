// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data:      | Autor:          | Descrição:
// -----------+-----------------+-----------------------------------------------------------
// 18/03/2018 | Don Junior      | Exemplo AxCadastro.
//            |                 | Apostila Página 220.
// -----------+-----------------+-----------------------------------------------------------
// 18/03/2018 | Observação:     | Fonte apresentando erro type mismatch nos botões Incluir
//            |                 | e Alterar por conta das variáveis cVldExc e cVldAlt; como
//            |                 | solução paleativa, ambas foram comentadas (linha 28).
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN220()

	Local cVldExc := .T.
	Local cVldAlt := .T.
	Local cAlias  := "SA2"
	Local cTitulo := "Cadastro de Fornecedor"
	
	DbSelectArea("SA2")
	SE2->(DbSetOrder(1))
	
	AxCadastro(cAlias,cTitulo,/* cVldExc */,/* cVldAlt */)

Return