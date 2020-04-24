{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
module Utils where

import GHC.TypeLits
import GHC.Types

-- We want to make sure that everything is fully applied as otherwise it will typecheck but
-- render incorrectly.
type family F a :: Constraint where
  F (a -> b) = TypeError (Text "Unsaturated: " :<>: ShowType (a ->b) )
  F a = ()

wrap :: F a => a -> a
wrap a = a
