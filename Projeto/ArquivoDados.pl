use strict;

my $texto = <STDIN>;

open(my $arq, ">", "/home/felipe/Perl/Projeto/Texto") or die "Falha ao abrir o arquivo";
print $arq $texto;
close($arq);