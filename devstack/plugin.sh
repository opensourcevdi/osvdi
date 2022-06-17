#!/bin/bash
#
# plugin.sh - devstack plugin for OSVDI
#

echo_summary "osvdi devstack plugin.sh called: ${1}/${2}"
source "${DEST}/osvdi/devstack/lib/osvdi"

case ${1} in
    "stack")
        case ${2} in
            "pre-install")
                # Perform pre-installation of OSVDI service source
                echo_summary "Pre-Installing OSVDI"
                preinstall_osvdi
                ;;
            "install")
                # Perform installation of OSVDI service source
                echo_summary "Installing OSVDI"
                install_osvdi
                ;;
            "post-config")
                # Configure after the other layer 1 and 2 services have been configured
                echo_summary "Configuring OSVDI"
                configure_osvdi
                ;;
            "extra")
                # Initialize the OSVDI service
                echo_summary "Initializing OSVDI"
                init_osvdi
                # Start the OSVDI service
                echo_summary "Starting OSVDI"
                start_osvdi
                ;;
        esac
        ;;
    "unstack")
        # Shut down OSVDI services
        stop_osvdi
        ;;
    "clean")
        # Remove state and transient OSVDI data
        cleanup_osvdi
        ;;
esac
