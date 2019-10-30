#
# Prompt character
#

function __sf_section_char_vi -d "Display the prompt character and vi mode status"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_CHAR_VI_PREFIX ""
	__sf_util_set_default SPACEFISH_CHAR_VI_SUFFIX " "
	__sf_util_set_default SPACEFISH_CHAR_VI_SYMBOL "➜"
	__sf_util_set_default SPACEFISH_CHAR_VI_COLOR_SUCCESS     normal
    __sf_util_set_default SPACEFISH_CHAR_VI_COLOR_FAILURE     red -r
    __sf_util_set_default SPACEFISH_CHAR_VI_COLOR_INSERT      normal
    __sf_util_set_default SPACEFISH_CHAR_VI_COLOR_NORMAL      --background blue
    __sf_util_set_default SPACEFISH_CHAR_VI_COLOR_REPLACE_ONE --background magenta
    __sf_util_set_default SPACEFISH_CHAR_VI_COLOR_VISUAL      --background yellow

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	set -l color

	if test $sf_exit_code -eq 0
		set --append color $SPACEFISH_CHAR_VI_COLOR_SUCCESS
	else
		set --append color $SPACEFISH_CHAR_VI_COLOR_FAILURE
	end

	switch $fish_bind_mode
		case default
			set --append color $SPACEFISH_CHAR_VI_COLOR_NORMAL
		case insert
			set --append color $SPACEFISH_CHAR_VI_COLOR_INSERT
		case replace_one
			set --append color $SPACEFISH_CHAR_VI_COLOR_REPLACE_ONE
		case visual
			set --append color $SPACEFISH_CHAR_VI_COLOR_VISUAL
	end

	__sf_lib_section \
		"$color" \
		$SPACEFISH_CHAR_VI_PREFIX \
		$SPACEFISH_CHAR_VI_SYMBOL \
		$SPACEFISH_CHAR_VI_SUFFIX
end
