
//to find gcd
function [h] = gcd1(a,h)
    temp=1
    while(1)
        temp = modulo(a,h);
        if(temp==0) then
            break
        end
        a = h;
        h = temp;
    end
endfunction

p = 3
q = 5
n=double(p*q)
count=0
totient = (p-1)*(q-1)
e=2

//for checking co-prime which satisfies e>1
while(e<totient)
    count = gcd1(e,totient);
    if(count==1) 
        break;
    else
        e=e+1;
    end
end

    //private key
    //d stands for decrypt
d=double(0)

    //k can be any arbitrary value
k = double(2)

    //choosing d such that it satisfies d*e = 1 + k * totient
d = double((1 + (k*totient))/e)
msg = 6
c = double(msg^e)
m = double(c^d)
c=double(modulo(c,n))
m=double(modulo(m,n))

printf("Plain data %d\n",msg)
printf("Value of P %d\n",p)
printf("Value of q %d\n",q)
printf("n=pq = %d\n",n)
printf("Totient %d\n",totient)
printf("Value of e %d\n",e)
printf("Value of d %d\n",d)
printf("Encrypted data %d\n",c)
printf("Decrypted data %d\n",m)
    
