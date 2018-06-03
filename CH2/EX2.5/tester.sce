[u,t,n] = file()
n = strcat(n)
file_name = basename(n)+fileext(n)
file_name = strcat(file_name)
ind=strindex(n,file_name)
path = part(n,1:ind-1)
chdir(path)

exec("Chapter_2.sci",-1)

a = ascii('A')
pt = "HEL Kok"
printf("Plaintext:\n\t%s\n",pt)
gt = modified_encrypt(pt)
printf("Encrypted text:\n\t%s\n",gt)

printf("Decrypted text:\n\t%s",modified_decrypt(gt))

