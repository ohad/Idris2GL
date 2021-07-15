{- Tian Z (ecburx@burx.vip) -}

module IdrisGL.SDL.SDL_image

import IdrisGL.DataType

{- 
    FFI 
-}

frgn : String -> String
frgn func = "C:" ++ func ++ ",sdl_image"

--

%foreign frgn "loadIMGSur"
prim_loadIMGSur : String -> AnyPtr

export
loadIMGSur : HasIO io => String -> io Sur
loadIMGSur path = pure $ MkSur $ prim_loadIMGSur path

--

%foreign frgn "loadIMG"
prim_loadIMG : AnyPtr -> String -> Int -> Int -> Int -> Int -> PrimIO ()

export
loadIMG : HasIO io => Renderer -> String -> Rect -> io ()
loadIMG (MkRenderer ren) path (MkRect x y w h) = primIO $ prim_loadIMG ren path x y w h

--

%foreign frgn "loadBMPSur"
prim_loadBMPSur : String -> AnyPtr

export
loadBMPSur : HasIO io => String -> io Sur
loadBMPSur path = pure $ MkSur $ prim_loadBMPSur path

--

%foreign frgn "loadBMP"
prim_loadBMP : AnyPtr -> String -> Int -> Int -> Int -> Int -> PrimIO ()

export
loadBMP : HasIO io => Renderer -> String -> Rect -> io ()
loadBMP (MkRenderer ren) path (MkRect x y w h) = primIO $ prim_loadBMP ren path x y w h