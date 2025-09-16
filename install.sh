##########################################################################################
#
# Magisk Module Installer Script
#
# Changelog / Description of Changes:
#
# The following improvements have been applied to service.sh:
# 1. Unified IP for TCP & UDP: Both TCP and UDP DNS traffic are now directed to 1.1.1.1,
#    simplifying the configuration and improving efficiency.
# 2. Removed old rules before adding new ones: Existing iptables DNAT rules for port 53
#    in the OUTPUT chain are cleared first to prevent duplication.
# 3. Inserted new rules with higher priority: New iptables rules are added using the
#    -I (insert) option, ensuring they are placed at the top of the chain and take precedence.
# 4. Removed unnecessary functions and variables: Script is now more concise,
#    eliminating separate TCP/UDP variables and rule-check functions.
# 5. Added logging: Log messages are displayed when iptables rules are applied,
#    making it easier to monitor and debug.
#
# Result: The script is now more efficient, cleaner, and less prone to rule duplication.
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true

##########################################################################################
# Replace list
##########################################################################################

REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

REPLACE="
"

##########################################################################################
# Print changelog / description of changes
##########################################################################################

print_changelog() {
  ui_print "**************************************"
  ui_print " Changelog for service.sh improvements:"
  ui_print " 1. Unified IP for TCP & UDP: Both TCP and UDP DNS traffic directed to 1.1.1.1"
  ui_print "    for simpler and more efficient configuration."
  ui_print " 2. Removed old rules before adding new ones: Existing iptables DNAT rules for port 53"
  ui_print "    in OUTPUT chain are cleared first to prevent duplication."
  ui_print " 3. Inserted new rules with higher priority: New iptables rules use '-I' (insert)"
  ui_print "    to ensure they are on top of the chain."
  ui_print " 4. Removed unnecessary functions and variables: Script is more concise, no separate TCP/UDP vars."
  ui_print " 5. Added logging: Log messages are displayed when iptables rules are applied."
  ui_print "**************************************"
  sleep 0.5
}

##########################################################################################
# Set what you want to display when installing your module
##########################################################################################

print_modname() {
  sleep 0.3
  ui_print "**************************************"
  sleep 0.3
  ui_print " Network Tweak V6 Cloudflare & Google "
  sleep 0.3
  ui_print "   Join Telegram Group @immix_builds  "
  sleep 0.3
  ui_print " Modif by github.com/Ian7672 "
  sleep 0.3
  ui_print "**************************************"
  sleep 0.3
}

##########################################################################################
# Copy/extract your module files into $MODPATH in on_install
##########################################################################################

on_install() {
  print_changelog
  sleep 0.5
  ui_print "- Tweaking Network for Better Connectivity"
  sleep 0.5
  ui_print "- Injecting Google+CloudFlare DNS for Better Ping"
  sleep 0.5
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

##########################################################################################
# Set permissions for module files
##########################################################################################

set_permissions() {
  # Default permissions
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm_recursive $MODPATH/system/etc/init.d 0 0 0755 0755
  # Examples for special files:
  # set_perm  $MODPATH/system/bin/app_process32   0     2000    0755      u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0     2000    0755      u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0     0       0644
}

# You can add more functions to assist your custom script code
