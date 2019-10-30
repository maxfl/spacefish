#
# Fish history
#

function __sf_section_fish_history -d "Format the displayed branch name"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_FISH_HISTORY_SHOW true
	__sf_util_set_default SPACEFISH_FISH_HISTORY_PREFIX $SPACEFISH_GIT_SYMBOL
	__sf_util_set_default SPACEFISH_FISH_HISTORY_SUFFIX ":"
	__sf_util_set_default SPACEFISH_FISH_HISTORY_COLOR cyan

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $SPACEFISH_FISH_HISTORY_SHOW = false ]; and return

	[ -z $fish_history ]; and return

	__sf_lib_section \
		$SPACEFISH_FISH_HISTORY_COLOR \
		$SPACEFISH_FISH_HISTORY_PREFIX$fish_history$SPACEFISH_FISH_HISTORY_SUFFIX
end
