#Include 'Protheus.ch'

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/08/2017 | Don Carvalho	| Exemplo da função DlgToExcel - geração de arquivo *.CSV
//		      |                 | 
// -----------+-----------------+-----------------------------------------------------------
User Function TOTA0008()

	Local aZZ1Cabe := {}
	Local aZZ1Item := {}

	AADD(aZZ1Cabe,{"ZZ1_FILIAL","C", 02, 0})
	AADD(aZZ1Cabe,{"ZZ1_COD","C", 06, 0})   
	AADD(aZZ1Cabe,{"ZZ1_DESC","C", 40, 0})  
	AADD(aZZ1Cabe,{"ZZ1_ANOLAN","N", 04, 0})
	AADD(aZZ1Cabe,{"ZZ1_CODAUT","C", 06, 0})
	AADD(aZZ1Cabe,{"ZZ1_CODEDI","C", 06, 0})
	AADD(aZZ1Cabe,{"ZZ1_PRECO","N", 08, 2})

	DbSelectArea("ZZ1")
	ZZ1->(DbSetOrder(1))
	
	While !ZZ1->(EOF())
	
		AADD(aZZ1Item,{ZZ1->ZZ1_FILIAL,;
				       ZZ1->ZZ1_COD,   ;
			    	   ZZ1->ZZ1_DESC,  ;
				       ZZ1->ZZ1_ANOLAN,;
				       ZZ1->ZZ1_CODAUT,;
				       ZZ1->ZZ1_CODEDI,;
				       ZZ1->ZZ1_PRECO,Nil})
	
		ZZ1->(DbSkip())
	End
	
	aSort(aZZ1Item,,,{|x,y| x[7] > y[7]})	

	DlgToExcel({{"GETDADOS","IMPRESSAO",aZZ1Cabe,aZZ1Item}})
Return

