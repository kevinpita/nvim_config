local lsp = require 'vim.lsp'
local api = vim.api

local M = {}

local key_mappings = {
    {
        "code_action", "n", "<leader>a",
        "<Cmd>lua require'jdtls'.code_action()<CR>"
    }, {
        "code_action", "n", "<leader>ra",
        "<Cmd>lua require'jdtls'.code_action(false, 'refactor')<CR>"
    }, {
        "code_action", "v", "<leader>a",
        "<Esc><Cmd>lua require'jdtls'.code_action(true)<CR>"
    }, {
        "code_action", "v", "<leader>ra",
        "<Esc><Cmd>lua require'jdtls'.code_action(true, 'refactor')<CR>"
    }
}

local function on_init(client)
    if client.config.settings then
        client.notify('workspace/didChangeConfiguration',
                      {settings = client.config.settings})
    end
end

local function on_attach(client, bufnr)
    api.nvim_buf_set_var(bufnr, "lsp_client_id", client.id)
    api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    api.nvim_buf_set_option(bufnr, "bufhidden", "hide")
    api.nvim_command("setlocal signcolumn=yes")

    local opts = {silent = true}
    for _, mappings in pairs(key_mappings) do
        local capability, mode, lhs, rhs = unpack(mappings)
        if client.resolved_capabilities[capability] then
            api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end
    end
    --[[ api.nvim_buf_set_keymap(bufnr, "n", "<leader>r",
                            "<Cmd>lua vim.lsp.buf.rename(vim.fn.input('New Name: '))<CR>",
                            opts) ]]
    if client.resolved_capabilities['document_highlight'] then
        api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
        api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
        api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
    end
end

local function mk_config()
    local capabilities = lsp.protocol.make_client_capabilities()
    capabilities.workspace.configuration = true
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {

        flags = {allow_incremental_sync = true},
        capabilities = capabilities,
        on_init = on_init,
        on_attach = on_attach
    }
end
function M.setup()
    local finders = require 'telescope.finders'
    local sorters = require 'telescope.sorters'
    local actions = require 'telescope.actions'
    local pickers = require 'telescope.pickers'

    local config = mk_config()

    vim.api.nvim_buf_set_keymap(0, "n", "<leader>a",
                                "<Cmd>lua require('jdtls').code_action()<CR>",
                                {silent = true, noremap = true})

    local root_markers = {'gradlew', 'pom.xml'}
    local root_dir = require('jdtls.setup').find_root(root_markers)
    local home = os.getenv('HOME')

    local workspace_folder = home .. "/.workspace" ..
                                 vim.fn.fnamemodify(root_dir, ":p:h:t")

    config.settings = {
        java = {
            signatureHelp = {enabled = true},
            contentProvider = {preferred = 'fernflower'},
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*", "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*"
                }
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999
                }
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                }
            },
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-11",
                        path = "/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home"
                    }, {
                        name = "JavaSE-16",
                        path = "/Library/Java/JavaVirtualMachines/adoptopenjdk-16.jdk/Contents/Home"
                    }
                }
            }
        }
    }

    config.cmd = {'jdtls', workspace_folder}

    -- TELESCOPE
    require('jdtls.ui').pick_one_async =
        function(items, prompt, label_fn, cb)
            local opts = {}
            pickers.new(opts, {
                prompt_title = prompt,
                finder = finders.new_table {
                    results = items,
                    entry_maker = function(entry)
                        return {
                            value = entry,
                            display = label_fn(entry),
                            ordinal = label_fn(entry)
                        }
                    end
                },
                sorter = sorters.get_generic_fuzzy_sorter(),
                attach_mappings = function(prompt_bufnr)
                    actions.select_default:replace(function()
                        local selection =
                            actions.get_selected_entry(prompt_bufnr)
                        actions.close(prompt_bufnr)

                        cb(selection.value)
                    end)

                    return true
                end
            }):find()
        end
    require('jdtls').start_or_attach(config)
end
return M

