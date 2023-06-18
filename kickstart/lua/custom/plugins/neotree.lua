return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "NeoTree",
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not required, recommended only
		"MunifTanjim/nui.nvim",
	},

	keys = {
		{'<leader>nt', '<cmd>Neotree toggle<cr>',			desc = 'NeoTree'},
		{'<leader>nf', '<cmd>Neotree filesystem focus toggle<cr>',	desc = 'toggle show filesystem'},
		{'<leader>nb', '<cmd>Neotree buffers focus<cr>',		desc = 'show open buffers'},
		{'<leader>ng', '<cmd>Neotree git_files focus<cr>',		desc = 'show git files'},
	},

	config = {
		filesystem = {
			follow_current_file = true,
			hijack_netrw_behavior = "open_current",
		},
	},
}
