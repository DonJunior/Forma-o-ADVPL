#Include 'Protheus.ch'

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/08/2017 | Don Carvalho	| mBrowser customizado para manuten��o do cadastro de 
//		      |                 | livros - Tabela ZZ1
// -----------+-----------------+-----------------------------------------------------------
user function TOTA0001()

	Local cAlias
	
	cAlias := "ZZ2"
	chkFile(cAlias)
	DbSelectArea(cAlias)
	
	//�ndices
	DbSetOrder(1)
	
	//T�tulo a ser utilizado nas opera��es
	Private cCadastro := "Cadastro de Autores"

	aRotina := {;
		{ "Pesquisar", "AxPesqui", 0, 1},;
		{ "Visualizar", "AxVisual", 0, 2},;
		{ "Incluir", "AxInclui", 0, 3},;
		{ "Alterar", "AxAltera", 0, 4},;
		{ "Exlcuir", "AxDeleta", 0, 5};
		}

	DbSelectArea(cAlias)
	mBrowse( 6, 1, 22, 75, cAlias)

Return