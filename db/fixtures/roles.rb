Role.seed do |s|
  s.id = 1
  s.name = "超级管理员"
  s.description = "拥有前台和后台的所有管理权限"
  s.sort = 1
end

Role.seed do |s|
  s.id = 2
  s.name = "管理员"
  s.description = "拥有前台和后台的部分管理权限"
  s.sort = 2
end

Role.seed do |s|
  s.id = 3
  s.name = "普通用户"
  s.description = "拥有前台部分权限"
  s.sort = 3
end