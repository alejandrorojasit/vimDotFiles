return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Browser/Finder group {{
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { 
            {'nvim-lua/plenary.nvim'}
        } -- Telescope &  Plenary 
    }
    use {
        'nvim-telescope/telescope-file-browser.nvim',
        requires = { 
            {'nvim-telescope/telescope.nvim'}, 
            {'nvim-lua/plenary.nvim' }
        }
    } -- Telescope File Browser
    use 'olacin/telescope-cc.nvim' -- Telescope conventional commits
    use 'nvim-telescope/telescope-dap.nvim' -- Telescope DAP 
    use 'nvim-telescope/telescope-packer.nvim' -- Telescope Packer
    use 'fhill2/telescope-ultisnips.nvim' -- Teslescope UltiSnips
    --END }}

    -- Appearence Group {{
    use 'tjdevries/colorbuddy.nvim' --Color Buddy
    use 'luisiacc/gruvbox-baby' -- Gruvbox color scheme 
    use 'sainnhe/gruvbox-material' -- GruvBox color scheme
    use 'ellisonleao/gruvbox.nvim' -- GruvBox color scheme
    use 'nvim-treesitter/nvim-treesitter' -- Nvim TreeSitter Highlight
    use 'nvim-treesitter/playground' -- Treesitter playground
    use 'nvim-lualine/lualine.nvim' -- Statusline
    use 'p00f/nvim-ts-rainbow' -- Rainbow parenthesis
    use 'lukas-reineke/indent-blankline.nvim' -- Indent lines 
    use 'cpea2506/one_monokai.nvim' -- OneMonokai color scheme
    use 'marko-cerovac/material.nvim' -- Material color scheme
    use { "bluz71/vim-nightfly-colors", as = "nightfly" } -- Nightfly color scheme
    use {'nyoom-engineering/oxocarbon.nvim'} -- Oxocarbon color scheme
    use 'mhartington/oceanic-next' -- Oceanic-next color scheme
    use({
        'glepnir/zephyr-nvim',
        requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
    }) -- Zephyr color scheme
    use 'Th3Whit3Wolf/onebuddy' -- OneBuddy color scheme
    use 'navarasu/onedark.nvim' -- OneDark color scheme
    use 'rebelot/kanagawa.nvim' -- Kanagawa color scheme
    use { 'embark-theme/vim', as = 'embark' } -- Embark color scheme
    use 'nyngwang/nvimgelion' -- NvimGelion color scheme
    use 'svrana/neosolarized.nvim' -- NeoSolarized color scheme
    use 'nvim-tree/nvim-web-devicons' -- Nvim WebDevIcons
    use 'folke/tokyonight.nvim' -- Tokionight color scheme
    use 'wincent/terminus' -- Gui cursor on terminal mode
    -- END}}

    -- LSP group {{
    use 'neovim/nvim-lspconfig' -- LSP configs for nVim  
    use {
        'glepnir/lspsaga.nvim',
        dependencies = {
            {'nvim-tree/nvim-web-devicons'},
            --Please make sure you install markdown and markdown_inline parser
            {'nvim-treesitter/nvim-treesitter'}
        }
    } -- Configurations for Nvim LSP--
    use 'mfussenegger/nvim-jdtls' -- Java lsp bundle 
    use 'mfussenegger/nvim-lint' -- LSP linter
    use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' -- LSP lines 
    -- END}}

    -- Auto Completion/Snippets Group {{
    use 'hrsh7th/nvim-cmp' -- Auto completion
    use 'hrsh7th/cmp-nvim-lsp' -- Nvim lsp source for language server completion
    use 'hrsh7th/cmp-buffer' -- Provides buffer source for completion form the opened buffer
    use 'hrsh7th/cmp-path' -- Provides patch source for the completions of filepaths 
    use 'hrsh7th/cmp-cmdline' -- Provides cmdlie source for vim's commands
    use 'hrsh7th/cmp-nvim-lsp-signature-help' -- Provides signature source help
    use 'hrsh7th/cmp-nvim-lua' -- Provides LUA suggestions
    use 'hrsh7th/cmp-calc' -- Provices calc suggestions for mathematical
    use 'SirVer/ultisnips' -- UltiSnips 
    use 'honza/vim-snippets' -- Extra snippets integrates utilsnips
    use 'quangnguyen30192/cmp-nvim-ultisnips' -- Provides utilsnips sources to put the list of available snippets
    use 'zbirenbaum/copilot.lua'  --GitHub copilot lua
    use 'zbirenbaum/copilot-cmp'-- GitHub copilot cmp
    -- END}}

    -- Behavior Group {{
    use 'windwp/nvim-autopairs' -- Auto pairs
    use 'windwp/nvim-ts-autotag' -- Auto tags
    use 'kylechui/nvim-surround' -- Surround plugin
    -- END}}

    -- Motion group {{
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require'hop'.setup {}
        end
    } -- Hope jump
    -- END}}

    -- Git group {{
    use 'lewis6991/gitsigns.nvim' -- Git icons for status of files
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' } --Git diff and merge tool
    -- END}}

    -- Debbug group{{
    use 'mfussenegger/nvim-dap' -- Debbug plugin
    use 'rcarriga/nvim-dap-ui' -- DAP UI
    use { 'mxsdev/nvim-dap-vscode-js', requires = {'mfussenegger/nvim-dap'} } -- Dap adapter for vscode-js-debug
    use {
        'microsoft/vscode-js-debug',
        opt = true,
        run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out' 
    } -- VScode debugger for DAP vscode-js-debug
    use { 'michaelb/sniprun', run = 'bash ./install.sh'} -- SpinRun debbug tool
    -- END}}

    -- Test group {{
    use {
        'nvim-neotest/neotest',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'antoinemadec/FixCursorHold.nvim',
            'nvim-neotest/neotest-go', -- NeoTest Adapter for Go tests
            'nvim-neotest/neotest-python', --NeoTest Adapter for Python tests
            'haydenmeade/neotest-jest' -- NeoTest Adapter for Jets tests
        }
    }
    use 'ray-x/go.nvim' -- Go bundle for nVim testing, coverage, build, etc...
    use'andythigpen/nvim-coverage' -- Coverage PlugIn
    -- END}}

    -- Enhancement Group {{
    use 'folke/neodev.nvim' -- Full signature help and docs for lua API
    use 'gennaro-tedesco/nvim-jqx' -- Json quick fix
    -- END}}

    -- Organizaction Group {{
    use 'nvim-orgmode/orgmode' -- OrgMode agenda
    use 'akinsho/org-bullets.nvim' -- Better Org Bullets
    -- END}}

    -- Markdown Group {{
    --use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
    use "iamcco/markdown-preview.nvim"
    -- END}}

    -- Register Group {{
    use 'AckslD/nvim-neoclip.lua'
    -- }}

    -- Utils Group {{
    use "potamides/pantran.nvim" --Live translate

    use "nvim-pack/nvim-spectre" --Spectre global replacer
    -- }}
end)
