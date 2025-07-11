-----------------------------------------------------------------------------
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
module THREE.AmbientLight
  ( -- * Types
    AmbientLight (..)
    -- * Methods
  , THREE.AmbientLight.new
  , new'
    -- * Properties
  , isAmbientLight
  ) where
-----------------------------------------------------------------------------
import           Language.Javascript.JSaddle
-----------------------------------------------------------------------------
import           THREE.EventDispatcher as THREE
import           THREE.Internal as THREE
import           THREE.Light as THREE
import           THREE.Object3D as THREE

import           THREE.Color
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/lights/AmbientLight
newtype AmbientLight
  = AmbientLight
  { unAmbientLight :: JSVal
  } deriving newtype (MakeArgs, MakeObject, ToJSVal)
    deriving anyclass (Light, Object3D, EventDispatcher)
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/lights/AmbientLight
new :: Int -> Double -> THREE.Three AmbientLight
new color' intensity' = THREE.new AmbientLight "AmbientLight" (color', intensity')
-----------------------------------------------------------------------------
-- Read-only properties
-----------------------------------------------------------------------------
isAmbientLight :: ReadOnly AmbientLight Bool
isAmbientLight = readonly "isAmbientLight" 
-----------------------------------------------------------------------------

newAmbientLight :: ColorClass color => color -> THREE.Three AmbientLight
newAmbientLight color' = THREE.new AmbientLight "AmbientLight" (toColorVal color')

mkLight1 :: THREE.Three AmbientLight
mkLight1 = newAmbientLight (0x110000 :: Int)

mkLight2 :: THREE.Three AmbientLight
mkLight2 = newAmbientLight Green

mkLight3 :: THREE.Three AmbientLight
mkLight3 = newAmbientLight =<< THREE.Color.newColor (Rgb 0 0 1)

mkLight4 :: THREE.Three AmbientLight
mkLight4 = newAmbientLight =<< THREE.Color.newColor (0x111100 :: Int)

mkLight5 :: THREE.Three AmbientLight
mkLight5 = newAmbientLight =<< THREE.Color.newColor Cyan

mkLight6 :: THREE.Three AmbientLight
mkLight6 = newAmbientLight =<< THREE.Color.newColor =<< THREE.Color.newColor (Rgb 0 0 1)

-- not allowed
-- mkLight7 :: THREE.Three AmbientLight
-- mkLight7 = newAmbientLight (Rgb 0 0 1)

