use strict;
use open qw(:std :utf8);    # para não bugar com os acentos
use threads;
use Thread::Queue;
use Term::ReadKey;

my $Destaque = ""; 
my $queue = Thread::Queue->new();  

sub atualizar_palavra {
    my $entrada = "";
    ReadMode('cbreak');

    while (1) {
        my $letra = getc(STDIN);

        if($letra eq "\x7F" || $letra eq "\x08")  # Backspace -> "\x7F" Linux / "\x08" Windows
        {   
            chop $entrada if length($entrada) > 0;
        }
        else
        {
            
            $entrada .= $letra;
        }

        system("clear");

        print "------------------\n";
        print "Entrada: $entrada";
        print "\n------------------\n";

        $queue->enqueue($entrada); 
    }
}

# Thread 2: Processa o texto continuamente e imprime a busca destacada
sub processar_texto {
    while (1) {
    
        $Destaque = $queue->dequeue();

        open(my $arq, "<", "/home/felipe/Perl/Projeto/Texto") or die "Falha ao abrir o arquivo";

        while (my $linha = <$arq>) {

            $linha =~ s/(\Q$Destaque\E)/\e[1;31m$1\e[0m/gi;
            print $linha;
        }
        print "\n";
        close($arq);

        sleep(0.5);
    }
}

# Criando as threads
my $thread1 = threads->create(\&atualizar_palavra);
my $thread2 = threads->create(\&processar_texto);

# Aguarda a execução das threads
$thread1->join();
$thread2->join();
