#INCLUDE "FWPrintSetup.ch"
#INCLUDE "topconn.ch"
#INCLUDE "Protheus.ch"
#INCLUDE "TBICONN.CH"

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 23/08/2017 | Don Carvalho	| Exemplo função FWMSPrinter  
//		      |                 | 
// -----------+-----------------+-----------------------------------------------------------

User Function TOTA0014()

	Local cQuery   := ""
	Local nLinha    := 100
	Private oPrinter
	Private oFont1
	Private oFont2


	RPCSetType(3)
	Prepare Environment Empresa "99" Filial "01"
	//RPCSetEnv("99","01")

	oPrinter := FWMSPrinter():New("relatorio.pdf",6,.T.)
	oFont1 := TFont():New( "Courier New", , -18, .T.,.T.)
	oFont2 := TFont():New( "Arial Black", , -14, .T.,.F.)

	cQuery += " SELECT ZZ1.ZZ1_FILIAL,ZZ1.ZZ1_COD,ZZ1.ZZ1_DESC,ZZ1.ZZ1_PRECO," + CRLF
	cQuery += " ZZ1.ZZ1_ANOLAN,ZZ1.ZZ1_CODAUT,ZZ1.ZZ1_CODEDI " + CRLF
	cQuery += " FROM " + RetSqlName("ZZ1") + " ZZ1 " + CRLF
	cQuery += " WHERE ZZ1.ZZ1_FILIAL = '" + xFilial ("SZ1") + "' " + CRLF
	cQuery += "   AND ZZ1.D_E_L_E_T_ = ' ' " + CRLF

	cQuery := ChangeQuery(cQuery)

	If Select("QRY") > 0
		Dbselectarea("QRY")
		QRY->(DbClosearea())
	EndIf

	TcQuery cQuery New Alias "QRY"


	oPrinter:SetResolution(72) //Tamanho estipulado para a Danfe
	oPrinter:SetPortrait()
	oPrinter:SetPaperSize(9)
	oPrinter:SetMargin(60,60,60,60)
	oPrinter:StartPage()
	
	oPrinter:Box (100, 50, 3000, 2200)
	
	oPrinter:SayBitmap( 120, 120, "system\totvs.png", 200, 200)
	oPrinter:Say(300,400,"CADASTRO DE LIVROS", oFont1)
	
	nLinha := 400
	//               A       B     A      B
	oPrinter:Line ( nLinha, 0050, 3000, 0050)
	oPrinter:Line ( nLinha, 0300, 3000, 0300)
	oPrinter:Line ( nLinha, 0700, 3000, 0700)
	oPrinter:Line ( nLinha, 1000, 3000, 1000)
	oPrinter:Line ( nLinha, 1290, 3000, 1290)
	oPrinter:Line ( nLinha, 1500, 3000, 1500)
		
	//CABEÇALHO
	nLinha := 450
	oPrinter:Say( nLinha,0055, "ZZ1_COD"   	, oFont1, , CLR_YELLOW )
	oPrinter:Say( nLinha,0305, "ZZ1_DESC"	, oFont2, , CLR_HCYAN  )
	oPrinter:Say( nLinha,0705, "ZZ1_ANOLAN" , oFont1, , CLR_YELLOW )
	oPrinter:Say( nLinha,1005, "ZZ1_CODAUT" , oFont1, , /*CLR_YELLOW*/ )
	oPrinter:Say( nLinha,1295, "ZZ1_CODEDI" , oFont1, , /*CLR_YELLOW*/ )
	oPrinter:Say( nLinha,1505, "ZZ1_PRECO"  , oFont1, , /*CLR_BLUE*/   )

	nLinha := 500

	While !("QRY")->(EOF())

		oPrinter:Say( nLinha,0055, ("QRY")->ZZ1_COD   	                            , oFont1, , CLR_YELLOW )
		oPrinter:Say( nLinha,0305, ("QRY")->ZZ1_DESC		                        , oFont2, , CLR_HCYAN  )
		oPrinter:Say( nLinha,0705, ("QRY")->ZZ1_ANOLAN  	                        , oFont1, , CLR_YELLOW )
		oPrinter:Say( nLinha,1005, ("QRY")->ZZ1_CODAUT  	                        , oFont1, , /*CLR_YELLOW*/ )
		oPrinter:Say( nLinha,1295, ("QRY")->ZZ1_CODEDI  	                        , oFont1, , /*CLR_YELLOW*/ )
		oPrinter:Say( nLinha,1505, TRANSFORM(("QRY")->ZZ1_PRECO, "@E 999.999,99")	, oFont1, , /*CLR_BLUE*/   )
	
		nLinha += 50
		("QRY")->(DbSkip())
	End



	oPrinter:EndPage()
	oPrinter:Print()
	// oPrinter:Preview()
	
	//Reset Environment
	
Return .T.
