function [A,t,d]=HoughSpace(bw,step)    # returns accumulator array with t,d vectors of thetas 
                                   #  and distance
  [edgx edgy]=find(bw);            # find edges
  lenedg=numel(edgx);               # No. of edges
  [bwx bwy]=size(bw);
  t=0:step:180;                     
  dLimit=hypot(bwx,bwy);            # the limit of the distances sqrt(x^2 + y^2)
  d=-dLimit:1:dLimit;               #[-sqrt(),sqrt()]
  lent=numel(t);
  lend=numel(d);
  A(1:lend,1:lent)=hist(edgx(1:lenedg)*cos(deg2rad(t)) + edgy(1:lenedg)*sin(deg2rad(t)),d);
  #pcolor(t,d,A(:,:));#store the distances of each edge
  #colormap('gray')
  #A(1:lend,1:lent)=zeros(lend,lent);    # initialize A
#for i=1:lent  
  #A(:,i)=hist(edgx(:)*cos(deg2rad(i)) - edgy(:)*sin(deg2rad(i)),d);
#endfor  
endfunction