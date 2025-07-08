-----------------------------------------------------------------------------
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
-----------------------------------------------------------------------------
module THREE.SpotLight
  ( -- * Types
    SpotLight (..)
    -- * Constructors
  , THREE.SpotLight.new
    -- * Read-only Properties
  , isSpotLight
    -- * Properties
  , angle
  , decay
  , distance
  , penumbra
  , power
  , target
    -- * Optional properties
  , THREE.SpotLight.map
    -- * Methods
    -- * Helper functions
  ) where
-----------------------------------------------------------------------------
import           Language.Javascript.JSaddle
-----------------------------------------------------------------------------
import           THREE.EventDispatcher
import           THREE.Internal as THREE
import           THREE.Light
import           THREE.Object3D
import           THREE.Texture
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/lights/SpotLight
newtype SpotLight
  = SpotLight
  { unSpotLight :: JSVal
  } deriving newtype (MakeArgs, MakeObject, ToJSVal)
    deriving anyclass (Light, Object3D, EventDispatcher)
-----------------------------------------------------------------------------
new :: THREE.Three SpotLight
new = THREE.new SpotLight "SpotLight" ()
-----------------------------------------------------------------------------
-- Read-only properties
-----------------------------------------------------------------------------
isSpotLight :: ReadOnly SpotLight Bool
isSpotLight = readonly "isSpotLight" 
-----------------------------------------------------------------------------
-- Properties
-----------------------------------------------------------------------------
angle :: Property SpotLight Double
angle = property "angle" 
-----------------------------------------------------------------------------
decay :: Property SpotLight Double
decay = property "decay" 
-----------------------------------------------------------------------------
distance :: Property SpotLight Double
distance = property "distance" 
-----------------------------------------------------------------------------
penumbra :: Property SpotLight Double
penumbra = property "penumbra" 
-----------------------------------------------------------------------------
power :: Property SpotLight Double
power = property "power" 
-----------------------------------------------------------------------------
target :: (Object3D object, FromJSVal object) => Property SpotLight object
target = property "target" 
-----------------------------------------------------------------------------
-- Optional properties
-----------------------------------------------------------------------------
map :: THREE.Property SpotLight (Maybe Texture)
map = optional "map"
-----------------------------------------------------------------------------
