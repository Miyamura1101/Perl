use strict;
use warnings;
use utf8;   # Suporte a caracteres acentuados
use open qw(:std :utf8);  # Garante que a leitura e escrita estejam em UTF-8

my %palavrasReservadas = map { $_ => 1 } qw(a à às ao aos o os e de desde da das do dos em entre dentro com consigo como ele eles ela elas
contigo conosco para perante por perante através um uma uns umas que quem cujo cuja cujos cujas se seu sua seus suas deles delas pela pelas
é são está estão era eram na nas no nos os as não ou sim certamente ao aos mais maior maioria mas porém contudo todavia cada qualquer que faz
isso isto aquele aquela aqueles aquelas há havia sob sobre durante entre após antes desde contra perante até bem mal pouco poucos com por qual 
pouca poucas muito muitos muita muitas então depois ainda quando enquanto porque seja sendo fui foi fomos foram me te se nos vos lhe lhes quais
mãe todo toda todos todas algum alguma alguns algumas);

my %frequencia;

open(my $arq, "<", "/home/felipe/Perl/Projeto/Texto") or die "Erro ao abrir o arquivo: $!";
my @linhas;

while (my $linha = <$arq>) {
    chomp $linha;
    push @linhas, $linha;

    my $linha_Copy = $linha;               # Faz uma copia da Linha
    $linha_Copy =~ s/[[:punct:]]//g;       # Retira os caracteres especiais 
    $linha_Copy = lc $linha_Copy;          # Coloca todas as letras em minusculas

    my @palavras = split(/\s+/, $linha_Copy);

    foreach my $palavra (@palavras) {
        next if exists $palavrasReservadas{$palavra};  # Pega a lista de pelavras e retira da frequencia
        next if $palavra =~ /^\d+$/;     # Para ignorar numeros
        $frequencia{$palavra}++;
    }
}
close($arq);

# Ordena as palavras pela frequencia, da maior para menor
my @palavras_chave = sort { $frequencia{$b} <=> $frequencia{$a} } keys %frequencia;

my %destaques = map { $_ => 1 } @palavras_chave[0..5];

foreach my $linha (@linhas) {
    # /\e[1;31m deixa a palavra com a cor vermelha e em negrito
    # \e[0m/gi for keys %destaques pega somente as palavras que estão no Hash destaques
    $linha =~ s/\b($_)\b/\e[1;31m$1\e[0m/gi for keys %destaques;
    print "$linha\n";
}