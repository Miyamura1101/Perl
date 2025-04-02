use strict;

print "Coloque o local do arquivo: ";
chomp(my $texto = <STDIN>);

if($texto =~ m/^C:\\/)
{
    $texto =~ s/^C:\\/\/mnt\/c\//;
    $texto =~ s/\\/\//g;    # Troca todas as \ por /
}

open(my $arq, "<", $texto) or die "Falha ao abrir o arquivo: $!";
open(my $arqL, ">", "/root/Perl/Projeto/Texto") or die "Falha ao abrir o arquivo: $!";

while(my $linha = <$arq>)
{
    print $arqL $linha;
}

close($arq);
close($arqL);

print "Arquivo copiado com sucesso!\n";