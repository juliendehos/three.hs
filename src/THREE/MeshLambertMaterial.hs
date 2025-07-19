-----------------------------------------------------------------------------
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
module THREE.MeshLambertMaterial
  ( -- * Types
    MeshLambertMaterial (..)
    -- * Constructors
  , THREE.MeshLambertMaterial.new
    -- * Read-only Properties
    -- * Properties
    -- * Optional properties
    -- * Methods
  , THREE.MeshLambertMaterial.map
    -- * Helper functions
  ) where
-----------------------------------------------------------------------------
import           Language.Javascript.JSaddle
-----------------------------------------------------------------------------
import           THREE.EventDispatcher
import           THREE.Internal as THREE
import           THREE.Material
import           THREE.Texture
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/materials/MeshLambertMaterial
newtype MeshLambertMaterial
  = MeshLambertMaterial
  { unMeshLambertMaterial :: JSVal
  } deriving newtype (MakeArgs, MakeObject, ToJSVal)
    deriving anyclass (Material, EventDispatcher)
-----------------------------------------------------------------------------
-- Constructors
-----------------------------------------------------------------------------
new :: THREE.Three MeshLambertMaterial
new = THREE.new MeshLambertMaterial "MeshLambertMaterial" ()
-----------------------------------------------------------------------------
-- Read-only properties
-----------------------------------------------------------------------------
-- Properties
-----------------------------------------------------------------------------
-- Optional properties
-----------------------------------------------------------------------------
map :: Property MeshLambertMaterial (Maybe Texture)
map = optional "map"
-----------------------------------------------------------------------------
-- Methods
-----------------------------------------------------------------------------
-- Helper functions
-----------------------------------------------------------------------------
