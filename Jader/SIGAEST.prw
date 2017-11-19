#include "rwmake.ch"

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/08/2017 | Don Carvalho	| Exemplo de programa gerado pelo assistente de código.
//		      |                 | 
// -----------+-----------------+-----------------------------------------------------------
user function SIGAEST()
	
	local cVldAlt := ".T." // Operacao: ALTERACAO
	local cVldExc := ".T." // Operacao: EXCLUSAO
	
	//trabalho/apoio
	local cAlias
	
	//--< procedimentos >-----------------------------------------------------------------------
	cAlias := "SB1"
	chkFile(cAlias)
	dbSelectArea(cAlias)
	//indices
	dbSetOrder(1)
	//Título a ser utilizado nas operações
	private cCadastro := "Cadastro de ..."
	
	//--<  monta 'arotina' proprio >------------------------------------------------------------
	
	aRotina := {;
		{ 'Pesquisar', "AxPesqui", 0, 1},;
		{ 'Visualizar', "AxVisual", 0, 2},;
		{ 'Incluir', "AxInclui", 0, 3},;
		{ 'Alterar', "AxAltera", 0, 4},;
		{ 'Exlcuir', "AxDeleta", 0, 5};
		}
	//--< procedimentos >-----------------------------------------------------------------------
	dbSelectArea(cAlias)
	mBrowse( 6, 1, 22, 75, cAlias)
	
	
return

