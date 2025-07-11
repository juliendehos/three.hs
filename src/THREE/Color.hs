-----------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- {-# LANGUAGE TypeFamilies #-}
-- {-# LANGUAGE FunctionalDependencies #-}
-- {-# LANGUAGE AllowAmbiguousTypes #-}
-- {-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
-- {-# LANGUAGE FlexibleContexts #-}

-----------------------------------------------------------------------------
module THREE.Color
  ( -- * Types
    Color (..)
    -- * Methods
  , THREE.Color.new
    -- * Properties
  ) where
-----------------------------------------------------------------------------
import           Language.Javascript.JSaddle
-----------------------------------------------------------------------------
import qualified THREE.Internal as THREE
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/index.html#api/en/math/Color
newtype Color
  = Color
  { unColor :: JSVal
  } deriving (MakeObject, ToJSVal, MakeArgs)
-----------------------------------------------------------------------------
instance FromJSVal Color where
  fromJSVal = pure . Just . Color
-----------------------------------------------------------------------------
new :: THREE.Three Color
new = THREE.new Color "Color" ()
-----------------------------------------------------------------------------




class ColorArgs1 t 
instance ColorArgs1 () 
instance ColorArgs1 Int 
instance ColorArgs1 JSString 
instance ColorArgs1 Color 
instance ColorArgs1 (Double, Double, Double)
-- instance Num a => ColorArgs1 (a, a)

newColor1 :: (MakeArgs rgb, ColorArgs1 rgb) => rgb -> THREE.Three Color
newColor1 = THREE.new Color "Color"

test1 :: THREE.Three ()
test1 = do
  c1 <- newColor1 (0xff00ff::Int)
  c2 <- newColor1 ()
  c3 <- newColor1 (1::Double, 0::Double, 0::Double)
  c4 <- newColor1 ("blue"::JSString)
  c5 <- newColor1 =<< newColor1 ("green"::JSString)
  pure ()




data ColorArgs2 
  = ColorArgsUnit 
  | ColorArgsInt Int
  | ColorArgsString JSString
  | ColorArgsColor Color
  | ColorArgsRGB Double Double Double

newColor2 :: ColorArgs2 -> THREE.Three Color
newColor2 = \case
  ColorArgsUnit -> THREE.new Color "Color" ()
  ColorArgsInt x -> THREE.new Color "Color" x
  ColorArgsString x -> THREE.new Color "Color" x
  ColorArgsColor x -> THREE.new Color "Color" x
  ColorArgsRGB r g b -> THREE.new Color "Color" (r, g, b)

test2 :: THREE.Three ()
test2 = do
  c1 <- newColor2 (ColorArgsInt 0xff00ff)
  c2 <- newColor2 ColorArgsUnit
  c3 <- newColor2 (ColorArgsRGB 1 0 0)
  c4 <- newColor2 (ColorArgsString "blue")
  c5 <- newColor2 . ColorArgsColor =<< newColor2 (ColorArgsString "green")
  pure ()





newColor3 :: (MakeArgs a, ToJSVal a) => (Maybe a, Maybe Double, Maybe Double) -> THREE.Three Color
newColor3 (Just r, Just g, Just b) = THREE.new Color "Color" (r, g, b)
newColor3 (Just x, _, _) = THREE.new Color "Color" x
newColor3 _ = THREE.new Color "Color" ()

test3 :: THREE.Three ()
test3 = do
  c1 <- newColor3 (Just 0xff00ff :: Maybe Int, Nothing, Nothing)
  c2 <- newColor3 (Nothing :: Maybe (), Nothing, Nothing)
  c3 <- newColor3 (Just 1 :: Maybe Int, Just 0, Just 0)
  c4 <- newColor3 (Just "blue" :: Maybe JSString, Nothing, Nothing)
  c5 <- newColor3 (Just c4, Nothing, Nothing)
  pure ()





newColor4a :: Int -> THREE.Three Color
newColor4a = THREE.new Color "Color"

newColor4b :: () -> THREE.Three Color
newColor4b = THREE.new Color "Color"

newColor4c :: (Double, Double, Double) -> THREE.Three Color
newColor4c = THREE.new Color "Color"

newColor4d :: JSString -> THREE.Three Color
newColor4d = THREE.new Color "Color"

newColor4e :: Color -> THREE.Three Color
newColor4e = THREE.new Color "Color"

test4 :: THREE.Three ()
test4 = do
  c1 <- newColor4a 0xff00ff
  c2 <- newColor4b ()
  c3 <- newColor4c (1, 0, 0)
  c4 <- newColor4d ("blue"::JSString)
  c5 <- newColor4e =<< newColor4d "green"
  pure ()


