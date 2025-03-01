local function get_module_path()
  -- Get info about the currently running function (this function)
  local info = debug.getinfo(1, "S")
  -- Extract the filename from the source path
  local module_path = info.source:sub(2) -- Remove the '@' prefix
  -- Get the directory containing the module
  return vim.fn.fnamemodify(module_path, ":h")
end

-- require all the files in the directory
local function require_all(directory)
  local files = vim.fn.glob(directory .. "/*.lua", false, true)
  -- Extract the module prefix from the directory
  local module_prefix = directory:match(".*lua/(.*)$") or ""
  if module_prefix ~= "" then
    module_prefix = module_prefix:gsub("/", ".") .. "."
  end

  for _, file in ipairs(files) do
    -- omit init.lua
    if file:match("init%.lua$") then
      goto continue
    end
    local name = file:match("([^/]+)%.lua$")
    local module_path = module_prefix .. name
    require(module_path)

    ::continue::
  end
end

-- current dir relative to runtime
local current_dir = get_module_path()

require_all(current_dir)
