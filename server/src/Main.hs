{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import Data.Text.Lazy (pack)

main :: IO ()
main = scotty 3000 $ get "/" $ text $ pack "a"
