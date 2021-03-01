Set objLocator = CreateObject("WbemScripting.SWbemLocator")
Set objWMIService = objLocator.ConnectServer(".", "root\cimv2")
 
Set HostNameSet = objWMIService.ExecQuery("Select * From Win32_NetworkAdapterConfiguration WHERE IPEnabled = True")
 
For Each objitem in HostNameSet
    Str = vbNullString
    
    If NOT IsNULL(objItem.IPAddress)Then
        
        Str = Str & "IP, Gateway: " & Join(objItem.IPAddress, ",") & VbCrLf
    End If

    If NOT IsNULL(objItem.IPSubnet)Then
        
        Str = Str & "Subnet Mask: " & Join(objItem.IPSubnet, ",")
    End If
 
    Set fso=CreateObject("Scripting.FileSystemObject")
    Set f=FSO.OpenTextFile("7.txt", 2, True)
    f.WriteLine (Str)
    Set rf=CreateObject("Wscript.Shell")
    rf.Run("7.txt")
Next