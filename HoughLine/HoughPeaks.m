function C=HoughPeaks(Matrix)
  [rho th]=size(Matrix);       # rho for the distance th for degrees
  [maxv in]=max(Matrix);   # find vector of maximum peaks
  [maxima dd]=max(maxv)    # find the most maximum
  secmax=-1;
  mlen=length(maxv);
  
  for i= 1:mlen                  #find second max
    if maxv(i)>secmax && maxv(i)!=maxima
      secmax=maxv(i);
    endif  
  endfor  
  
  thirdmax=-1;
  for i= 1:mlen                  #find third max(this is for bigger images)
    if maxv(i)>=thirdmax && maxv(i)!=maxima&&maxv(i)!=secmax
      thirdmax=maxv(i);
    endif  
  endfor
  #[maxima id]=max(maxv);
  minmax=min(max(Matrix));
  k=0;                                    # counter for B
  cutoff=0;                               # counter for resizing
  B(1,1:2)=zeros(1,2);             # B square matrix 1st row distances 2nd row thetas
  for i=1:rho
    for j=1:th
      if Matrix(i,j)>=thirdmax
        k+=1
        B(k,1)=(i-1)-floor(rho/2);
        B(k,2)=j;
        B=resize(B,k+1,2);
        cutoff+=1;
      endif  
    endfor  
  endfor 
 C=resize(B,cutoff,2); 
endfunction