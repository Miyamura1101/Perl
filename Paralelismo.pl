use strict;
use warnings;

my $num_processos = 5;
my @somas;

# Criando um pipe para comunicação entre os processos
pipe(my $leitura, my $escrita) or die "Falha ao criar o pipe: $!";

for (1..$num_processos) {
    my $pid = fork();
   
    if (!defined $pid) {
        die "Falha ao criar o processo: $!";
    }
    elsif ($pid == 0) {

        close $leitura;  # Fecha a extremidade de leitura do pipe
       
        my $num1 = int(rand(10)) + 1;  # Número aleatório entre 1 e 10
        my $num2 = int(rand(10)) + 1;
        my $soma = $num1 + $num2;
       
        print "Processo $_ (PID: $$) Soma: $num1 + $num2 = $soma\n";
  # PID -> Id do Processo 
  # $$ -> Retorna o PID do projeto em questão
       
        # Enviar resultado para o processo 
        print $escrita "$soma\n";
       
        close $escrita;  # Fecha a extremidade de escrita
        exit;
    }
}
close $escrita;  # O processo pai fecha a extremidade de escrita

# O processo pai lê os resultados
while (my $resultado = <$leitura>) {
    push @somas, $resultado;
}

# Aguarda todos os filhos terminarem
while (wait() != -1) {}

my $soma_total = 0;
$soma_total += $_ for @somas;

print "Todos os processos filhos foram concluídos.\n";
print "Soma total dos cálculos: $soma_total\n";