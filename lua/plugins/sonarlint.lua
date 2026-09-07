return {
  {
    "danarth/sonarlint.nvim",
    ft = { "java", "python" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-jdtls", -- requerido para filetype "java"
    },
    opts = {
      server = {
        cmd = {
          "sonarlint-language-server",
          "-stdio",
          "-analyzers",
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjavasymbolicexecution.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
        },
        settings = {
          sonarlint = {
            -- Reglas de Sonar activadas explicitamente (ya conocidas por el equipo).
            rules = {
              -- Metodos no deben exceder 30 lineas
              ["java:S138"] = { level = "on", parameters = { max = "30" } },
              -- Indentacion consistente (la que veniamos corrigiendo)
              ["java:S1120"] = { level = "on" },
              -- Complejidad ciclomatica de metodos
              ["java:S3776"] = { level = "on" },
              -- Numero maximo de parametros
              ["java:S107"] = { level = "on", parameters = { max = "7" } },
            },
          },
        },
      },
      filetypes = { "java", "python" },
    },
    config = function(_, opts)
      require("sonarlint").setup(opts)
    end,
  },
}
