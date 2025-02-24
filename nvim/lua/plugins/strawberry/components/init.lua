local components = {}

components.custom_menu = require("plugins.strawberry.components.custom_menu")
components.git_worktree_recent_files = require(
  "plugins.strawberry.components.recent_files_git_worktree")
components.recent_files = require("plugins.strawberry.components.recent_files")
components.active_buffers = require(
  "plugins.strawberry.components.active_buffers")
components.git_modified = require("plugins.strawberry.components.git_modified")

return components
