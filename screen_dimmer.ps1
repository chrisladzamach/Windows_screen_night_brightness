Add-Type -AssemblyName PresentationCore,PresentationFramework

$overlay = New-Object Windows.Shapes.Rectangle
$overlay.Fill = 'Black'
$overlay.Opacity = 0.6

$window = New-Object Windows.Window
$window.WindowStyle = 'None'
$window.AllowsTransparency = $true
$window.Background = 'Transparent'
$window.Topmost = $true
$window.WindowState = 'Maximized'
$window.Content = $overlay

$window.Add_KeyDown({
    if ($_.Key -eq 'Escape') {
        $window.Close()
    }
})

$window.ShowDialog()
