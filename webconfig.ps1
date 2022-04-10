$WebConfigFile = '\web.config'



$xml = [xml](Get-Content $WebConfigFile)



$Dictionary = @{
   
		XXXX
              key = values
		
}



foreach($key in $Dictionary.Keys)

{

    Write-Host "Locating key: '$key' in XML"

    if(($addKey = $xml.SelectSingleNode("//appSettings/add[@key = '$key']")))

    {

        Write-Host "Found key: '$key' in XML, updating value to $($Dictionary[$key])"

        $addKey.SetAttribute('value',$Dictionary[$key])
    }
   }
    $Dictionary = @{

   
    FtpServer = '.com';
	UserId = '';
	PasswordKey =''
    
 
}



foreach($key in $Dictionary.Keys)

{

    Write-Host "Locating key: '$key' in XML"
	
	if(($addKey = $xml.SelectSingleNode("//sssFTPSERVER/ServerSetting/add[@key = '$key']")))
   {
        Write-Host "Found key: '$key' in XML, updating value to $($Dictionary[$key])"
        
         $addKey.SetAttribute('value',$Dictionary[$key])
    }
}
	
	$Dictionary = @{

   
    FtpServer = '';
	UserId = '';
	PasswordKey =''
    
}



foreach($key in $Dictionary.Keys)

{

    Write-Host "Locating key: '$key' in XML"

    if(($addKey = $xml.SelectSingleNode("//FTPSERVER/ServerSetting/add[@key = '$key']")))
   {
        Write-Host "Found key: '$key' in XML, updating value to $($Dictionary[$key])"
        
        $addKey.SetAttribute('value',$Dictionary[$key])
    }
}
	
	
	$Dictionary = @{

   
    
    FtpServer = 'com';
	UserId = '';
	PasswordKey =''
   
}



foreach($key in $Dictionary.Keys)

{

    Write-Host "Locating key: '$key' in XML"

    if(($addKey = $xml.SelectSingleNode("//ddFTPSERVER/ServerSetting/add[@key = '$key']")))
    {
         Write-Host "Found key: '$key' in XML, updating value to $($Dictionary[$key])"
         
         $addKey.SetAttribute('value',$Dictionary[$key])
     }
    }
	 
	 $Dictionary = @{

   
    FtpServer = '.com"';
	UserId = '';
	PasswordKey ='add pwd here'    

    
}



foreach($key in $Dictionary.Keys)

{

    Write-Host "Locating key: '$key' in XML"
	 

     if(($addKey = $xml.SelectSingleNode("//lala/ServerSetting/add[@key = '$key']")))
    {
         Write-Host "Found key: '$key' in XML, updating value to $($Dictionary[$key])"
         
         $addKey.SetAttribute('value',$Dictionary[$key])
     }
}



$xml.Save($WebConfigFile)
