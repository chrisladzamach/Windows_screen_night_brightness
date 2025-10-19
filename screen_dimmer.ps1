Add-Type -AssemblyName PresentationCore,PresentationFramework

Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Win32 {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern int GetWindowLong(IntPtr hWnd, int nIndex);

    [DllImport("user32.dll", SetLastError = true)]
    public static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);

    public const int GWL_EXSTYLE = -20;
    public const int WS_EX_TRANSPARENT = 0x00000020;
    public const int WS_EX_LAYERED = 0x00080000;
}
"@

$global:windowVisible = $false
$global:window = $null

function Show-Dimmer {
    if ($global:window -ne $null) { return }

    $overlay = New-Object Windows.Shapes.Rectangle
    $overlay.Fill = 'Black'
    $overlay.Opacity = 0.6

    $window = New-Object Windows.Window
    $window.WindowStyle = 'None'
    $window.AllowsTransparency = $true
    $window.Background = 'Transparent'
    $window.Topmost = $true
    $window.Content = $overlay

    $window.Show()
    Start-Sleep -Milliseconds 200

    $hwnd = [System.Windows.Interop.WindowInteropHelper]::new($window).Handle
    $exStyle = [Win32]::GetWindowLong($hwnd, [Win32]::GWL_EXSTYLE)
    [Win32]::SetWindowLong($hwnd, [Win32]::GWL_EXSTYLE, $exStyle -bor [Win32]::WS_EX_TRANSPARENT -bor [Win32]::WS_EX_LAYERED) | Out-Null

    $window.WindowState = 'Maximized'

    $window.Add_KeyDown({
        if ($_.Key -eq 'Escape') {
            $window.Close()
            $global:window = $null
            $global:windowVisible = $false
        }
    })

    $global:window = $window
    $global:windowVisible = $true
}

function Hide-Dimmer {
    if ($global:window -ne $null) {
        $global:window.Close()
        $global:window = $null
        $global:windowVisible = $false
    }
}

Write-Host "Presiona Ctrl + Alt + F para activar/desactivar el brillo bajo. (Escape para salir)"

while ($true) {
    Start-Sleep -Milliseconds 100

    $ctrl = [System.Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::LeftCtrl) -or
            [System.Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::RightCtrl)
    $alt = [System.Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::LeftAlt) -or
           [System.Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::RightAlt)
    $f = [System.Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::F)

    if ($ctrl -and $alt -and $f) {
        if ($global:windowVisible) {
            Hide-Dimmer
        } else {
            Show-Dimmer
        }
        Start-Sleep -Milliseconds 500
    }
}
