#!/bin/bash
# Default acpi script that takes an entry for all actions

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                logger 'SleepButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unpluged'
                        ;;
                    00000001)
                        logger 'AC pluged'
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        ;;
                    00000001)
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    video/brightnessdown)
        brightnessctl set 10%-;;
    video/brightnessup)
        brightnessctl set +10%;;
    button/volumedown)
        runuser - harukai -c "pactl set-sink-volume @DEFAULT_SINK@ -5%"
	;;
    button/volumeup)
        runuser - harukai -c "pactl set-sink-volume @DEFAULT_SINK@ +5%"
	;;
    button/mute)
	runuser - harukai -c "pactl set-sink-mute @DEFAULT_SINK@ toggle"
	;;
    button/lid)
        case "$3" in
            close)
                # this causes a delay in locking on resume?
		        # XDG_SEAT_PATH="/org/freedesktop/DisplayManager/Seat0" dm-tool lock
                logger 'LID closed'
                ;;
            open)
                logger 'LID opened'
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;
    esac
    ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
