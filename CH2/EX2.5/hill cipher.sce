[u,t,n] = file()
n = strcat(n)
file_name = basename(n)+fileext(n)
file_name = strcat(file_name)
ind=strindex(n,file_name)
path = part(n,1:ind-1)
chdir(path)
exec("Chapter_2.sci",-1)
pt="NAZEER"
org=pt
printf("plain text %s\n",pt)
len = length(pt)
q=0
mod=26
if modulo(len,3)~=0 then
    if modulo(len,3)==1 then
        pt = pt+"xx"
        q=2
    end
    if modulo(len,3)==2 then
        pt = pt+"x"
        q=1
    end
end
key=[1 12 16;8 1 2;5 20 1] //GYBNQKURP
//invKey=[34 20 11;4 46 52;27 44 29]
invKey=[7 48 4;1 40 11;51 20 21]
len=length(pt)
i=1
enc_text=""
while(i<(len-1))
    block = part(pt,i:i+2)
    x=part(block,1:1)
    y=part(block,2:2)
    z=part(block,3:3)
    a=0
    b=0
    c=0
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
    if(ascii(z)==32) then
        c=52
    else
        if(ascii(z)<=ascii("Z")) then
            c = ascii(z)-65
        else
            c = ascii(z)-71
        end
    end
    mat=[a b c]
    res=key*mat'
    res(1,1)=modulo(res(1,1),mod)
    res(2,1)=modulo(res(2,1),mod)
    res(3,1)=modulo(res(3,1),mod)
    enc_text = enc_text + ascii(getvali(res(1,1)))+ ascii(getvali(res(2,1)))+ ascii(getvali(res(3,1)))
    i=i+3
end
printf("Encrypted text %s\n",enc_text)

/////////////////////decryption/////////////////////////////

de_text=""
i=1
while(i<(len-1))
    block = part(enc_text,i:i+2)
    x=part(block,1:1)
    y=part(block,2:2)
    z=part(block,3:3)
    a=0
    b=0
    c=0
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
    if(ascii(z)==32) then
        c=52
    else
        if(ascii(z)<=ascii("Z")) then
            c = ascii(z)-65
        else
            c = ascii(z)-71
        end
    end
    mat=[a b c]
    res=invKey*mat'
    res(1,1)=modulo(res(1,1),mod)
    res(2,1)=modulo(res(2,1),mod)
    res(3,1)=modulo(res(3,1),mod)
    de_text = de_text + ascii(getvali(res(1,1)))+ ascii(getvali(res(2,1)))+ ascii(getvali(res(3,1)))
    i=i+3
end

printf("Decrypted text %s\n",de_text)


