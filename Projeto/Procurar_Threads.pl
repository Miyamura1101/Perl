use strict;
use warnings;
use threads;
use Thread::Queue;

my $Destaque = ""; 
my $queue = Thread::Queue->new();  

sub atualizar_palavra {
    while (1) {
        my $nova_palavra = <STDIN>;
        chomp $nova_palavra;
        $queue->enqueue($nova_palavra);
    }
}

# Thread 2: Processa o texto continuamente e imprime a busca destacada
sub processar_texto {
    while (1) {

        $Destaque = $queue->dequeue();

        open(my $arq, "<", "/home/felipe/Perl/Projeto/Texto") or die "Falha ao abrir o arquivo";
        while (my $linha = <$arq>) {
            $linha =~ s/\b($Destaque)\b/\e[1;31m$1\e[0m/gi if $Destaque ne "";
            print $linha;
        }
        print "\n";
        close($arq);

        sleep(2);  # Pequeno delay para não sobrecarregar
    }
}

# Criando as threads
my $thread1 = threads->create(\&atualizar_palavra);
my $thread2 = threads->create(\&processar_texto);

# Aguarda a execução das threads
$thread1->join();
$thread2->join();
