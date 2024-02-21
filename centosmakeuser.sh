#!/bin/bash
username=user
sshkey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD0iyErjICKDh8VeR0PUrNpPjTJJV4PiQKA1cCwHdHJ0ZZan7QLWrZVBPPylbQrSifXvPzDDOBPFLpLkVsDzaqRn5mrCLICd1YYsM7slsbw2hOreZxxEfumovbXZ3MjRcVFcTApSofJXkHv3npEW95YiWi+01R5hdlwk2Jo3jqiEx7idw4SeEBc6Tronb3PujsIe+0+pvoLm1fUWtOyp8H16TZ44i5C4LVC5mHrYmxW/klBJgrr8leEWqlWOM5BTZAqmTfnessdzyhqk1U/Whf+wNDMaeAivwLVmWWAWLtykGxXpED50QrdZt/K0vH9nl2mlaE6y9i9VCteUT3kyX1HhOvZWmwYDQdfF8rVonnrj/yikopfAT8xxkhl+/gEBHFyTvSZ5w3hRXMOUPKinOikK+xka9GgkOgBZJLKy6waBXrthmejr91Pa1H820xXPOF6d+eVH0bZMzQqqBSYBtSVrMrS5h46WYmWXwFPR+6U3DjeeEWcnFKcEV94EaLBIMk= levin_s@levingaming"
# useradd -m -d /home/$username -s /bin/bash $username
adduser $username
gpasswd -a $username wheel
mkdir -p /home/$username/.ssh && touch /home/$username/.ssh/authorized_keys
chown -R $username:$username /home/$username/.ssh
chmod 700 /home/$username/.ssh
chmod 600 /home/$username/.ssh/authorized_keys
echo $sshkey > /home/$username/.ssh/authorized_keys
echo "%wheel ALL=(ALL)  ALL" > /etc/sudoers.d/$username
echo "$username ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$username
# sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
systemctl restart sshd