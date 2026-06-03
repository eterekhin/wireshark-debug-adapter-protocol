 : '
  @echo off
  goto :windows
  '

  case "$(uname -s)" in
    Darwin|Linux)
      mkdir -p ~/.local/lib/wireshark/plugins/ &&
      cd ~/.local/lib/wireshark/plugins/ &&
      curl -L -O https://raw.githubusercontent.com/eterekhin/wireshark-debug-adapter-protocol/refs/heads/master/tcp-debug-adapter-protocol-dissector.lua
      ;;
    *)
      echo "Unsupported Unix platform: $(uname -s)"
      exit 1
      ;;
  esac

  exit $?

  :windows
  mkdir "%APPDATA%\Wireshark\plugins" 2>nul
  cd /d "%APPDATA%\Wireshark\plugins" && curl -L -O https://raw.githubusercontent.com/eterekhin/wireshark-debug-adapter-protocol/refs/heads/master/tcp-debug-adapter-protocol-dissector.lua
  exit /b %errorlevel%
