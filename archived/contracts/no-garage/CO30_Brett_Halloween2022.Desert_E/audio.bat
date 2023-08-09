for %%a in (*.wav) do (
    echo processing %%a
    C:\Users\Brett\Desktop\ffmpeg\bin\ffmpeg.exe -i %%a -c:a libvorbis -q:a 4 %%~na.ogg
)
