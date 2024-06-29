local function get_home_path() return os.getenv("HOME") end

local function remove_home_path(file)
  local home = get_home_path()
  return string.gsub(file, home .. "/", "")
end

local function get_filename(path)
  local pattern = "/([^/]+)$"
  return path:match(pattern) or "-"
end

local M = {
  get_home_path = get_home_path,
  remove_home_path = remove_home_path,
  get_filename = get_filename,
}

return M
