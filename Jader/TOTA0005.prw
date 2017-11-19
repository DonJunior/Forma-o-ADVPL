#Include 'Protheus.ch'

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/08/2017 | Don Carvalho	| Exemplo de manipulação de dados do Array
//		      |                 | 
// -----------+-----------------+-----------------------------------------------------------
User Function TOTA0005()

	Local aPais := {}
	Local nI    := 0
	Local nVal  := 0
	Local cPais 
	
	AADD(aPais,{"Brasil"    ,45.3})
	AADD(aPais,{"Argentina" ,39.8})
	AADD(aPais,{"Colombia"  ,17.1})
	AADD(aPais,{"Paraguai"  ,41  })
	AADD(aPais,{"Equador"   ,19.4})
	
	For nI := 1 To Len(aPais)

		If aPais[nI][2] > nVal
			nVal  := aPais[nI][2]
			cPais := aPais[nI][1]
		EndIf
					
	Next nI

	Alert(cPais+ " " + cValToChar(nVal))

Return

