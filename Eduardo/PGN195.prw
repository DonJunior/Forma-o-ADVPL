// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data:      | Autor:          | Descrição:
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Junior      | Exemplo ARRAY como estrutura.
//            |                 | Apostila Página 195.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

#define FUNCT_NAME 1
#define FUNCT_IDADE 2
#define FUNCT_CASADO 3

User Function PGN195()
	
	Local aFunct1 := {"Pedro",32,.T.}
	Local aFunct2 := {"Maria",22,.T.}
	Local aFunct3 := {"Antônio",42,.F.}

	Alert(aFunct1[FUNCT_NAME])
	Alert(aFunct2[FUNCT_NAME])
	Alert(aFunct3[FUNCT_NAME])

Return