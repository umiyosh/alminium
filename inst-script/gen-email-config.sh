#!/bin/bash

case "$SMTPSET" in
	"1" )
	echo "default:
  email_delivery:
    delivery_method: :sendmail" > $INSTALL_DIR/config/configuration.yml
	;;
	
	"0" | "2" | "3" )
	echo "default:
  email_delivery:
    delivery_method: :smtp
    smtp_settings:
      address: $SMTPSERVER
      port: $SMTPPORT
      domain: $HOSTNAME" > $INSTALL_DIR/config/configuration.yml

	if [ "$SMTPTLS" == "Y" ]
	then
	echo "      enable_starttls_auto: true" >> $INSTALL_DIR/config/configuration.yml
	fi

	if [ "$SMTPLOGIN" == "Y" ]
	then
	echo "      authentication: :login
      user_name: $SMTPUser
      password: $SMTPPass" >> $INSTALL_DIR/config/configuration.yml
	fi
	;;
	
	* ) ;;
esac

case $OS in
    "rhel6" )
        if [ -f /usr/share/fonts/ipa-pgothic/ipagp.ttf ]
        then
            fontpath=/usr/share/fonts/ipa-pgothic/ipagp.ttf
        fi
        ;;
    "debian" )
        if [ -e /usr/share/fonts/truetype/fonts-japanese-gothic.ttf ]
        then
            fontpath=/usr/share/fonts/truetype/fonts-japanese-gothic.ttf
        fi
        ;;
    "mac" )
        if [ -f /Library/Fonts/Osaka.ttf ]
        then
            fontpath=/Library/Fonts/Osaka.ttf
        fi
        gitpath=/opt/local/bin/git
        svnpath=/opt/local/bin/svn
        hgpath=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/hg
        ;;
    * )
        ;;
esac

cat << EOT >> $INSTALL_DIR/config/configuration.yml

  rmagick_font_path: $fontpath

  scm_subversion_command: $svnpath
  scm_git_command: $gitpath
  scm_mercurial_command: $hgpath

  attachments_storage_path:

  autologin_cookie_name:
  autologin_cookie_path:
  autologin_cookie_secure:

  database_cipher_key:

  #mirror_plugins_assets_on_startup: false

  imagemagick_convert_command:

production:

development:

EOT

