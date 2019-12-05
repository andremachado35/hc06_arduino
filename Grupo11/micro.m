%Script de comunicação com o HC06
v = []; %inicialização de vector vazio
valor = b.BytesAvailable; %obtenção do número de bytes disponíveis para ler
nan = isnan(valor); %verificar se valor é NaN (Not a Number)

while (valor > 2) %enquanto houver mais de 2 bytes para ler
    if (valor ~= nan) 
        ler = fscanf(b); %ler valor enviado por bluetooth
        j = str2double(ler); %converter de string para número
        disp(j) %escrever esse valor
        v = [v j]; %preencher o vector
        
        %desenhar o gráfico
        P = plot(v, '*');
        set(P,'color','r');
        xlabel('Tempo');
        ylabel('Valores');
        title('Valores obtidos por Bluetooth');
        drawnow
        
        %se o tamanho do que foi lido for igual ao número de bytes
        %disponíveis -> leitura completa
        if (strlength(ler)==valor)
            valor = 0;
            ler = 0;
        end
    end

end

