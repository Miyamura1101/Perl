use strict;

my $Destaque = "lingu";
open(my $arq, "<", "/root/Perl/Projeto/Texto") or die "Falha ao abrir o arquivo";

while(my $linha = <$arq>)
{
    $linha =~ s/($Destaque)/\e[1;31m$1\e[0m/gi;
    print $linha;
}

print "\n";
close($arq);