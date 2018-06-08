# redis-protocol-hs

A simple application that convert redis commands in redis-protocol


## Compile
```
stack ghc -- -O2 -optc-Os --make redis-protocol.hs
```

## Usage
```
echo "ZINCRBY houses 10 gryffindor\nZINCRBY houses 5 ravenclaw" | redis-protocol | redis-cli --pipe
```
