[u,t,n] = file()
n = strcat(n)
file_name = basename(n)+fileext(n)
file_name = strcat(file_name)
ind=strindex(n,file_name)
path = part(n,1:ind-1)
chdir(path)

exec("Chapter_2.sci",-1)
pt = "HEL Kus"
printf("Plaintext:\n\t%s\n",pt)
len = length(pt)
for i=1:16
    lp= part(pt,1:len/2)
    rp= part(pt,(len/2)+1:len)
    ft = modified_encrypt_caesar_general(rp,i)
    result = bitxr(lp,ft)
    printf("Feistel block cipher:\n\t%s\n",result)
    rp=result
    lp=rp;
end
printf("Feistel block cipher:\n\t%s\n",rp+lp)
