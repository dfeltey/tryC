// tryC version 0.1 lexer


%%
\s+					/* skip whitespace */
"if"		       		   	return 'IF';
"else"		       			return 'ELSE';
"do"		       			return 'DO';
"while"		       			return 'WHILE';
"for"		       			return 'FOR';
"int"		       			return 'INT';
"char"		       			return 'CHAR';
"float"		       			return 'FLOAT';
"return"	       			return 'RETURN';
"main"		       		        return 'MAIN';
[0-9]+                 		        return 'INT_CONST';
([0-9]+"."[0-9]*)|([0-9]*"."[0-9]+)	return 'FLOAT_CONST';
// I'm not familiar enough with regular expressions to be able to tell if this is the correct
// expression for a character constant, but it is listed here
// http://www.quut.com/c/ANSI-C-grammar-l-1999.html
// and returns a constant, so it could be correct?
"'"(\\.|[^\\'\n])+"'"			%{yytext = yytext.slice(1,-1); return 'CHAR_CONST'}%
[A-Za-z_][0-9A-Za-z_]*			return 'IDENTIFIER';
"=="		       			return 'EQ';
"="		       			return 'ASSIGN';
"<="		       			return 'LE';
">="		       			return 'GE';
"<"		       			return 'LT';
">"		       			return 'GT';
"*"                    			return 'TIMES';
"/"                    			return 'DIVIDE';
"-"                    			return 'MINUS';
"+"                    			return 'PLUS';
"%"		      			return 'MOD';
"("                   			return 'LPAREN';
")"                    			return 'RPAREN';
"{"		       			return 'LBRACE';
"}"		       			return 'RBRACE';
";"		       			return 'SEMI';
<<EOF>>                			return 'EOF';
. 		       			%{console.log("Invalid character.\n"); return 'INVALID';}% 

%%