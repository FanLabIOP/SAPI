@echo off
copy>xxx.bin %2.%3 keyword.tm
copy>xxx.bin %4 data.tm
if NOT %5==xxxxxxxx.xxx copy>xxx.bin %5 emap.in

%1prepare
%1phase
%1exfft
%1search

copy>xxx.bin prepare.out+phase.out+exfft.out+search.out+%2.%3 %2%3.out
copy>xxx.bin prepare.sum+phase.sum+exfft.sum+search.sum %2%3.sum
if exist prepare.out del prepare.out
if exist phase.out del phase.out
if exist exfft.out del exfft.out
if exist search.out del search.out
if exist prepare.sum del prepare.sum
if exist phase.sum del phase.sum
if exist exfft.sum del exfft.sum
if exist search.sum del search.sum
if exist sapi95.sg2 del sapi95.sg2
if exist emap.in del emap.in

if exist sapi95.pks copy>xxx.bin sapi95.pks %2%3.pks
if exist sapi95.plt copy>xxx.bin sapi95.plt %2%3.plt
if exist hklm.tm copy>xxx.bin hklm.tm %2%3.hkl
if exist sapi95.pks del sapi95.pks
if exist sapi95.plt del sapi95.plt
if exist hklm.tm del hklm.tm
if exist *.tm del *.tm

choice /c:yn/t:y,30 Do you wish to keep the resultant map   
if errorlevel 2 goto end
if exist sapi95.map copy>xxx.bin sapi95.map %2%3.map

:end
if exist sapi95.map del sapi95.map
del xxx.bin



