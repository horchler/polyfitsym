function [p,mu]=polyfitsym(x,y,n)
%POLYFIT  Fit symbolic polynomial to data
%   P = POLYFITSYM(X,Y,N) finds the coefficients of a polynomial P(X) of degree
%   N that fits the data Y best in a least-squares sense. P is a symbolic row
%   vector of length N+1 containing the polynomial coefficients in descending
%   powers, P(1)*X^N + P(2)*X^(N-1) + ... + P(N)*X + P(N+1). X is a symbolic
%   vector. Y may be a symbolic vector the same lengthe as X, a function handle,
%   or a symbolic function created with SYMFUN. If either or both of X and Y are
%   floating-point, they are cast to symbolic.
%
%   [P, MU] = POLYFITSYM(X,Y,N) finds the coefficients of a polynomial in
%   XHAT = (X-MU(1))/MU(2) where MU(1) = MEAN(X) and MU(2) = STD(X). This
%   centering and scaling transformation improves the numerical properties of
%   both the polynomial and the fitting algorithm.
%
%   Example:
%       % Fifth order fit of sinusoid over interval, plot over larger interval
%       x1 = sym(-3:1:3); syms x; y = symfun(sin(x),x);
%       p = polyfitsym(x1,y,5)
%
%       x2 = -2*pi:0.2:2*pi;
%       f = polyval(double(p),x2);
%       plot(x2,y(x2),'o',x2,f,'-',x1,y(x1),'*');
%       axis([x2(1) x2(end)  -2  2]); xlabel('x'); ylabel('y(x)');
%       legend('sin(x)','fit','data','Location','NorthWest'); legend boxoff;
%
%   See also: POLYFIT, POLYVAL, SYM, SYMS, SYMFUN

%   Based on version 5.17.4.14 of POLYFIT

%   Andrew D. Horchler, horchler @ gmail . com, Created 7-28-13
%   Revision: 1.0, 4-21-16


if isa(y,'function_handle') || isa(y,'symfun')
    y = y(sym(x(:)));
else
    if ~isequal(size(x),size(y))
        error('polyfitsym:DimensionMismatch',...
              'X and Y vectors must be the same size.');
    end
    
    y = y(:);
    if ~isa(y,'sym')
        y = sym(y);
    end
end

x = x(:);
if ~isa(x,'sym')
    x = sym(x);
end

if ~isscalar(n) || ~isnumeric(n) || ~isreal(n)
    error('polyfitsym:InvalidDegree','Degree N must be a real numeric scalar.');
end
if n ~= floor(n) || n < 0 || n >= length(x) || ~isfinite(n)
    error('polyfitsym:InvalidDegreeValue',...
         ['Degree N must be a finite integer greater than or equal to zero '...
          'and less than the length of X.']);
end

if nargout > 1
    mu = mean(x);
    sig = sqrt(sum((x-mu).^2)/(length(x)-1));
    x = (x-mu)/sig;
    mu = [mu;sig];
end

% Construct Vandermonde matrix
V(:,n+1) = sym(ones(length(x),1));
for j = n:-1:1
    V(:,j) = x.*V(:,j+1);
end

% Solve least squares problem (V\y), coefficients are row vectors by convention
p = linsolve(V,y).';