-----------------------------------------------------------------------------
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
-----------------------------------------------------------------------------
module THREE.LightProbe
  ( -- * Types
    LightProbe (..)
    -- * Constructors
  , THREE.LightProbe.new
    -- * Read-only Properties
  , isLightProbe
    -- * Properties
  , sh
    -- * Optional properties
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
import           THREE.SphericalHarmonics3
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/lights/LightProbe
newtype LightProbe
  = LightProbe
  { unLightProbe :: JSVal
  } deriving newtype (MakeArgs, MakeObject, ToJSVal)
    deriving anyclass (Light, Object3D, EventDispatcher)
-----------------------------------------------------------------------------
new :: THREE.Three LightProbe
new = THREE.new LightProbe "LightProbe" ()
-----------------------------------------------------------------------------
-- Read-only properties
-----------------------------------------------------------------------------
isLightProbe :: ReadOnly LightProbe Bool
isLightProbe = readonly "isLightProbe" 
-----------------------------------------------------------------------------
-- Properties
-----------------------------------------------------------------------------
sh :: Property LightProbe SphericalHarmonics3
sh = property "sh" 
-----------------------------------------------------------------------------
