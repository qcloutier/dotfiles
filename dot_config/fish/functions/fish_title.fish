function fish_title
    set argv (string split ' ' $argv)
    echo $argv[1]:(prompt_pwd)
end
