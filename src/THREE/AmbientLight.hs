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
