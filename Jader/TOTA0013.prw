#Include 'Protheus.ch'

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 21/08/2017 | Don Carvalho	| mBrowser customizado para manutenção do cadastro de 
//		      |                 | pedidos de livros (com Legenda) - Tabela ZZ4 e ZZ5 
// -----------+-----------------+-----------------------------------------------------------

User Function TOTA0013()

	local cAliasZZ4
	Local aCores := {}
	
	cAliasZZ4 := "ZZ4"
	chkFile(cAliasZZ4)
	DbSelectArea(cAliasZZ4)

	//Índices
	DbSetOrder(1)

	//Título a ser utilizado nas operações
	Private cCadastro := "Pedido de Livros"

	aRotina := {;
		       { "Pesquisar"  , "AxPesqui"   , 0, 1},;
			   { "Visualizar" , "AxVisual"   , 0, 2},;
			   { "Incluir"    , "U_TOTA0011" , 0, 3},;
			   { "Alterar"    , "U_TOTA0012" , 0, 4},;
			   { "Exlcuir"    , "AxDeleta"   , 0, 5},;
			   { "Legenda"    , "U_ZZ4LEG"   , 0, 6}}

	AADD(aCores,{"ZZ4_VLTOT <  '100'"                         , "BR_VERMELHO" })
	AADD(aCores,{"ZZ4_VLTOT >= '100' .AND. ZZ4_VLTOT < '200'" , "BR_AMARELO"  })
	AADD(aCores,{"ZZ4_VLTOT >= '200'"                         , "BR_AZUL"     })
	
	DbSelectArea(cAliasZZ4)
	mBrowse( 6, 1, 22, 75, cAliasZZ4,,,,,6,aCores)

Return

//-----------------------------------------
// Montagem de tela com as legendas
//-----------------------------------------
User Function ZZ4LEG()

	Local aLegenda := {}
	
	AADD(aLegenda,{"BR_VERMELHO" ,"Total Menor que 100"        })
	AADD(aLegenda,{"BR_AMARELO"  ,"Total Entre 100 e 200"      })
	AADD(aLegenda,{"BR_AZUL"     ,"Total Maior ou Igual a 200" })
	
	BrwLegenda(cCadastro, "Legenda", aLegenda)
	
Return
