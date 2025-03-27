package Numero;
use strict;

use overload
    '+' => \&adicao,
    '-' => \&subitracao;

sub new {
    my ($class, $valor) = @_;
    bless \$valor, $class;
}

# $self => O objeto que invocou o método
# $outro => O segundo operador (Pode ser um objeto ou uma variavel escalar)

sub adicao {
    my ($self, $outro) = @_;

    my $valor = ref($outro) eq 'Numero' ? $$outro : $outro;

    my $resultado = $$self + $valor;
    return Numero->new($resultado);
}

sub subitracao {
    my ($self, $outro) = @_;

    my $valor = ref($outro) eq 'Numero' ? $$outro : $outro;

    my $resultado = $$self - $valor;
    return Numero->new($resultado);
}

# O new cria um objeto contendo o numero 10
# $n1 agora é um objeto da classa Numero
# $n1 não possui mais uma valor normal

my $n1 = Numero->new(10);
my $n2 = Numero->new(12);

my $soma = $n1 + $n2;
my $subracao = $n1 - $n2;

print "Soma: $$soma" ;          # 22
print "\n";
print "Subtração:  $$subracao"; # -2
print "\n";



sub duplicar {
    my ($valor) = @_;
    return $valor * 2 if $valor =~ /^\d+$/;  # Se for número, multiplica por 2
    return $valor . $valor;  # Se for string, concatena
}

print duplicar(10), "\n";   # Saída: 20
print duplicar("Perl"), "\n"; # Saída: PerlPerl



