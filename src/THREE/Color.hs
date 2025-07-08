-----------------------------------------------------------------------------
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
module THREE.Color
  ( -- * Types
    Color (..)
  , ColorClass (..)
  , ColorKeyword (..)
  , RGB (..)
    -- * Methods
  , THREE.Color.new
  , newColor
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
new :: (Double, Double, Double) -> THREE.Three Color
new (r, g, b) = THREE.new Color "Color" (r, g, b)
-----------------------------------------------------------------------------

newColor :: ColorClass color => color -> THREE.Three Color
newColor color' = THREE.new Color "Color" (toColorVal color')

data ColorKeyword
  = Red
  | Green
  | Blue

class ColorClass color where
  toColorVal :: color -> JSM JSVal

instance ColorClass Color where
  toColorVal = pure . unColor

instance ColorClass Int where
  toColorVal = toJSVal

data RGB = RGB Double Double Double

instance ColorClass RGB where
  toColorVal (RGB r g b) = toJSVal (r, g, b)

instance ColorClass ColorKeyword where
  toColorVal k = toJSVal $ case k of
    Red -> "red" :: JSString
    Green -> "green"
    Blue -> "blue"

