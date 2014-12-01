{-# OPTIONS_GHC -fno-warn-orphans #-}
module Type.EventModel where

import Import hiding (Value)
import Database.Esqueleto (Value, unValue)

type EventModel = (Entity Event, Maybe (Entity Workout), Maybe (Entity Location), Value Int, Value Int)

instance ToJSON EventModel where
  toJSON (Entity eid e, w, l, vc, rc) = object
    [ "id"            .= eid
    , "date"          .= eventDate e
    , "workout"       .= w
    , "location"      .= l
    , "verbal_count"  .= unValue vc
    , "result_count"  .= unValue rc
    ]
