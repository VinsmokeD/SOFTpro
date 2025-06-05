# Start Python HTTP server
$pythonServer = Start-Process python -ArgumentList "-m", "http.server", "8000" -NoNewWindow -PassThru

# Wait a moment for the server to start
Start-Sleep -Seconds 2

# Open the default browser to the login page
Start-Process "http://localhost:8000"

Write-Host "Server is running at http://localhost:8000"
Write-Host "Press Ctrl+C to stop the server"

try {
    # Keep the script running until Ctrl+C is pressed
    while ($true) {
        Start-Sleep -Seconds 1
    }
} finally {
    # Clean up when the script is interrupted
    if ($pythonServer) {
        Stop-Process -Id $pythonServer.Id -Force
        Write-Host "`nServer stopped"
    }
} 