// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 08/04/2018 | Don Junior  	| Exemplo FWMBrowse - Cria um browse 
//            |                 | em MVC
//            |                 | Apostila Página 245
//            |                 | *** CÓDIGO INCOMPLETO ***
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'fwbrowse.ch'

User Function PGN245()

	Local oBrowse 

	// Instancia da classe de FWMBrowse
	oBrowse := FWMBrowse():New()

	Definição da tabela
	oBrowse:SetAlias("SA1")

	oBrowse:SetDeion("Cadastro de Cliente")
	oBrowse:AddLegend("A1_TIPO == 'F','YELLOW','Consumidor Final')
	oBrowse:AddLegend("A1_TIPO == 'L','BLUE','Produtor Rural')

	oBrowse:SetFilterDefault("Empty(A1_ULTCOM)")
//      oBrowse:DisableDetails()	

	oBrowse:Activate()


Return