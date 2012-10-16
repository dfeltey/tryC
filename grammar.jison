/* lexical grammar */
%lex

%%
\s+                   /* skip whitespace */
"if"		       return 'IF';
"else"		       return 'ELSE';
"do"		       return 'DO';
"while"		       return 'WHILE';
"for"		       return 'FOR';
"int"		       return 'INT';
"char"		       return 'CHAR';
"float"		       return 'FLOAT';
"return"	       return 'RETURN';
"main"		       return 'MAIN';
[0-9]+("."[0-9]+)?\b   return 'NUMBER';
[A-Za-z_][0-9A-Za-z_]* return 'IDENTIFIER';
"=="		       return 'EQ';
"="		       return 'ASSIGN';
"<="		       return 'LE';
">="		       return 'GE';
"<"		       return 'LT';
">"		       return 'GT';
"*"                    return 'TIME';
"/"                    return 'DIVIDE';
"-"                    return 'MINUS';
"+"                    return 'PLUS';
"%"		       return 'MOD';
"("                    return 'LPAREN';
")"                    return 'RPAREN';
"{"		       return 'LBRACE';
"}"		       return 'RBRACE';
";"		       return 'SEMI';
<<EOF>>                return 'EOF';

/lex

/* operator associations and precedence */

%left '+' '-'
%left '*' '/'
%left '^'
%left UMINUS

%start expressions

%% /* language grammar */



program : 


// need to figure out how to allow empty item as one of the rules

block : LBRACE statements RBRACE

statements : statement statements
	   ; 



expressions
    : e EOF
        {console.log($1); return $1;}
    ;

e
    : e '+' e
        {$$ = $1+$3;}
    | e '-' e
        {$$ = $1-$3;}
    | e '*' e
        {$$ = $1*$3;}
    | e '/' e
        {$$ = $1/$3;}
    | e '^' e
        {$$ = Math.pow($1, $3);}
    | '-' e %prec UMINUS
        {$$ = -$2;}
    | '(' e ')'
        {$$ = $2;}
    | NUMBER
        {$$ = Number(yytext);}
    | E
        {$$ = Math.E;}
    | PI
        {$$ = Math.PI;}
    ;