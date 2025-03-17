use strict; # Informa a necesidade de utilizar o my / our

print "Olá, Mundo!\n";

# Declaração de variaveis

my $nome = "Felipe";
our $idade = 20;
my $altura = 1.8;


print "Nome: $nome, Idade: $idade, Altura: $altura metros\n";

# Arrays

print "-----------\n";

my @frutas = ("Maçã", "Banana", "Laranja", 1, 'a');

print "Segunda fruta: $frutas[1]\n";
print "Primeira fruta: $frutas[0]\n";
print "Terceira fruta: $frutas[2]\n";
print "Quata: $frutas[3]\n";
print "Quinta: $frutas[4]\n";

# Hashes  / {chave => valor} / {'chave'}

print "-----------\n";

my %pessoa = ("nome" => "Felipe", "idade" => 20);

print "Nome: $pessoa{'nome'}, Idade: $pessoa{'idade'}\n";

# Estruturas condicionais

$idade = 19;

if($idade >= 18)
{
    print "Você é maior de idade\n";
}else
{
    print "Você é menor de idade\n";
}

print "-----------\n";

for(my $i = 0; $i <=6; $i++)
{
    print "I = $i\n";
}

print "-----------\n";

my $i = 0;
while($i <= 5)
{
    print "Contado = $i\n";
    $i++;
}

print "-----------\n";

foreach my $fruta (@frutas)
{
    print "Fruta: $fruta\n";
}

print "-----------\n";

# Funções

sauda("Felipe");

sub sauda {
    my ($no) = @_; # paramentros da função
    my ($ida) = 20;
    print "Olá, $no e eu tenho $ida anos \n";
}

print "-----------\n";

# Entrada de Usuario

print "Degite alguma coisa: ";
$nome = <STDIN>;
chomp($nome); # Usado para quebrar a linha, substituindo o \n

print "Olá, $nome\n";

# Arquivos

my $arquivo_saida = "saida.txt";

# '>' -> mostra que o arquivo está sendo aberto para escrita
# Sobreescreve os dados do arquivo
open(my $arquivo, ">", $arquivo_saida) or die "Erro ao abrir o arquivo";
print $arquivo "Olá, mundo dos arquivo de texto\n";
close($arquivo);

# '<' -> mostrar que o arquivo está sendo aberto para leitura
open(my $arquivo, "<", $arquivo_saida) or die "Erro ao abrir o arquivo";
while(<$arquivo>) # Usado para ler linha a linha
{
    print $_; # Lê todadas a linhas;
}
close($arquivo);

# my @nome = ("José", "Luiz", "João");
# my @nomeA = ("Felipe", "Bia", "Hevellyn", "Alana");
# my $ultimo = pop @nome;

# print $ultimo;  # João
# print @nome;    # José, Luiz

# push @nome, $ultimo; 
# print @nome;    # José, Luiz, João

# my $primeiro = shift @nome;

# print $primeiro; # José
# print @nome;     # Luiz, João

# unshift @nome, @nomeA;

# print @nome;     # Felipe, Bia, Hevellny, Alana, Luiz, João

# %pessoa = (
#         1 => "Felipe", 
#         2 => "João", 
#         15 => "Marcos",
#         3 => "Maria"
# );

# print $pessoa{1};   # Felipe
# print $pessoa{15};  # Marcos