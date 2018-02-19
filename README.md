A minimal example to demonstrate the problem I am having with an Elm app doing get requests to a Haskell Scotty server.

The browser console says that the get request was OK, but Elm gives a NetworkError.

To run the code, cd into the 'server' directory and do 'stack build' (first install the Haskell Tool Stack). Then do 'stack exec server'.  This will start a server on localhost:3000 that gives the letter 'a' in response to a get request.

Run the elm code with 'elm-reactor' in the top level directory, and then choose 'src/Main.elm' in the browser.  Click on the 'Send request' button.

The desired behaviour is that the 'Response' field is 'a', and the 'Error' field is blank.  The actual behaviour is that the 'Error' field is 'NetworkError' and the 'Response' field is blank.
