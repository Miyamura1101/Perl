print "Olá, Mundo!\n";

# Declaração de variaveis

$nome = "Felipe";
$idade = 20;
$altura = 1.8;

print "Nome: $nome, Idade: $idade, Altura: $altura metros\n";

# Arrays
print "-----------\n";

@frutas = ("Maçã", "Banana", "Laranja");

print "Segunda fruta: $frutas[1]\n";
print "Primeira fruta: $frutas[0]\n";
print "Terceira fruta: $frutas[2]\n";

# Hashes  / {chave => valor} / {'chave'}

print "-----------\n";

%pessoa = ("nome" => "Felipe", "idade" => 20);

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

for($i = 0; $i <=6; $i++)
{
    print "I = $i\n";
}

print "-----------\n";

$i = 0;
while($i <= 5)
{
    print "Contado = $i\n";
    $i++;
}

print "-----------\n";

foreach $fruta (@frutas)
{
    print "Fruta: $fruta\n";
}

print "-----------\n";

# Funções

sauda("Felipe");

sub sauda {
    my ($nome) = @_; # paramentros da função
    my ($idade) = 20;
    print "Olá, $nome e eu tenho $idade anos\n";
}


print "-----------\n";

# Entrada de Usuario

print "Degite alguma coisa: ";
$nome = <STDIN>;
chomp($nome); # Usado para quebrar a linha, substituindo o \n

print "Olá, $nome\n";

# Arquivos

# '>' -> mostra que o arquivo está sendo aberto para escrita
# Sobreescreve os dados do arquivo
open(my $arquivo, ">", "saida.txt") or die "Erro ao abrir o arquivo";
print $arquivo "Olá, mundo dos arquivo de texto\n";
close($arquivo);

# '<' -> mostrar que o arquivo está sendo aberto para leitura
open(my $arquivo, "<", "saida.txt") or die "Erro ao abrir o arquivo";
while(<$arquivo>) # Usado para ler linha a linha
{
    print $_; # Lê todadas a linhas;
}
close($arquivo);