return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
      },
      formatters = {
        ["google-java-format"] = {
          -- El binario nativo instalado por Mason requiere glibc >= 2.32,
          -- que Ubuntu 20.04 (glibc 2.31) no tiene. Usamos el .jar directamente
          -- (corre con cualquier JDK instalado).
          --
          -- Usamos --aosp: indenta 4 espacios normal y 8 en continuaciones
          -- (lambdas/llamadas encadenadas envueltas), igual que IntelliJ por
          -- defecto y lo que exige la regla "Indentation" de Sonar. El estilo
          -- Google por defecto usa 2/4, que generaba el warning de Sonar.
          command = "java",
          args = {
            "-jar",
            vim.fn.expand("~/.local/share/nvim/mason/packages/google-java-format/google-java-format-1.36.1-all-deps.jar"),
            "--aosp",
            "-",
          },
        },
      },
      -- google-java-format puede tardar un par de segundos en arrancar la
      -- JVM en frio; subimos el timeout por si acaso.
      default_format_opts = {
        timeout_ms = 15000,
      },
    },
  },
}
