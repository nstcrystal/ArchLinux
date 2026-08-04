function down_mp3 --wraps='yt-dlp -x --audio-format mp3' --description 'alias down_mp3=yt-dlp -x --audio-format mp3'
    yt-dlp -x --audio-format mp3 $argv
end
