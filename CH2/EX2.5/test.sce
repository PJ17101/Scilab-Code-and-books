enc_text="hiZs"
for i1=1:53
    for j=1:53
       for k=1:53
           for l=1:53
            invKey=[i1 j;k l]
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
               if(de_text=="HELP") then
                   return 
               end
           end
       end 
    end
end
