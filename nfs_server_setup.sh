yum install -y nfs-utils nfs-utils-lib

#startup scripts for nfs server
chkconfig nfs on
service rpcbind start
service nfs start

#Add this line to /etc/exports file, one for each client
touch /etc/exports
echo "/software client1(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/software client2(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/software client3(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/software oss1(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/software oss2(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/software mgs_mdt(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports

exportfs -a
