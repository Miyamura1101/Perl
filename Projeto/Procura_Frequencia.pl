use strict;
use utf8;
use open qw(:std :utf8);

my %palavrasReservadas = map { $_ => 1 } qw(a à às ao aos o os e de desde da das do dos em entre dentro com consigo como ele eles ela elas
contigo conosco para perante por perante através um uma uns umas que quem cujo cuja cujos cujas se seu sua seus suas deles delas pela pelas
é são está estão era eram na nas no nos os as não ou sim certamente ao aos mais maior maioria mas porém contudo todavia cada qualquer que faz
isso isto aquele aquela aqueles aquelas há havia sob sobre durante entre após antes desde contra perante até bem mal pouco poucos com por qual 
pouca poucas muito muitos muita muitas então depois ainda quando enquanto porque seja sendo fui foi fomos foram me te se nos vos lhe lhes quais
mãe todo toda todos todas algum alguma alguns algumas);

my %frequencia;  # Hash com a frequencia das palavras

open(my $arq, "<", "/home/felipe/Perl/Projeto/Texto") or die "Falha ao abrir o arquivo";

while(my $linha = <$arq>)
{
    chomp $linha;

    $linha =~ s/[[:punct:]]//g;
    $linha = lc $linha;

    my @palavras = split(/\s+/, $linha);
    
    foreach my $palavra (@palavras){
        next if exists $palavrasReservadas{$palavra};
        next if $palavra =~ /^\d+$/;     # Para ignorar numeros
        $frequencia{$palavra}++;
    }
}

close($arq);

my @palavras_Ordenadas = sort {$frequencia{$b} <=> $frequencia{$a}} keys %frequencia;

foreach my $palavra (@palavras_Ordenadas[0..5])
{
    print "$palavra (Quantidade: $frequencia{$palavra})\n";
}