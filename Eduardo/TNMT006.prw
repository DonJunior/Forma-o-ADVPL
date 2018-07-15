// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 21/03/2018 | Don Junior  	| Exemplo aSort() e aScan() 
//            |                 | Funções para manupulação de Array.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function TNMT006()

	Local aAlunos 
	Local aTurma
	Local aClasse
	Local aRegistro := {}

	// formata a data para DD/MM/AA
	Set Date To British

	aAlunos := {'Thiago','Edson','Don'}
	aSort(aAlunos)

	aTurma := aAlunos
	aTurma[2] := 'Marcelo'

	aClasse := aClone(aAlunos)
	aClasse[3] := 'João'

	AADD(aRegistro,{'João',32,CToD('21/02/1970')})
	AADD(aRegistro,{'Maria',12,CToD('17/06/1954')})
	AADD(aRegistro,{'Paulo',30,CToD('12/12/1984')})

	nPos := AScan(aRegistro, { |cNome| cNome[1] == 'Paulo'})

Return