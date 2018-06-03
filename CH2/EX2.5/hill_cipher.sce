[u,t,n] = file()
n = strcat(n)
file_name = basename(n)+fileext(n)
file_name = strcat(file_name)
ind=strindex(n,file_name)
path = part(n,1:ind-1)
chdir(path)
exec("Chapter_2.sci",-1)

pt="Hello I am Nazeer"
len=length(pt)
printf("plain text %s\n",pt)

q=0
mod=53
if modulo(len,2)~=0 then
    if modulo(len,2)==1 then
        pt = pt+"x"
        q=1
    end
end
key=[3 3;2 5] 
//invKey=[34 20 11;4 46 52;27 44 29]
invKey=[30 35;41 18]
len=length(pt)
i=1
enc_text=""
while(i<(len))
    block = part(pt,i:i+1)
    x=part(block,1:1)
    y=part(block,2:2)
    a=0
    b=0
    if(ascii(x)==32) then
        a=52
    else
        if(ascii(x)<=ascii("Z")) then
            a = ascii(x)-65
        else
            a = ascii(x)-71
        end
    end
    if(ascii(y)==32) then
        b=52
    else
        if(ascii(y)<=ascii("Z")) then
            b = ascii(y)-65
        else
            b = ascii(y)-71
        end
    end
    mat=[a b]
    res=key*mat'
    res(1,1)=modulo(res(1,1),mod)
    res(2,1)=modulo(res(2,1),mod)
    enc_text = enc_text + ascii(getvali(res(1,1)))+ ascii(getvali(res(2,1)))
    i=i+2 
end
printf("Encrypted text %s\n",enc_text)

/////////////////////decryption/////////////////////////////

de_text=""
i=1
while(i<(len))
    block = part(enc_text,i:i+2)
    x=part(block,1:1)
    y=part(block,2:2)
    a=0
    b=0
    if(ascii(x)==32) then
        a=52
    else
        if(ascii(x)<=ascii("Z")) then
            a = ascii(x)-65
        else
            a = ascii(x)-71
        end
    end
    if(ascii(y)==32) then
        b=52
    else
        if(ascii(y)<=ascii("Z")) then
            b = ascii(y)-65
        else
            b = ascii(y)-71
        end
    end
    mat=[a b]
    res=invKey*mat'
    res(1,1)=modulo(res(1,1),mod)
    res(2,1)=modulo(res(2,1),mod)
    de_text = de_text + ascii(getvali(res(1,1)))+ ascii(getvali(res(2,1)))
    i=i+2
end
len = length(de_text)
printf("Decrypted text %s\n",part(de_text,1:len-q))


