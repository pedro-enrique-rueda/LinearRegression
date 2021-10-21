% Metodo de regresion lineal con cuadrados minimos
function [a,b,r2] = RegresionLineal(x,y)
    
    figure(1)
    plot(x,y,'ob')
    title('Figura datos de Entrada')
    ylabel('Eje Ordenadas')
    xlabel('Eje Abscisas')
    
    %Calculo de cuadrados minimos
    A(1,1) = sum(x);
    A(1,2) = length(x);
    A(2,1) = sum(x.^2);
    A(2,2) = sum(x);
    
    b(1,1) = sum(y);
    b(2,1) = sum(x.*y);
    
    [resultado,tiempo] = red_gauss(A,b);
    a = resultado(1);
    b = resultado(2);
    
    % mi funcion de la recta es pues:
    y_gorro = a.*x + b;
    hold on
    plot(x,y_gorro)
    
    ym = sum((y / length(x)));
    hold on
    plot(x,ym,'r*')
    
    % Calculo del coeficiente de determinacion
    Sr = sum((y - y_gorro).^2);
    St = sum((y - ym).^2);
    
    r2 = (St - Sr) / St;
    
end