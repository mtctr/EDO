%Autor: Mateus Cruz Targino
%Algoritmo para resolver EDOs utilizando polinomios
%inputs:
%   p = vetor com polinomio caracteristico da EDO
%   y0 = vetor de valores iniciais
%outputs:
%   A = matriz de resposta ao impulso
%   B = matriz da resposta homog�nea
%   C = matriz da reposta particular

function [A,B] = edo(p,y0)
    r = roots(p).'; %vetor com as ra�zes do polin�nio
    [n1 n2] = size(r); 
    
    R = [ones(1,n2);r]; %concatena��o de vetor de 1s com as ra�zes
    
    if n2>2 then    %verifica se possui mais de 2 ra�zes
       for n=3:n2       
           R = [R;r.^(n-1)];    %concatena o vetor elevado a n-1    
       end                              
    end
    
    [na nb] = size(R);
    b = zeros(na,1); %criacao do vetor [0 0 ... 0]
    b(na) = 1; %add 1 no final do vetor
       
    
    A = inv(R)*b; %acha a matriz de resposta ao impulso
    B = inv(R)*y0; %acha a matriz da resposta homog�nea
end