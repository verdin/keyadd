
#add users
declare -A usersp
declare -A usersk


#passwords
usersp=( ["user1"]='6cb89ae5fUf82fl8765d' ["user2"]='gDZunIRvznXENCk' ["user3"]='@F5;X@7.E=YK')

#keys
usersk=( ["user1"]='ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBPNM311HnrB8oilmIFMeRNKIMZ2SmqKb812XCkwvmAWHc58xPIrZlGIlENqPNXZvbgRFZnFntNsbXdk6t/UFo9Y= user1' ["user2"]='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAA4wte7HP2cbKC1YQVc1p9w8Yo/ULdOGEw6/KJCpbZWLnXvsX9ZGr0ChmlyKnnlKJCsQnQcjfkmlBCcZz1EGPZubSwFhSVR+oEPJaxS95zU0F1PsR5aZITOWrW7HL1uBhzB9Xw8SIV/G73Ecrl4xe4hXNUAc4KgDhRs80DWS4Uejn4Xs3qVAvYsDKrAoA0ppIvwd7IzK0lLxio6tOYzHHPej3c9vrnTknFwP81vkt2uu5LR6MFt8xwdQPDnJEfCvgozVcBwRV1GX1OjC5lUz5axLPTUXxovwHKw7/TGrzQnACJcvhl35/PBHwHybWPjFTrAHdLBu2SESBn9sjG2qRTqPV8pM5/MXClYWirNs9HZPDuzvvjK/wyY70xhT+FJcWLtaRCssZP9KhNVdLngJJbSk1rcjdG/WK1rSOXdG92R5uB3bM6/yYGxiIthYkFILbjyeCCV1lvrBPhNEa4XetPjpN4JtPFB6QDh1hY6/MzEVsOUtc5InC5SAKlUbaCiYlv4LfbNVuy7m/nBel2KGM8hGFk5cGT+vLMBAYDsP3XSL/wEa7SLf0tu2Ko5VYUvP/mdxEBdgT9nxCocly7h/aET4zFtBtRwLTrY0BjV32iUmZlZMgfYABaez+SYOQuifZvYfuNPmpA1rLclJUy2D093FuTs1nETdaxwSXy5koSO3 user2' ["user3"]='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9F5X9+MisJhbv4jpvPtX3OtINkwPTSdGv2t4iBCKJUXE2XIgfrlczwFB/WVQtMBXid9VXRmpDWU2TghcQrF4pUUnZCYO7c/PDut6rYi7JGXqyRavz1/TaCaavUcPnRhu0+nY0Mti+OgPQ+db5Bz6OT0ro7azPWXX9XST6BhLBZul6C1QLVcZfLEnHnJdnlC6R+SrHOfouHxnBCv0HuZAxrEHRpCzMs/fbb50gkkb6IjPusLCePyQBtvh5K3Ja8tNhylfl/n2MeTx/CteE24/jvLGR3iWYggISmHsyVECxigPkWpgXT4IjVLTCuUgc+EPjmhEqSNXYEynzR4pnW2Wx user3')


#add user

for user in "${!usersp[@]}"
do
        echo $user

	useradd -m -s /bin/bash -G sudo $user

        echo "$user:${usersp[$user]}" | chpasswd

done

# add keys
for name in "${!usersk[@]}"
do
        echo $name
        mkdir /home/$name/.ssh/
        echo "${usersk[$name]}" >> /home/$name/.ssh/authorized_keys

        chmod 700 /home/$name/.ssh
        chmod 600 /home/$name/.ssh/authorized_keys
        chown $name:$name /home/$name/.ssh
        chown $name:$name /home/$name/.ssh/authorized_keys



done


