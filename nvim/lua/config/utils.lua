Opts = {
  noremap = true,
  silent = true,
}

P = function (v)
  print(vim.inspect(v))
  return v
end

RELOAD = function (...) return (require("plenary.reload").reload_module(...)) end

R = function (name)
  RELOAD(name)
  return require(name)
end

local M = {}
M.a = 1

M.is_dark_mode = function ()
  local os_name = vim.fn.system("uname")
  if vim.fn.match(os_name, "Darwin") >= 0 then
    local result = vim.fn.system(
      "defaults read -g AppleInterfaceStyle 2>/dev/null | tr -d '\n'")
    return result == "Dark"
  end
  return false
end

M.set_yaml_key = function (path, key, value)
  local cmd = string.format("yq -i '.%s.value = %s' %s", key,
    vim.fn.shellescape(vim.fn.json_encode(value)),
    vim.fn.shellescape(path))
  os.execute(cmd)
end

M.read_yaml = function (path)
  local co = coroutine.create(function ()
    local cmd = string.format("yq -o=json '.' %s 2>/dev/null",
      vim.fn.shellescape(path))
    local handle = io.popen(cmd)
    local result = handle and handle:read("*a") or ""
    handle:close()

    if result == "" then
      vim.notify("Failed to read or parse YAML file at: " .. path .. "\n Is 'yq' installed?", vim.log.levels.ERROR)
      return nil
    end

    local a = vim.fn.json_decode(result)
    return a
  end)

  local success, result = coroutine.resume(co)
  if not success then
    vim.notify("Coroutine failed: " .. result, vim.log.levels.ERROR)
    return nil
  end

  return result
end

return M
