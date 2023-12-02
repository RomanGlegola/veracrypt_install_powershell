$msi_url_link = "https://launchpad.net/veracrypt/trunk/1.26.7/+download/VeraCrypt_Setup_x64_1.26.7.msi"
$file_destination = "C:\temp\VeraCrypt_Setup_x64_1.26.7.msi"
$log_file_path = "C:\work\LogFile.log"
$targetDir = "C:\veracrypt"

function Download-From-Website {
  <#
   # This function downloads a file from the given URL and saves it to the specified local file destination.
   #
   # :Returns: Downloads file from $msi_url_link into the $file_destination directory
   # :rtype: None
   #>
    Invoke-WebRequest -Uri $msi_url_link -OutFile $file_destination
}

function Install-From-Msi {
  <#
   # This function uses msiexec to install software from an MSI file. It specifies the 
   # installation and log file directories, and sets the installation mode to quiet.
   #
   # :Returns: Install .msi file from $file_destination into $targetDir directory with 
   #     additional flags and logs installation steps into $log_file_path.
   # :rtype: None 
   #>
    Start-Process "msiexec.exe" -ArgumentList @(
        "/i `"$file_destination`"",
        "APPLICATIONROOTFOLDER=`"$targetDir`"",
        "ACCEPTLICENSE=`"YES`"",
        "/qb",
        "/L*v `"$log_file_path`""
    ) -Wait -NoNewWindow
}

Download-From-Website
Install-From-Msi
