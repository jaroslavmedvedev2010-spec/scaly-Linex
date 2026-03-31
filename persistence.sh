lsblk
read -p "устройство: " usb
sudo fdisk $usb <<< $(printf "p\nn\np\n\n\n\np\nw")
sudo mkfs.ext4 -L persistence ${usb}3
sudo mkdir -pv /mnt/my_usb
sudo mount -v ${usb}3 /mnt/my_usb
echo "/ union" | sudo tee /mnt/my_usb/persistence.conf
sudo umount -v ${usb}3
