use strict;

my $Destaque = "A";
open(my $arq, "<", "Texto") or die "Falha ao abrir o arquivo";

while(my $linha = <$arq>)
{
    $linha =~ s/\b($Destaque)\b/\e[1;31m$1\e[0m/gi;
    print $linha;
}

print "\n";
close($arq);