{ 
module Main (main) where
}

%wrapper "basic"

$digit = 0-9              -- digits
$idC   = [_a-zA-Z]		  -- valid identifier characters 
@char = \'(\\.|[^\\\'\n])+\'
@str = \"(\\.|[^\\\"\n])*\"
@float = $digit+\.|\.$digit+|$digit+\.$digit+
-- Haskell won't parse doubles like 0. or .0, this should be easy to fix with an external function
-- that checks if . is the first or last character and conses/appends as necessary to make Haskell
-- parser the double 


tokens :- 
	
	$white+					;
	$digit+					{\s -> IntValT (read s)}
	@float 					{\s -> parseDouble s}
	@str	   	            {\s -> StringValT (init $ tail s)}
	@char 					{\s -> CharValT (read s)}
	int 					{\s -> IntT}
	float                   {\s -> FloatT}
	double   				{\s -> DoubleT}
	char 					{\s -> CharT}
	string 					{\s -> StringT}
	if  					{\s -> IfT}
	else 					{\s -> ElseT}
	do 						{\s -> DoT}
	while 					{\s -> WhileT}
	for 					{\s -> ForT}
	return 					{\s -> ReturnT}
	"{"						{\s -> LBrace}
	"}"						{\s -> RBrace}
	"("						{\s -> LParen}
	")"						{\s -> RParen}
	";"						{\s -> Semi}
	"==" 					{\s -> EqualT}
	"="						{\s -> AssignT}
	"<="					{\s -> LessEqT}
	"<"						{\s -> LessT}
	">="					{\s -> GreatEqT}
	">"						{\s -> GreatT}
	\+						{\s -> PlusT}
	\*						{\s -> TimesT}
	\/ 						{\s -> DivideT}
	\-						{\s -> MinusT}
	\% 						{\s -> ModT}
	$idC+					{\s -> IdT s}
	.						{\s -> ErrorT s}


{
-- token type
-- probably best for the surface syntax to only support integer and double vals,
-- then handle conversion to the correct datatype within the abstract syntax based
-- on variable type
data Token = IdT String
		   | IntValT Int
		   | FloatValT Float
		   | DoubleValT Double
		   | CharValT Char
		   | StringValT String
		   | VoidT
		   | IntT
		   | FloatT
		   | DoubleT
		   | CharT
		   | StringT
		   | IfT
		   | ElseT
		   | DoT
		   | WhileT
		   | ForT
		   | ReturnT
		   | LParen
		   | RParen
		   | LBrace
		   | RBrace
		   | Semi
		   | AssignT
		   | EqualT
		   | LessT
		   | GreatT
		   | LessEqT
		   | GreatEqT
		   | PlusT
		   | MinusT
		   | TimesT
		   | DivideT
		   | ModT
		   | ErrorT String
		   deriving(Show)



parseDouble :: String -> Token
parseDouble s@('.':xs) = DoubleValT $ read $'0':s
parseDouble s
	| last s == '.' = DoubleValT $ read $ s ++ "0"
	| otherwise = DoubleValT $ read s

main = do
	s <- getContents
	print (alexScanTokens s)
}





