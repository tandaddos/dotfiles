return {
	"preservim/tagbar",
	cmd = {"Tagbar", "TagbarClose", "TagbarToggle", "TagbarForceUpdate",
		"TagbarJump", "TagbarJumpNext", "TagbarJumpPrevious"},
	keys = {
		{'<F8>', '<cmd>TagbarToggle<cr>', desc = 'Tagbar'},
	},
	config = function ()
		local tagbar_position ='leftabove vertical'
	end,
}

