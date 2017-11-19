#Include 'Protheus.ch'

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/08/2017 | Don Carvalho	| Exemplo da função aSort (Ordenação de Array)
//		      |                 | 
// -----------+-----------------+-----------------------------------------------------------
User Function TOTA0007()

	Local aZZ1 := {}
	
	DbSelectArea("ZZ1")
	ZZ1->(DbSetOrder(1))
	
	While !ZZ1->(EOF())
	
		AADD(aZZ1,{ZZ1->ZZ1_FILIAL,;
				   ZZ1->ZZ1_COD,   ;
				   ZZ1->ZZ1_DESC,  ;
				   ZZ1->ZZ1_ANOLAN,;
				   ZZ1->ZZ1_CODAUT,;
				   ZZ1->ZZ1_CODEDI,;
				   ZZ1->ZZ1_PRECO})
	
		ZZ1->(DbSkip())
	End
	
	aSort(aZZ1,,,{|x,y| x[7] > y[7]})	

	Alert("O livro mais caro é " + aZZ1[1][3])

	
Return

