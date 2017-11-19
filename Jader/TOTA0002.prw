#Include 'Protheus.ch'

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/08/2017 | Don Carvalho	| mBrowser customizado para manutenção do cadastro de 
//		      |                 | livros (com Legenda) - Tabela ZZ1 
// -----------+-----------------+-----------------------------------------------------------

User Function TOTA0002()
	local cAlias
	Local aCores := {}
	
	cAlias := "ZZ1"
	chkFile(cAlias)
	DbSelectArea(cAlias)

	//Índices
	DbSetOrder(1)

	//Título a ser utilizado nas operações
	Private cCadastro := "Cadastro de Livros"

	aRotina := {;
		       { "Pesquisar"  , "AxPesqui", 0, 1},;
			   { "Visualizar" , "AxVisual", 0, 2},;
			   { "Incluir"    , "AxInclui", 0, 3},;
			   { "Alterar"    , "AxAltera", 0, 4},;
			   { "Exlcuir"    , "AxDeleta", 0, 5},;
			   { "Legenda"    , "U_ZZ1LEG", 0, 6};
		       }

	AADD(aCores,{"ZZ1_ANOLAN < '2000'"                            , "BR_VERMELHO" })
	AADD(aCores,{"ZZ1_ANOLAN >= '2000' .AND. ZZ1_ANOLAN < '2010'" , "BR_AMARELO"  })
	AADD(aCores,{"ZZ1_ANOLAN >= '2010'"                           , "BR_AZUL"     })
	
	DbSelectArea(cAlias)
	mBrowse( 6, 1, 22, 75, cAlias,,,,,6,aCores)

Return

//-----------------------------------------
// Montagem de tela com as legendas
//-----------------------------------------
User Function ZZ1LEG()

	Local aLegenda := {}
	
	AADD(aLegenda,{"BR_VERMELHO" ,"Lançamento Menor que 2000"        })
	AADD(aLegenda,{"BR_AMARELO"  ,"Lançamento Entre 2000 e 2010"     })
	AADD(aLegenda,{"BR_AZUL"     ,"Lançamento Maior ou Igual a 2010" })
	
	BrwLegenda(cCadastro, "Legenda", aLegenda)
	
Return
