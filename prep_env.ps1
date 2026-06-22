$env:CUDA_PATH = "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8"
$env:CUDA_HOME = $env:CUDA_PATH
$env:PATH = "$env:CUDA_PATH\bin;$env:PATH"

function Invoke-VcVars {
    $tempFile = [System.IO.Path]::GetTempFileName()
    cmd /c "`"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat`" x64 -vcvars_ver=14.28 && set > `"$tempFile`""
    Get-Content $tempFile | ForEach-Object {
        if ($_ -match '^(.*?)=(.*)$') {
            Set-Item -Path "env:$($Matches[1])" -Value $Matches[2]
        }
    }
    Remove-Item $tempFile
}
Invoke-VcVars

$env:CUDAHOSTCXX = (Get-Command cl.exe).Source
$env:DISTUTILS_USE_SDK = 1
