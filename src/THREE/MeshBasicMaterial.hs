-----------------------------------------------------------------------------
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
module THREE.MeshBasicMaterial
  ( -- * Types
    MeshBasicMaterial (..)
    -- * Methods
  , new
    -- * Properties
  ) where
-----------------------------------------------------------------------------
import           Language.Javascript.JSaddle hiding (new)
-----------------------------------------------------------------------------
import qualified THREE.Internal as THREE
import           THREE.EventDispatcher (EventDispatcher)
import           THREE.Material (Material)
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/materials/MeshBasicMaterial
newtype MeshBasicMaterial
  = MeshBasicMaterial
  { unMeshBasicMaterial :: JSVal
  } deriving newtype (MakeArgs, MakeObject, ToJSVal)
    deriving anyclass (Material, EventDispatcher)
-----------------------------------------------------------------------------
new :: Maybe Object -> THREE.Three MeshBasicMaterial
new = THREE.new MeshBasicMaterial "MeshBasicMaterial"
-----------------------------------------------------------------------------
instance FromJSVal MeshBasicMaterial where
  fromJSVal = pure . Just . MeshBasicMaterial
-----------------------------------------------------------------------------
