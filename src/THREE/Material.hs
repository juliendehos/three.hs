-----------------------------------------------------------------------------
{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DerivingVia                #-}
{-# LANGUAGE OverloadedStrings          #-}
-----------------------------------------------------------------------------
module THREE.Material
  ( -- * Types
    Material (..)
    -- * Constructors
    -- * Read-only Properties
    -- * Properties
    -- * Optional properties
    -- * Methods
  ) where
-----------------------------------------------------------------------------
import           Language.Javascript.JSaddle
-----------------------------------------------------------------------------
import           THREE.Color as THREE
import           THREE.Constants.BlendingEquations as THREE
import           THREE.Constants.DestinationFactors as THREE
import           THREE.Constants.SourceFactors as THREE
import           THREE.EventDispatcher as THREE
import           THREE.Internal as THREE
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/materials/Material
class (EventDispatcher material, ToJSVal material, MakeObject material) => Material material where
  isMaterial :: ReadOnly material Bool
  isMaterial = THREE.readonly "isMaterial"

  alphaHash :: Property material Bool
  alphaHash = property "alphaHash" 
  alphaTest :: Property material Double
  alphaTest = property "alphaTest" 
  alphaToCoverage :: Property material Bool
  alphaToCoverage = property "alphaToCoverage" 
  blendAlpha :: Property material Double
  blendAlpha = property "blendAlpha" 
  blendColor :: Property material Color
  blendColor = property "blendColor" 
  blendDst :: Property material (Maybe DestinationFactors)
  blendDst = optional "blendDst" 
  blendDstAlpha :: Property material (Maybe DestinationFactors)
  blendDstAlpha = optional "blendDstAlpha" 
  blendEquation :: Property material BlendingEquations
  blendEquation = property "blendEquation" 
  blendEquationAlpha :: Property material (Maybe BlendingEquations)
  blendEquationAlpha = optional "blendEquationAlpha" 
  -- TODO blending

  blendSrc :: Property material SourceFactors
  blendSrc = property "blendSrc" 
  blendSrcAlpha :: Property material SourceFactors
  blendSrcAlpha = property "blendSrcAlpha" 
  -- TODO clipIntersection...

-----------------------------------------------------------------------------
instance Material JSVal
-----------------------------------------------------------------------------

