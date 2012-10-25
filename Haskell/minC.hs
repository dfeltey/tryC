data MinCType = I Integer
		   	  | F Float
		   	  | D Double
		      | C Char
		      | Void
		      | Pointer MinCType -- maybe pointers don't go here since all the others hold values
		    --| Array ??? where should arrays go??
		      | EMPTY
		      | FUN MinCType -- return-val args body
		      deriving (Eq, Show, Read)


-- Might need GADTs for the expressions....
data MinCExpr =  



data MinCStatement = IF -- Test Body Rest
				   | ELSE -- Body Rest, basically run these two things in sequence 
				   | WHILE -- Test body, rest(/continuation?)
				   | DO -- basically the same as while 
				   | FOR -- all of these could probably desugar into while
				   | RETURN MinCExpr-- value, just give back the value ...
				   | ASSIGN -- variable and value modify an environment and.or store to hold the new assignment
				   | DECLARE  -- variable, make space for it in the environment and store?
				   | EXPR MinCExpr
				   deriving (Eq, Read, Show)
