#!/bin/sh

groupadd -g $TARGET_GID $TARGET_USER
useradd -d /home/$TARGET_USER -u $TARGET_UID -g $TARGET_GID $TARGET_USER
chown $TARGET_UID:$TARGET_GID /home/$TARGET_USER

cat > /etc/sudoers.d/$TARGET_USER <<EOF
$TARGET_USER	ALL=(ALL)	NOPASSWD: ALL
EOF

chmod 440 /etc/sudoers.d/$TARGET_USER

cd $WORKDIR
exec runuser -u $TARGET_USER "$@"

