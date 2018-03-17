// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data:      | Autor:          | Descrição:
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Junior      | Exemplo CASE.
//            |                 | Apostila Página 194
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN194A()
	
	Local nMes     := 11 // Month(Date())
	Local cPeriodo := ""
	
	Do Case
		Case nMes <= 3
		cPeriodo := "Primeiro Trimeste"
		Case nMes <= 6
		cPeriodo := "Segundo Trimeste"
		Case nMes <= 9
		cPeriodo := "Terceiro Trimeste"
	OtherWise
		cPeriodo := "Quarto Trimeste"
	EndCase
	
	MsgInfo("Estamos no " + cPeriodo)
	
Return