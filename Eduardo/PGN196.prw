// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Carvalho	| Exemplo Array de Arrays (Matriz).
//            |                 | Apostila Página 196.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

#define FUNCT_NAME 1
#define FUNCT_IDADE 2
#define FUNCT_CASADO 3

User Function PGN196()
	
	Local nCount
	Local aFuncts := {}
	Local aFunct1 := {"Pedro",32,.T.}
	Local aFunct2 := {"Maria",22,.T.}
	Local aFunct3 := {"Antônio",42,.F.}
	
	// aFuncts := {{"Pedro",32,.T.},{"Maria",22,.T.},{"Antônio",42,.F.}}
	aFuncts := {aFunct1,aFunct2,aFunct3} // Equivalente a linha anterior
	
	For nCount := 1 To Len(aFuncts)
		MsgInfo(aFuncts[nCount][FUNCT_NAME])
	Next nCount

Return