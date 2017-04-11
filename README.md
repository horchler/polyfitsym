polyfitsym
========
##### Fit symbolic polynomial to data in Matlab.
###### Version 1.0, 4-21-16
##### Download Repository: [ZIP Archive](https://github.com/horchler/polyfitsym/archive/master.zip)

--------

[```polyfitsym```](https://github.com/horchler/polyfitsym/blob/master/polyfitsym.m) is an adaptation of Matlab's [```polyfit```](http://www.mathworks.com/help/matlab/ref/polyfit.html) for symbolic math.  
  
```P = polyfitsym(F,X,N)``` finds the coefficients of a polynomial ```P(X)``` of degree ```N``` that fits the data ```Y``` best in a least-squares sense. ```P``` is a symbolic row vector of length ```N+1``` containing the polynomial coefficients in descending powers, ```P(1)*X^N + P(2)*X^(N-1) + ... + P(N)*X + P(N+1)```. ```X``` is a symbolic vector. ```Y``` may be a symbolic vector the same lengthe as ```X```, a function handle, or a symbolic function created with ```SYMFUN```. If either or both of ```X``` and ```Y``` are floating-point, they are cast to symbolic.  
  
```[P,MU] = polyfitsym(F,X,N)``` finds the coefficients of a polynomial in ```XHAT = (X-MU(1))/MU(2)``` where ```MU(1) = MEAN(X)``` and ```MU(2) = STD(X)```. This centering and scaling transformation improves the numerical properties of both the polynomial and the fitting algorithm.  
&nbsp;  

--------

Andrew D. Horchler, *horchler @ gmail . com*, [biorobots.case.edu](http://biorobots.case.edu/)  
Created: 7-28-13, Revision: 1.0, 4-21-16  

This version tested with Matlab 9.0.0.341360 (R2016a)  
Mac OS X 10.11.4 (Build: 15E65), Java 1.7.0_75-b13  
Compatibility maintained back through Matlab 8.1 (R2013a)  
&nbsp;  

--------

Copyright &copy; 2013&ndash;2017, Andrew D. Horchler  
All rights reserved.  

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of Case Western Reserve University nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ANDREW D. HORCHLER BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.