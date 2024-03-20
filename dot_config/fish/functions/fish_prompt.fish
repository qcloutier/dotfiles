fish_config prompt choose informative_vcs

function fish_right_prompt -d "Write out the right prompt"
    if test -n "$AWS_VAULT"
        set_color yellow
        printf "  %s" $AWS_VAULT
        set_color normal
    end
    if test -n "$KUBIE_ACTIVE"
        set_color cyan
        printf " 󱃾 %s/%s" (kubie info ctx 2>/dev/null) (kubie info ns 2>/dev/null)
        set_color normal
    end
end
