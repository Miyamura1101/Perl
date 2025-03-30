use strict;

my $Destaque = "um";
open(my $arq, "<", "/home/felipe/Perl/Projeto/Texto") or die "Falha ao abrir o arquivo";

while(my $linha = <$arq>)
{
    $linha =~ s/\b($Destaque)\b/\e[1;31m$1\e[0m/gi;
    print $linha;
}

print "\n";
close($arq);