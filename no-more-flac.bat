@echo off
setlocal enabledelayedexpansion

set "inputDir=C:\Users\#PATH to flac files"
set "outputDir=C:\Users\#PATH for the waw files"
set "ffmpegPath=C:\Users\#PATH to ffmpeg.exe\ffmpeg-7.1-essentials_build\ffmpeg-7.1-essentials_build\bin\ffmpeg.exe"

for /r "%inputDir%" %%f in (*.flac) do (
    rem Get the relative path by removing the input directory path
    set "relativePath=%%~dpf"
    set "relativePath=!relativePath:%inputDir%\=!"

    rem Set output file path with preserved folder structure
    set "outputDirPath=%outputDir%\!relativePath!"
    set "outputFile=!outputDirPath!%%~nf.wav"

    rem Create the necessary folder structure if it doesn't exist
    if not exist "!outputDirPath!" mkdir "!outputDirPath!"
    
    rem Convert the FLAC file to WAV
    "%ffmpegPath%" -i "%%f" "!outputFile!"
)

echo Conversion complete!
pause
