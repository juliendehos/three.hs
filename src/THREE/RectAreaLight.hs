-----------------------------------------------------------------------------
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
-----------------------------------------------------------------------------
module THREE.RectAreaLight
  ( -- * Types
    RectAreaLight (..)
    -- * Constructors
  , THREE.RectAreaLight.new
    -- * Read-only Properties
  , isRectAreaLight
    -- * Properties
  , height
  , power
  , width
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
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/lights/RectAreaLight
newtype RectAreaLight
  = RectAreaLight
  { unRectAreaLight :: JSVal
  } deriving newtype (MakeArgs, MakeObject, ToJSVal)
    deriving anyclass (Light, Object3D, EventDispatcher)
-----------------------------------------------------------------------------
new :: THREE.Three RectAreaLight
new = THREE.new RectAreaLight "RectAreaLight" ()
-----------------------------------------------------------------------------
-- Read-only properties
-----------------------------------------------------------------------------
isRectAreaLight :: ReadOnly RectAreaLight Bool
isRectAreaLight = readonly "isRectAreaLight" 
-----------------------------------------------------------------------------
-- Properties
-----------------------------------------------------------------------------
height :: Property RectAreaLight Double
height = property "height" 
-----------------------------------------------------------------------------
power :: Property RectAreaLight Double
power = property "power" 
-----------------------------------------------------------------------------
width :: Property RectAreaLight Double
width = property "width" 
-----------------------------------------------------------------------------
