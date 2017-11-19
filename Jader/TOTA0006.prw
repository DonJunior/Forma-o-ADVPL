#Include 'Protheus.ch'

#Define CRLF Chr(13)+ Chr(10)

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/08/2017 | Don Carvalho	| Exemplo da função aSort (Ordenação de Array), com FOR
//		      |                 | 
// -----------+-----------------+-----------------------------------------------------------
User Function TOTA0006()

	Local aPais := {}
	Local nI    := 0
	Local cRet  := ""
	
	AADD(aPais,{"Brasil"    ,45.3})
	AADD(aPais,{"Argentina" ,39.8})
	AADD(aPais,{"Colombia"  ,17.1})
	AADD(aPais,{"Paraguai"  ,41  })
	AADD(aPais,{"Equador"   ,19.4})
	
	aSort(aPais,,,{|x,y| x[1] < y[1]})	

	For nI := 1 To Len(aPais)
		cRet += aPais[nI][1]+ " R$ " + cValToChar(aPais[nI][2]) + CRLF
	Next nI
	
	Alert(cRet)
	
Return

