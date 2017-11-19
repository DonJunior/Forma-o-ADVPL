#Include 'Protheus.ch'

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/08/2017 | Don Carvalho	| Modelo de WebService para atualização de endereço após
//		      |                 | digitação do CEP.
// -----------+-----------------+-----------------------------------------------------------
user function TOTA0003()

	Local cURL := "http://cep.republicavirtual.com.br/web_cep.php?cep="+Alltrim(M->ZZ2_CEP)+"&formato=xml"
	Local cSite:= HTTPGET(cURL)
	Local cBairro  := ""
	Local cCidade  := ""
	Local cLogr    := ""
	Local cUF 	   := ""
	Local cError   := ""
	Local cWarning := ""
	Local oXml 	   := NIL

	//Gera o Objeto XML
	oXml := XmlParser( cSite, "_", @cError, @cWarning )

	cBairro  := oXml:_WEBSERVICECEP:_BAIRRO:TEXT
	cCidade  := oXml:_WEBSERVICECEP:_CIDADE:TEXT
	cLogr	 := oXml:_WEBSERVICECEP:_LOGRADOURO:TEXT
	cUF	     := oXml:_WEBSERVICECEP:_UF:TEXT

	M->ZZ2_CIDADE := FwNoAccent(cCidade)
	M->ZZ2_BAIRRO := FwNoAccent(Bairro)
	M->ZZ2_LOGRA  := FwNoAccent(cLogr)
	M->ZZ2_UF 	  := Upper(cUF)

Return  Alltrim(M->ZZ2_CEP)