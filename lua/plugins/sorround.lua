return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    init = function()
      vim.g.nvim_surround_no_normal_mappings = true
      vim.g.nvim_surround_no_visual_mappings = true
    end,
    config = function()
      require("nvim-surround").setup()

      vim.keymap.set("n", "sa", "<Plug>(nvim-surround-normal)")
      vim.keymap.set("n", "sd", "<Plug>(nvim-surround-delete)")
      vim.keymap.set("n", "sr", "<Plug>(nvim-surround-change)")
      vim.keymap.set("x", "sa", "<Plug>(nvim-surround-visual)")
    end,
  },
}
