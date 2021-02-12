$name_file="3.txt"
$disk=get-wmiobject Win32_LogicalDisk | where {$_.drivetype -eq 3}
$disk | foreach {
	$name_disk=$_.deviceid+"\*"
	get-childitem $name_disk -recurse -Filter $name_file -force
} | Foreach {
	$path_file=$_.DirectoryName+"\"+$name_file
	Start notepad $path_file
}
Pause