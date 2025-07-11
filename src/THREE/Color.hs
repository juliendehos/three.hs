-----------------------------------------------------------------------------
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
module THREE.Color
  ( -- * Types
    Color (..)
  , ColorClass (..)
  , ColorKeyword (..)
  , Rgb (..)
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

data ColorKeyword
  = Cyan
  | Green

data Rgb = Rgb Double Double Double

class RgbClass rgb where
  toRgbVal :: rgb -> JSM JSVal

instance RgbClass Rgb where
  toRgbVal (Rgb r g b) = toJSVal (r, g, b)

instance RgbClass Int where
  toRgbVal = toJSVal

instance RgbClass ColorKeyword where
  toRgbVal k = toJSVal $ case k of
    Cyan -> "cyan" :: JSString
    Green -> "green"

instance RgbClass Color where
  toRgbVal = pure . unColor

newColor :: RgbClass rgb => rgb -> THREE.Three Color
newColor rgb' = THREE.new Color "Color" (toRgbVal rgb')

class ColorClass color where
  toColorVal :: color -> JSM JSVal

instance ColorClass Int where
  toColorVal = toRgbVal

instance ColorClass ColorKeyword where
  toColorVal = toRgbVal

instance ColorClass Color where
  toColorVal = toRgbVal

