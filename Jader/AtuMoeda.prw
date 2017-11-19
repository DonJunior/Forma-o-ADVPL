#Include 'Protheus.ch'

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/08/2017 | Don Carvalho	| Exemplo importação de arquivo *.CSV e gravação dos 
//		      |                 | registros no banco de dados para atualização de moedas.
// -----------+-----------------+-----------------------------------------------------------
User Function ATUMOEDA()

	Local cFile, cTexto, nLinhas, j, lAuto,jj := .F.

	If Select("SX2")==0 // Testa se está sendo rodado do menu
		RPCSETENV("01","01","admin","totvs1607",,"JOB",{"SM2"})
		Qout("JOB - Atualizacao do Dolar...")
		lAuto := .T.
	EndIf


// Refaz dos ultimos 6 dias para o caso de algum dia a conexao ter falhado 
      
	dDataRef := dDataBase-1

	If Dow(dDataRef) == 1    // Se for domingo
		cFile := DTOS(dDataRef - 2)+".csv"
	ElseIf Dow(dDataBase) == 7            // Se for sábado
		cFile := DTOS(dDataRef - 1)+".csv"
	Else                                   // Se for dia normal
		cFile := DTOS(dDataRef)+".csv"
	EndIf
     
                    // http://www4.bcb.gov.br/download/fechamento/20170808.csv
	cTexto := HTTPGET('http://www4.bcb.gov.br/download/fechamento/'+cFile)
	nLinhas := MLCount(cTexto, 81)
	For j := 1 to nLinhas
		jj:=.t.
		cLinha := Memoline(cTexto,81,j)
		cData := Substr(cLinha,1,10)
		If Subst(cLinha,12,3)=="220" // Dolar Americano
          	
          	   
			cCompra := Replace(STRTOARRAY(cLinha,";")[5],',','.') //STRTOKARR
			cVenda := Replace(STRTOARRAY(cLinha,";")[5],',','.')  //STRTOKARR
	          
			DbSelectArea("SM2")
			DbSetOrder(1)
                
			dData := CTOD(cData)
			If DbSeek(DTOS(dData))
				Reclock("SM2",.F.)
			Else
				Reclock("SM2",.T.)
				Replace M2_DATA   With dData
			EndIf
			Replace M2_MOEDA2 With Val(cVenda)
			Replace M2_INFORM With "S"
			MsUnlock("SM2")
                    
             
		EndIf

         
	Next
    

	If lAuto
		RpcClearEnv()
		Qout("FIM - JOB - Atualizacao do Dolar.")
	EndIf

Return

