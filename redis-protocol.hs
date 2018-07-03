generateRedisProtocol :: [String] -> String
generateRedisProtocol tokens = removeLastNewLine . unlines $
  addCarriageReturn <$> concat [header, commands]
  where
    addCarriageReturn = (++ "\r")
    header = [ "*" ++ show (length tokens) ]
    commands = concat $ generateToken <$> tokens
    generateToken token = [ "$" ++ show (length token), token ]

eachValidLine :: (String -> String) -> String -> String
eachValidLine fn = removeLastNewLine . unlines . map fn . filter (/= "") . lines

removeLastNewLine :: String -> String
removeLastNewLine = init

main = interact $ eachValidLine (generateRedisProtocol . words)

