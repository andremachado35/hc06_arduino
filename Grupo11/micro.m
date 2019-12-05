%Script de comunica��o com o HC06
v = []; %inicializa��o de vector vazio
valor = b.BytesAvailable; %obten��o do n�mero de bytes dispon�veis para ler
nan = isnan(valor); %verificar se valor � NaN (Not a Number)

while (valor > 2) %enquanto houver mais de 2 bytes para ler
    if (valor ~= nan) 
        ler = fscanf(b); %ler valor enviado por bluetooth
        j = str2double(ler); %converter de string para n�mero
        disp(j) %escrever esse valor
        v = [v j]; %preencher o vector
        
        %desenhar o gr�fico
        P = plot(v, '*');
        set(P,'color','r');
        xlabel('Tempo');
        ylabel('Valores');
        title('Valores obtidos por Bluetooth');
        drawnow
        
        %se o tamanho do que foi lido for igual ao n�mero de bytes
        %dispon�veis -> leitura completa
        if (strlength(ler)==valor)
            valor = 0;
            ler = 0;
        end
    end

end

