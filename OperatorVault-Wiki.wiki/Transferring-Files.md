## how-to transfer files

<details>
<summary><u>Upload to a vault node</u></summary>
under construction
</details>

<details>
<summary><u>Download from a vault node</u></summary>
1. scp the desired file from the node to the bastion:

```
[jkwak@shellngtor0401 ~]$ scp tor01-vault1:/home/username/filename.txt .

filename.txt                                                                                                                                                                                                             

100%  273KB  23.5MB/s   00:00

```


2. Exit from the node and from your machine, scp the file from the bastion to your machine (note where you want the file to be downloaded to):

```
jennicakwak@Jennicas-MacBook-Pro ~ % tsh -l username --proxy=ca-tor.pylon.softlayer.local scp username@shellngtor0401.softlayer.local:/home/username/filename.txt ~/Downloads

<- /Users/jennicakwak/Downloads/filename.txt (279884)
```

</details>



