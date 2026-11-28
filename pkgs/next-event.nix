{ pkgs }:

pkgs.writeShellApplication {
  name = "next-event";

  runtimeInputs = [
    pkgs.khal
    pkgs.coreutils
    pkgs.gnused
    pkgs.jq
  ];

  text = ''
    while true; do
      event="$(
        khal list \
          --format '{start-time} - {end-time} {title}' \
          --day-format "" \
          now 16h 2>/dev/null |
          sed -E \
            -e '/^[[:space:]]*$/d' \
            -e 's/([0-9]{2}:[0-9]{2}):[0-9]{2}/\1/g' |
          head -n 1 || true
      )"

      jq -cn --arg text "$event" '{text: $text, alt: ""}'
      sleep 30
    done
  '';

}
