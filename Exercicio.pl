use strict;

# Primeira Questão

print "Digite algum numero: ";
my $num = <STDIN>;
chomp($num);

# print "O Dobro de $num é ", $num*2;
# print "\n"; 

# Segunda Questão

print "$num elevado a 2 é ", $num**2;   # Exponeciação
print "\n";

# Terceira Questão

my $pi = 3.14159;

print "Diametro (raio: $num): ", $num * $pi;
print "\n";
print "Perimeto (raio: $num): ", $num * 2 * $pi;
print "\n";
print "Área: (raio: $num): ", $pi * $num**2;
print "\n";

# Quarta Questões

