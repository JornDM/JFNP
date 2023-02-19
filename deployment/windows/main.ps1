# -------------
#   Main.ps1
# -------------

# This script will create a Windows Server 2019, 
# which will be used as a domaincontroller (dc) and a DNS server.
function log([string] $msg) {
    write-host $msg -ForegroundColor Yellow
}

function MaakDc {
    # Aanmaken van de VM 
    log "Aanmaken van de domeincontroller"
    vboxmanage createvm --name "epsilon" --ostype "Windows2019_64" --register 
    
    # Aanmaken en toevoegen SATA controller 
    log "Aanmaken & toevoegen SATA controller..."
    vboxmanage storagectl "epsilon" --name "SATA Controller JFNP" --add sata 
    
    # Aanmaken en toevoegen IDE controller 
    log "Aanmaken & toevoegen IDE controller..."
    vboxmanage storagectl "epsilon" --name "IDE Controller JFNP" --add ide 
    
    # Aanmaken en toevoegen nieuwe harde schijf aan VM 
    log "Aamaken nieuwe harde schijf..."
    vboxmanage createmedium disk --filename "C:\Users\jornd\VirtualBox VMs\epsilon\epsilon.vdi" --size 30000 --format vdi 
    vboxmanage storageattach "epsilon" --storagectl "SATA Controller JFNP" --device 0 --port 0 --type hdd --medium "C:\Users\jornd\VirtualBox VMs\epsilon\epsilon.vdi"
    
    # Instellen van het aantal CPU's
    log "Instellen van het aanval CPU's..."
    vboxmanage modifyvm "epsilon" --cpus 2 
    
    # Instellen van het RAM en visuele geheugen 
    log "Instellen va het RAM en visuele geheugen..."
    vboxmanage modifyvm "epsilon" --memory 1536
    vboxmanage modifyvm "epsilon" --vram 64 
    
    # Instellen netwerkadapaters
    log "Instellen netwerkadapters (Bridged Adapter)..." 
    vboxmanage modifyvm "epsilon" --nic1 hostonly --hostonlyadapter1 "VirtualBox Host-Only Ethernet Adapter #6"
    
    # Koppelen ISO aan IDE controller
    log "Koppelen van de Windows Server 2019 ISO aan de IDE Controller..."
    VBoxManage storageattach "epsilon" --storagectl "IDE Controller JFNP" --port 0 --device 0 --type dvddrive --medium "C:\Users\jornd\Desktop\bp_environment\en_windows_server_2019_x64_dvd_4cb967d8.iso"
    
    
    # VM toevoegen aan een groep
    log "Aanmaken groep 'deployment' en toevoegen van epsilon aan deze groep"
    if (Test-Path 'C:\Users\jornd\VirtualBox VMs\deployment') {
        write-host "De groep 'deployment' bestaat al, verdergaan..." -ForegroundColor Green  
    }
    else {
        vboxmanage modifyvm "epsilon" --groups "/deployment"
    }
    
    # Inschakelen biderectioneel kopieëren en drag-&-drop
    log "Inschakelen biderectioneel kopieeren en drag-&-drop"
    vboxmanage modifyvm "epsilon" --clipboard bidirectional --draganddrop bidirectional 
    
    # Uitvoeren van een unattended install
    log "Start uitvoeren unattended install"
    vboxmanage unattended install "epsilon" `
    --iso="C:\Users\jornd\Desktop\bp_environment\en_windows_server_2019_x64_dvd_4cb967d8.iso" `
    --hostname=epsilon.jfnp.local `
    --user=Administrator `
    --full-user-name=Administrator `
    --password "Test123!" `
    --install-additions `
    --additions-iso="C:\Users\jornd\Desktop\bp_environment\VBoxGuestAdditions_6.1.36.iso" `
    --country "BE" `
    --start-vm="gui" `
    --post-install-command="powershell E:\vboxadditions\VBoxWindowsAdditions.exe /S ; Set-WinUserLanguageList -LanguageList fr-BE -Force ; timeout 20 ; shutdown /r" `
    --image-index=2 `

    # # Time-out zodat virtuele machine opnieuw kan opstarten. 
    # log "Kleine time-out zodat VM weer kan heropstarten..."
    # Timeout /T 400 

    # # Overzetten configuratie script
    # vboxmanage guestcontrol "epsilon" copyto "$($PathToDCscript)" "C:\" --username "Administrator" --password "Test123!"

    # # Uitvoeren DC script
    # VBoxManage guestcontrol "epsilon" run --username "Administrator" --password "Test123!" --exe "C:\\windows\\system32\\WindowsPowerShell\v1.0\powershell.exe" -- powershell.exe /C "C:\dc.ps1" 
}


maakDc