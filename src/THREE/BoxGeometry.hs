-----------------------------------------------------------------------------
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleInstances #-}
-----------------------------------------------------------------------------
module THREE.BoxGeometry
  ( -- * Types
    BoxGeometry (..)
  , THREE.BoxGeometry.new
  ) where
-----------------------------------------------------------------------------
import           Language.Javascript.JSaddle hiding (new)
-----------------------------------------------------------------------------
import           THREE.BufferGeometry (BufferGeometryClass)
import           THREE.Internal as THREE
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/geometries/BoxGeometry
newtype BoxGeometry
  = BoxGeometry
  { unBoxGeometry :: JSVal
  } deriving (MakeArgs, MakeObject, ToJSVal) 
    deriving newtype BufferGeometryClass
-----------------------------------------------------------------------------
new
  :: (Double,Double,Double)
  -> THREE.Three BoxGeometry
new = THREE.new BoxGeometry "BoxGeometry"
-----------------------------------------------------------------------------


-- not a good idea: BoxGeometry really has a `parameters` property so its fields can be read/write

data Params = Params 
  { _width :: Double
  , _height :: Double
  , _widthSegments :: Int
  , _heightSegments :: Int
  , _depthSegments :: Int
  } 

instance MakeArgs Params where
  makeArgs (Params w h ws hs ds) = makeArgs (w, h, ws, hs, ds)

def :: Params 
def = Params 1 1 1 1 1

newBox1 :: Params -> THREE.Three BoxGeometry
newBox1 = THREE.new BoxGeometry "BoxGeometry"

test1 :: THREE.Three ()
test1 = do
  b1 <- newBox1 def
  b2 <- newBox1 def { _width=2, _height=2 }
  pure ()

-- better:
-- parametersWidth = prop "parameters.width"
-- ...

class BoxClass a
instance BoxClass ()
instance BoxClass Double
instance BoxClass (Double, Double)
instance BoxClass (Double, Double, Int)
instance BoxClass (Double, Double, Int, Int)
instance BoxClass (Double, Double, Int, Int, Int)

newBox2 :: (MakeArgs a, BoxClass a) => a -> THREE.Three BoxGeometry
newBox2 = THREE.new BoxGeometry "BoxGeometry"

test2 :: THREE.Three ()
test2 = do
  b1 <- newBox2 ()
  b2 <- newBox2 (2::Double, 2::Double)
  pure ()



