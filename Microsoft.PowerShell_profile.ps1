#设置变量
# 如果设置的是用户变量可以不传scope参数
function EditVariable{
    [CmdletBinding()]
   Param(
        [string]$name,
        [string]$value,
        [string]$scope = "User"
   )
  [Environment]::SetEnvironmentVariable($name,$value,$scope)
}

# 设置环境变量
# 用法：EditPath -path C:\Program Files\software\bin -scope User
# User是配置用户变量，如果要配置系统变量就使用Machine
# 如果设置的是用户变量可以不传scope参数，直接传path就行
function AddPath{
    [CmdletBinding()]
   Param(
        [string]$path,
        [string]$scope = "User"
   )
  $p=[Environment]::GetEnvironmentVariable("Path",$scope)
  EditVariable -name Path -value "$p;$path" -scope $scope
}

#删除环境变量
function DelPath{
    [CmdletBinding()]
   Param(
        [string]$path,
        [string]$scope = "User"
   )
  $p=[Environment]::GetEnvironmentVariable("Path",$scope)
  $pp=$p.Replace(";$path","")
  EditVariable -name Path -value $pp -scope $scope
}
