-- {{{
module Main where
---------------------Import-------------------------
import Data.List
import Data.Char
import qualified Data.Map as Map
import qualified Data.Set as Set
import Data.Ratio                                   -- x = 5%6
import Data.Int                                     -- Int32, Int64
import System.IO
import Data.Bits                                    -- (.&.), (.|.), shiftL...
import Text.Printf                                  -- printf "%0.6f" (1.0)
import Control.Monad
import System.Directory
import System.FilePath
-- }}}

main :: IO ()
main = do
  return ()

---------------------Input---------------------------- {{{
getInteger = (\(Just (x_yzpqr,_)) -> x_yzpqr). BS.readInteger
getInt = (\(Just (x_yzpqr,_)) -> x_yzpqr). BS.readInt

getIntArray = readIntArray
getIntegerArray = readIntegerArray

readIntArray input_pqr =
    case x_yzpqr of
        Just (a_yzpqr, xs_pqr) -> a_yzpqr : readIntArray xs_pqr
        Nothing -> []
    where
        x_yzpqr = BS.readInt. BS.dropWhile isSpace $ input_pqr

readIntegerArray input_pqr =
    case x_yzpqr of
        Nothing -> []
        Just (y_zpqr, ys_pqr) -> y_zpqr : readIntegerArray ys_pqr
    where
        x_yzpqr = BS.readInteger. BS.dropWhile isSpace $ input_pqr
------------------------------------------------------ }}}
