{ config, pkgs, ...}:
imports = [nixvim.homeManagerModules.nixvim]
{
	programs.nixvim = {
		enable = true;
		colorschemes.catppuccin.enable = true;
		options = {
			number = true;
			relativenumber = true;
			shiftwidth = 2;
			tabstop = 2;
			globals.mapleader = " ";
		};

		plugins = {
			lualine.enable = true;
			bufferline.enable = true;
			treesitter.enable = true;
			trouble.enable = true;
			luasnip.enable = true;
			noice.enable = true;
			lua-ls.enable = true;
			nix.enable = true;
			cmp-nvim-lsp.enable = true;
			cmp-buffer.enable = true;
			cmp-path.enable = true;
			cmp_luasnip.enable = true;
			cmp-cmdline.enable = true;
		
			telescope = {
				enable = true;
				extensions.fzf-native.enable = true;
			};

			## Start of a beast
			
			none-ls = {
				enable = true;
				sources = {
					code_actions = {
						gitsigns.enable = true;
					};
					diagnostics = {
						pylint.enable = true;
					};
					formatting = {
						shfmt.enable = true;
						nixpkgs_fmt.enable = true;
						prettier.enable = true;
						stylua.enable = true;
						alejandra.enable = true;
					};
					completion = {
						luasnip.enable = true;
						spell.enable = true;
					};
				};
			};
			
			## End of a beast
			
			notify = {
				enable = true;
				backgroundColour = "#1e1e2e#";
				fps = 60;
				timeout = 500;
			};

			lint = {
				enable = true;
				lintersByFt = {
					text = ["vale"];
					json = ["jsonlint"];
					markdown = ["vale"];
				};
			};
			
			neotree = {
				enable = true;
				enableDiagnostics = true;
				enableGitStatus = true;
				enableModifiedMarkers = true;
			};

			lsp = {
				enable = true;
				servers = {
					tsserver.enable = true;
					cssls.enable = true;
					html.enable = true;

					pyright.enable = true;
					marksman.enable = true;
					nil-ls.enable = true;
					bashls.enable = true;
					clangd.enable = true;
				};
			};
			
			cmp = {
				enable = true;
				settings.autoEnableSources = true;
				snippet.expand = "luasnip";
				window.completion.border = "solid";
				window.documentation.border = "solid";
				sources = [
					{ name = "nvim_lsp"; }
					{ name = "emoji"; }
					{
						name = "buffer";
						option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
						keywordLength = 3;
					}
					{ name = "path"; keywordLength = 3; }
					{ name = "luasnip"; keywordLength = 3; }
				];

				mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
			};
		};

  extraConfigLua = ''
    require("telescope").load_extension("lazygit")

    luasnip = require("luasnip")

    local cmp = require'cmp'

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({'/', "?" }, {
      sources = {
        { name = 'buffer' }
      }
    })

    -- Set configuration for specific filetype.
     cmp.setup.filetype('gitcommit', {
       sources = cmp.config.sources({
         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
       }, {
         { name = 'buffer' },
       })
     })

     -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
     cmp.setup.cmdline(':', {
       sources = cmp.config.sources({
         { name = 'path' }
       }, {
         { name = 'cmdline' }
       }),
  --      formatting = {
  --       format = function(_, vim_item)
  --         vim_item.kind = cmdIcons[vim_item.kind] or "FOO"
  --       return vim_item
  --      end
  -- }
       })  '';
	};
}
