use strict;
use warnings;
use Term::ReadKey;

my $open = 1;
my $procurar;
do{
    print "1 - Adicionar dados de procura\n";
    print "2 - Frequência das palavras\n";
    print "3 - Palavra chave\n";
    print "4 - Pesquisa de palavras\n";
    print "5 - Sair\n";
    print "Escolha um número: ";

    chomp(my $opcao = <STDIN>);

    if ($opcao == 1) {
        print "---------------------\n";
        system("perl ArquivoDados.pl");
        print "---------------------\n";
    } elsif ($opcao == 2) {
        print "---------------------\n";
        system("perl Procura_Frequencia.pl");
        print "---------------------\n";
    } elsif ($opcao == 3) {
        print "---------------------\n";
        system("perl Procura_Chaves.pl");
        print "---------------------\n";
    } elsif ($opcao == 4) {
        print "----------------------------------------------------------------------------------\n";
        print "Se desejar usar esse metodo fique ciente que somente poderá sair fechando o prompt\n";
        print "Mesmo assim deseja realizar a operação (S/N): ";
        chomp($procurar = <STDIN>);

            if($procurar eq 'S' || $procurar eq 's'){
                print "Digite algo: ";
                system("perl Procurar_Threads.pl");
            }
    } elsif ($opcao == 5){
        $open = 0;
    }else {
       print "Opção inválida!\n";
    }
}while($open);

