#Load assembly
Add-Type -AssemblyName System.speech
$Talk = New-Object System.Speech.Synthesis.SpeechSynthesizer

# Set the selectd voice
$Talk.SelectVoice('Microsoft Maria Desktop')

# Set the speed value
$Talk.Rate = "0"

# Set the volume value
$Talk.Volume = "10"

# Set the text to speak
$Talk.Speak("Oi, sou a Cortana")
