#Include 'Protheus.ch'
#include 'parmtype.ch'

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 21/08/2017 | Don Carvalho	| Exemplo da rotina modelo 3 (cabeçalho e itens)
//		      |                 | nOpce = 3 - inclusão
// -----------+-----------------+-----------------------------------------------------------
User Function TOTA0011()

	Local cLinok 	     := "ExecBlock('LinOk1I',.f.,.f.)"
	Local cTudook 	     := "ExecBlock('TudOk1I',.f.,.f.)"
	Local nOpce 	     := 3 	//define modo de alteração para a enchoice
	Local nOpcg 	     := 3 	//define modo de alteração para o grid
	Local cFieldok 	     := "Allwaystrue"
	Local lRet 		     := .T.
	Local cMensagem      := ""
	Local lVirtual       := .T. //Mostra campos virtuais se houver
	Local nFreeze	     := 0
	Local nAlturaEnc     := 400	//Altura da Enchoice
 
	Private cCadastro	 := "Pedido de Livros - Inclusão"
	Private aCols 		 := {}
	Private aHeader 	 := {}
	Private aCpoEnchoice := {}
	Private aIncEnchoice := {"ZZ4_CODPED","ZZ4_VEND","ZZ4_NOMVED","ZZ4_VLTOT"}
	Private cTitulo
	Private cAlias1 	 := "ZZ4"
	Private cAlias2 	 := "ZZ5"
    
    // Verifica se o pedido já está liberado

	RegToMemory("ZZ4",.F.)
	RegToMemory("ZZ5",.F.)
    
	DefineCabec()
	DefineaCols(nOpcg)
        
	lRet := Modelo3(cCadastro,cAlias1,cAlias2,aCpoEnchoice,cLinok,cTudook,nOpce,nOpcg,cFieldok,lVirtual,,aIncEnchoice,nFreeze,,,nAlturaEnc)
        
        //retornará como true se clicar no botao confirmar
	if lRet
		if MsgYesNo(cMensagem+"Confirma Inclusão dos dados ?", cCadastro)
			Processa({||Gravar()},cCadastro,"Gravando dados, aguarde...")
		endif
	else
		RollbackSx8()
	endif
 
Return
 
 
Static Function DefineCabec()

	Local aZZ4	  := {"ZZ4_CODPED","ZZ4_HORA","ZZ4_VEND","ZZ4_NOMVED","ZZ4_VLTOT"}
	Local nUsado  := 0
    
	aHeader		  := {}
	aCpoEnchoice  := {}
    
    //Monta a enchoice
	DbSelectArea("SX3")
	SX3->(DbSetOrder(1))
	dbseek(cAlias1)
    
	while SX3->(!eof()) .AND. X3_ARQUIVO == cAlias1
		IF X3USO(X3_USADO) //.AND. CNIVEL >= X3_NIVEL
        
			AADD(aCpoEnchoice,X3_CAMPO)
		endif
		dbskip()
	enddo
 
    //Monta o aHeader do grid conforme os campos definidos no array aSC6 (apenas os campos que deseja)
    //Caso contrário, se quiser todos os campos é necessário trocar o "For" por While, para que este faça a leitura de toda a tabela
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	aHeader:={}
	For nX := 1 to Len(aZZ4)
		If SX3->(DbSeek(aZZ4[nX]))
			If X3USO(X3_USADO) //.And.cNivel>=X3_NIVEL
				nUsado := nUsado+1
				Aadd(aHeader, {TRIM(X3_TITULO), X3_CAMPO , X3_PICTURE, X3_TAMANHO, X3_DECIMAL,X3_VALID, X3_USADO, X3_TIPO, X3_ARQUIVO, X3_CONTEXT})
			Endif
		Endif
	Next nX

Return
 
//Insere o conteudo no aCols do grid
Static function DefineaCols(nOpc)
    
	Local aZZ5		:= {"ZZ5_ITEM", "ZZ5_CODLIV", "ZZ5_DESCLI", "ZZ5_QUANT", "ZZ5_PRECO", "ZZ5_TOTAL","ZZ5_CODPED"}
	Local nQtdcpo 	:= 0
	Local i			:= 0
	Local nCols 	:= 0
	Local nUsado	:= 0
	nQtdcpo 		:= 0
	aCols			:= {}
    
	aHeader := {}

	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	aHeader:={}
	For nX := 1 to Len(aZZ5)
		If SX3->(DbSeek(aZZ5[nX]))
			If X3USO(X3_USADO)//.And.cNivel>=X3_NIVEL
				nUsado:=nUsado+1
				Aadd(aHeader, {TRIM(X3_TITULO), X3_CAMPO , X3_PICTURE, X3_TAMANHO, X3_DECIMAL,X3_VALID, X3_USADO, X3_TIPO, X3_ARQUIVO, X3_CONTEXT})
			Endif
		Endif
	Next nX
    
	nQtdcpo := len(aHeader)
    
	dbselectarea(cAlias2)
	dbsetorder(1)
	dbseek(xfilial(cAlias2)+(cAlias1)->ZZ4_CODPED)
	while .not. eof() .and. (cAlias2)->ZZ5_FILIAL == xfilial(cAlias2) .and. (cAlias2)->ZZ5_CODPED ==(cAlias1)->ZZ4_CODPED
		aAdd(aCols,array(nQtdcpo+1))
		nCols++
		for i:= 1 to nQtdcpo
			if aHeader[i,10] <> "V"
				aCols[nCols,i] := Fieldget(Fieldpos(aHeader[i,2]))
			else
				aCols[nCols,i] := Criavar(aHeader[i,2],.T.)
			endif
		next i
		aCols[nCols,nQtdcpo+1] := .F.
		dbselectarea(cAlias2)
		dbskip()
	enddo
Return
 
 
//Gravar o conteudo dos campos
Static Function Gravar()

	Local bcampo  := { |nfield| field(nfield) }
	Local i       := 0
	Local y       := 0
	Local nitem   := 0
	Local nItem   := aScan(aHeader,{|x| AllTrim(Upper(x[2]))=="ZZ5_ITEM"})
	Local nPosCpo
	Local nCpo
	Local nI
	Local cCamposZZ4 := ""
	Local cCamposZZ5 := "ZZ5_ITEM;ZZ5_CODLIV;ZZ5_DESCLI;ZZ5_QUANT;ZZ5_PRECO;ZZ5_TOTAL"
	Local nCod
    
	Begin Transaction
    
        //Gravando dados da enchoice
        dbselectarea(cAlias1)
        Reclock(cAlias1,.T.)	 
        for i:= 1 to fcount()
            incproc()
            if "FILIAL" $ FIELDNAME(i)
                Fieldput(i,xfilial(cAlias1))
            else
                //Grava apenas os campos contidos na variavel cCamposZZ4
                If ( FieldName(i) $ cCamposZZ4 )
                    Fieldput(i,M->&(EVAL(bcampo,i)))
                Endif
            endif
        next i		 
        Msunlock()
    
        //Gravando dados do grid
		dbSelectArea("ZZ5")
		ZZ5->(dbSetOrder(1))
		For nI := 1 To Len(aCols)
        
			nCod := aScan(aHeader,{|x| AllTrim(x[2]) == "ZZ5_CODPED"})
			If ZZ5->(dbSeek( xFilial("ZZ5")+M->ZZ4_CODPED+aCols[nI, nCod] ))
                	//Altera
                	
				RecLock("ZZ5",.F.)
	                    
				If !aCols[nI,Len(aHeader)+1]
	                    	                    
					ZZ5->ZZ5_CODPED:=M->ZZ4_CODPED
					For nCpo := 1 to fCount()
		                        //Grava apenas os campos contidos na variavel $cCamposSC6
						If (FieldName(nCpo)$cCamposZZ5)
							nPosCpo := aScan(aHeader,{|x| AllTrim(x[2]) == AllTrim(FieldName(nCpo))})
							If nPosCpo > 0
								FieldPut(nCpo,aCols[nI,nPosCpo])
							EndIf
						Endif
					Next nCpo
				Else
					ZZ5->(DbDelete())
				EndIf
		                
				ZZ5->(MsUnLock())
		                    
	                 
			Else
                	//Incluir
				RecLock("ZZ5",.T.)
				ZZ5->ZZ5_FILIAL:=xFilial("ZZ4")
				ZZ5->ZZ5_CODPED:=M->ZZ4_CODPED
                    
				For nCpo := 1 to fCount()
                        //Grava apenas os campos contidos na variavel $cCamposZZ5
					If (FieldName(nCpo)$cCamposZZ5)
						nPosCpo := aScan(aHeader,{|x| AllTrim(x[2]) == AllTrim(FieldName(nCpo))})
						If nPosCpo > 0
							FieldPut(nCpo,aCols[nI,nPosCpo])
						EndIf
					Endif
				Next nCpo
				ZZ5->(MsUnLock())
                	
                	
			Endif
           
		Next nI
        
	End Transaction
Return


User Function TudOk1I()

	Local nI := 0
	Local lRet := .T.
/*              
Local nQtdVen := nPrcven := nProd := ""
                                             
	nProd   :=  AScan(aHeader,{|x| Trim(x[2])=="Z3_CODPRO"})
	nQtdVen :=  AScan(aHeader,{|x| Trim(x[2])=="Z3_QTD"   })
	nPrcven :=  AScan(aHeader,{|x| Trim(x[2])=="Z3_VALOR" })


	For nI := 1 To Len(aCOLS)
	
		If aCOLS[nI, Len(aHeader)+1] // Se for Deletado
			Loop
		Endif

		If Empty(aCOLS[nI,nProd]) .And. lRet
			MsgAlert("Campo PRODUTO preenchimento obrigatorio",cCadastro)
			lRet := .F.
		Endif

		If Empty(aCOLS[nI,nPrcven]) .And. lRet
			MsgAlert("Campo QUANTIDADE preenchimento obrigatorio",cCadastro)
			lRet := .F.
		Endif
		
		If Empty(aCOLS[nI,nQtdVen]) .And. lRet
			MsgAlert("Campo PRECO UNITARIO preenchimento obrigatorio",cCadastro)
			lRet := .F.
		Endif
		
		If !lRet
			Exit
		Endif

	Next i
*/

Return(lRet)

User Function LinOk1I()

	Local lRet    := .T.
	Local nI      := 0
	Local nQtdVen := nPrcven := 0
   
/*
	nPrcven :=  AScan(aHeader,{|x| Trim(x[2])=="Z3_QTD"})
	nQtdVen :=  AScan(aHeader,{|x| Trim(x[2])=="Z3_VALOR"})

	
	For nI := 1 To Len( aCOLS )
	
		If aCOLS[nI,Len(aHeader)+1]
			Loop
		Endif
		
		nTotal += Round( aCOLS[ nI, nQtdVen ] * aCOLS[ nI, nPrcven ], 2 )
		
	Next nI    
*/

Return(lRet)
