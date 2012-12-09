#testes com transformada do cosseno
#o sinal original jah tem muitos zeros, a transformada acaba meio que agando nele,
#peguei um pedaco legalzinho
#usar o GHex para verificar o resultado

sn = wavread('click.wav',[300 900]);
wavwrite(sn,44100,16,'original'); #para comparar  
figure(1), plot(sn) , title('Original');

c =  dct(sn);
figure(2), plot(c) , title('DCT');

#com transformada
wavwrite(c,44100,16,'dct.wav');
