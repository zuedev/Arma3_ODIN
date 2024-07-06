$PublisherCMD = "C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools\Publisher\PublisherCmd.exe"

Write-Host "Running HEMTT Release" & hemtt release --no-archive --expsqfc

if (Test-Path "steam\workshop_id.txt") {
    $workshopId = Get-Content "steam\workshop_id.txt"

    Write-Host "Running Arma 3 Tools PublisherCmd" & $PublisherCMD update /id:$workshopId /path:.hemttout\release\ /changeNote:"automated release"
}