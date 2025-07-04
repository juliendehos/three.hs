{-# LANGUAGE DataKinds #-}
-----------------------------------------------------------------------------
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
module THREE.Vector3
  ( -- * Types
    Vector3 (..)
    -- * Constructors
  , THREE.Vector3.new
    -- * Read-only properties
    -- * Properties
    -- * Optional properties
    -- * Methods
    -- * Helper functions
  , vector3ToXYZ
  , setXYZ
  ) where
-----------------------------------------------------------------------------
import           Control.Monad (void)
import           Language.Javascript.JSaddle hiding (new)
-----------------------------------------------------------------------------
import           THREE.Internal as THREE
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/math/Vector3
newtype Vector3 
  = Vector3
  { unVector3 :: JSVal
  } deriving (MakeObject, ToJSVal, MakeArgs, X, Y, Z)
-----------------------------------------------------------------------------
instance FromJSVal Vector3 where
  fromJSVal = pure . Just . Vector3
-----------------------------------------------------------------------------
new :: Double -> Double -> Double -> THREE.Three Vector3
new x_ y_ z_ = THREE.new Vector3 "Vector3" (x_, y_, z_)
-----------------------------------------------------------------------------
setXYZ :: Double -> Double -> Double -> Vector3 -> THREE.Three ()
setXYZ x_ y_ z_ (Vector3 v) =
  void $ v # ("set" :: JSString) $ (x_, y_, z_)
-----------------------------------------------------------------------------
vector3ToXYZ :: Vector3 -> JSM (Double, Double, Double)
vector3ToXYZ (Vector3 v) = do
  x_ <- fromJSValUnchecked =<< v ! ("x" :: JSString)
  y_ <- fromJSValUnchecked =<< v ! ("y" :: JSString)
  z_ <- fromJSValUnchecked =<< v ! ("z" :: JSString)
  pure (x_, y_, z_)
-----------------------------------------------------------------------------
instance Triplet Vector3 where
  triplet (Vector3 j) = pure j
-----------------------------------------------------------------------------

