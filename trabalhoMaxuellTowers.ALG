Algoritmo "trabalho_RPG_COMPLETO"
// ============================================================
// TRABALHO RPG - JOGO DE TURNOS COM ELEMENTOS
// Cada jogador escolhe um elemento (Fada, Dragao, Trevas ou
// Sagrado) e percorre 3 torres para recrutar os outros antes
// de enfrentar o chefe final: MAXWELL.
// Sistema de combate: D20 (precisa >= 11 para acertar).
// ============================================================

Var
   elemento, escolha_torre, personagem  : inteiro
   escolhaD, status  : caractere

   // variaveis de controle de recrutamento
      trevasV, dragaoV, sagradoV, fadaV : inteiro
   // variaveis de controle de torres concluidas
      torreDragao, torreTrevas, torreSagrado, torreFada : inteiro

   // atributos Fada (jogavel)
      hpF, manaF, ataqueF, curaF : inteiro
   // atributos Dragao (jogavel)
      hpD, manaD, ataqueD : inteiro
   // atributos Trevas (jogavel)
      hpT, manaT, ataqueT : inteiro
   // atributos Sagrado (jogavel)
      hpS, manaS, ataqueS : inteiro

   // variavel de ataque generica usada nas lutas
      ataque : inteiro


//=========================================
// PROCEDIMENTO: TORRE
// Exibe uma tela de transicao quando o jogador
// confirma um elemento e parte para as torres.
//=========================================
procedimento torre
   inicio
      limpatela()
escreval(" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ")
escreval(" @@  @@@@    @@@@@                  @@@@@@@@@@@@@@    @@@@@@@@@@@@@                 @@@@@          @@ ")
escreval(" @@    @@@@   @@@@@@@@@@@                  @@@@@@@@@@@@@@@@@@                @@@@@@@@@@ @          @@ ")
escreval(" @@     @@@   @@@ @@@@@@@@@@@@@                  @@@@@@                @@@@@@@@@@@@  @@ @          @@ ")
escreval(" @@     @@@   @@@ @@    @@@@@@@@@@@@@@            @@@             @@@@@@@@@@@@       @@ @          @@ ")
escreval(" @@     @@@   @@@ @@           @@@@@@@@@@@@@      @@@       @@@@@@@@@@@              @@ @          @@ ")
escreval(" @@     @@@   @@@ @@                       @@@@@@@@@@@@@@@@@@                        @@ @          @@ ")
escreval(" @@    @@@@   @@@ @@                          @@@@@@@@@@@@                           @@ @          @@ ")
escreval(" @@   @@@     @@@ @@                            @@@@ @@@@                            @@ @          @@ ")
escreval(" @@  @@@      @@@ @@                            @@@@ @@@@                    @@@@    @@ @        @@@@ ")
escreval(" @@@@@        @@@ @@    @@@                     @@@@ @@@@                    @@@@    @@ @    @@@@@@@@ ")
escreval(" @@     @@@@@@@@@ @@    @@@@@                   @@@@ @@@@              @@@@@@@@@@    @@ @  @@@@@@  @@ ")
escreval(" @@     @@@@@@@@@ @@    @@@@@@@@@@              @@@@ @@@@          @@@@@@@@    @@    @@ @@@@@@     @@ ")
escreval(" @@ @@@@@     @@@ @@    @@   @@@@@@@@@          @@@@ @@@@        @@@@@         @@    @@ @@@        @@ ")
escreval(" @@ @@@@      @@@ @@    @@         @@@@@@@      @@@@ @@@@   @@@@@@@            @@    @@ @@@@       @@ ")
escreval(" @@@@@        @@@ @@    @@             @@@      @@@@ @@@@   @@@                @@    @@ @@@@@@     @@ ")
escreval(" @@ @@@@@@    @@@ @@    @@             @@@      @@@@ @@@@   @@@                @@    @@ @  @@@@@@@@@@ ")
escreval(" @@      @@@@@@@@ @@    @@             @@@      @@@@ @@@@   @@@                @@    @@ @    @@@@@@@@ ")
escreval(" @@           @@@ @@    @@             @@@      @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @@@ @@    @@             @@@      @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @@@ @@    @@             @@@      @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @@@ @@    @@             @@@      @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @@@ @@    @@             @@@      @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @@@ @@    @@@@@@@        @@@      @@@@ @@@@   @@@        @@@@@@@@@@    @@ @          @@ ")
escreval(" @@           @@@ @@       @@@@@@      @@@      @@@@ @@@@   @@@      @@@@@@          @@ @          @@ ")
escreval(" @@           @@@ @@          @@@@@@@@@@@@      @@@@ @@@@   @@@  @@@@@@              @@ @          @@ ")
escreval(" @@           @@@ @@                @@@@@@      @@@@ @@@@   @@@@@@                   @@ @          @@ ")
escreval(" @@          @@@@ @@                   @@@      @@@@ @@@@   @@@                      @@ @@@        @@ ")
escreval(" @@          @@@@@@@                            @@@@ @@@@                          @@@@@@@@        @@ ")
escreval(" @@          @@@@@@@@@@@@@@                     @@@@ @@@@                    @@@@@@@@@@@@@@        @@ ")
escreval(" @@          @@@         @@@@@@@@               @@@@ @@@@              @@@@@@@          @@@        @@ ")
escreval(" @@          @@@                @@@@@@@@@@@     @@@@ @@@@   @@@@@@@@@@@@                @@@        @@ ")
escreval(" @@          @@@@@@@                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                @@@@@@@@        @@ ")
escreval(" @@           @@@@@@@@@@@@@                @@@@@@@@@@@@@@@@@@                @@@@@@@@@@ @          @@ ")
escreval(" @@           @@@ @@@@@@@@@@@@@                  @@@@@@                 @@@@@@@@@@   @@ @          @@ ")
escreval(" @@           @   @@      @@@@@@@@@@@@            @@@             @@@@@@@@@@@@       @@ @          @@ ")
escreval(" @@           @   @@                @@@@@@        @@@        @@@@@@                  @@ @          @@ ")
escreval(" @@           @   @@    @@@@@            @@@@@@@@@@@@@@@@@@@@@@             @@@@@    @@ @          @@ ")
escreval(" @@           @   @@    @@@@@@@@@             @@@@@@@@@@@@           @@@@@@@@@@@@    @@ @          @@ ")
escreval(" @@           @   @@    @@@@@@@@@@@@@@@          @@@@@@@           @@@@@@@@@@  @@    @@ @          @@ ")
escreval(" @@           @   @@    @@    @@@@@@@@@@@@@@@   @@@@ @@@@   @@@@@@@@@@         @@    @@ @          @@ ")
escreval(" @@           @   @@    @@              @@@@@   @@@@ @@@@   @@@@               @@    @@ @          @@ ")
escreval(" @@           @   @@    @@                 @@   @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @   @@    @@                 @@   @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @   @@    @@                 @@   @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @   @@    @@                 @@   @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @   @@    @@                 @@   @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @   @@    @@                 @@   @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @   @@    @@                 @@   @@@@ @@@@   @@@                @@    @@ @          @@ ")
escreval(" @@           @   @@    @@                 @@   @@@@ @@@@   @@@          @@@@@@@@    @@ @          @@ ")
escreval(" @@           @   @@    @@@@@@@            @@   @@@@ @@@@   @@@       @@@@@@@@       @@ @          @@ ")
escreval(" @@           @   @@      @@@@@@@@         @@   @@@@ @@@@   @@@   @@@@@@             @@ @          @@ ")
escreval(" @@           @   @@         @@@@@@@@@@@@@@@@   @@@@ @@@@   @@@@@@@@                 @@ @          @@ ")
escreval(" @@           @   @@                            @@@@ @@@@                            @@ @          @@ ")
escreval(" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ")


timer 1000

limpatela

timer 0

escreval (" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   ")
escreval (" @@  @@@@@@@                       @@@@                  @@                 @@@@                   @@   ")
escreval (" @@  @@@  @@@@                    @@@@                   @@                  @@@@                  @@   ")
escreval (" @@ @   @  @@@                   @@@@                    @@                   @@@@                 @@   ")
escreval (" @@  @@@   @@@                  @@@@                     @@                    @@@@                @@   ")
escreval (" @@        @@@                 @@@@                      @@                     @@@@               @@   ")
escreval (" @@        @@@                @@@@                       @@                      @@@@              @@   ")
escreval (" @@@@     @@@@               @@@@                        @@                       @@@@             @@   ")
escreval (" @@  @  @@@@@               @@@@                         @@                        @@@@            @@   ")
escreval (" @@@@  @@@@                @@@@                          @@                         @@@@           @@   ")
escreval (" @@@@@@@@                 @@@@                           @@                          @@@@          @@   ")
escreval (" @@@@@ @@@@@@           @@@@@                            @@                           @@@@@        @@   ")
escreval (" @@    @@ @@@        @@@@@@                              @@                             @@@@@@@    @@   ")
escreval (" @@    @@ @@@@@@@@@@@@                                   @@                                   @@@@@@@   ")
escreval (" @@    @@      @@@@@@@@@@                                @@                                 @@@@@@@@@   ")
escreval (" @@     @@        @@@@@@@@@                            @@@@@@                             @@@@@@@@ @@   ")
escreval (" @@       @@@        @@@@@@@@@                        @@@@ @@@@                         @@@@@@@@@  @@   ")
escreval (" @@          @@@@@@@@@@@@@@@@@                      @@@@@   @@@@                     @@@@@@@@@@@@@@@@   ")
escreval (" @@                   @ @@ @ @@@@@@@             @@@@@@       @@@@@@@           @@@@@@@@@@@@       @@   ")
escreval (" @@                   @ @@ @@@@@@@@@@@@@@@@@@@@@@@@@            @@@@@@@@@@@@@@@@@ @@@@@@@@@@       @@   ")
escreval (" @@                   @ @@        @@@@@@@@@@@@@@@@                 @@@@@@@@@@@@@@@@      @ @       @@   ")
escreval (" @@                   @ @@                     @@@@@@@@@@@@@@@@@@@@@@@                   @ @       @@   ")
escreval (" @@                   @ @@    @@@@@@              @@@@@@@@@@@@@@@@@                  @@@@@ @       @@   ")
escreval (" @@                   @ @@    @@  @@@@@                 @@@@ @@@@                @@@@@  @@ @       @@   ")
escreval (" @@                   @ @@    @@      @@@@@@@           @@@@ @@@@           @@@@@@      @@ @       @@   ")
escreval (" @@            @@@@@  @ @@    @@            @@@@@@      @@@@ @@@@      @@@@@@           @@ @       @@   ")
escreval (" @@       @@@@@@@ @@@@@ @@    @@               @@@      @@@@ @@@@      @@@              @@ @     @@@@   ")
escreval (" @@    @@@@@@@@@   @@@@ @@    @@               @@@      @@@@ @@@@      @@@              @@ @  @@@@@@@   ")
escreval (" @@ @@@@@@@           @ @@    @@               @@@      @@@@ @@@@      @@@              @@ @  @@@@ @@   ")
escreval (" @@@@@@@              @ @@    @@               @@@      @@@@ @@@@      @@@              @@ @ @@@@  @@   ")
escreval (" @@                   @ @@    @@               @@@      @@@@ @@@@      @@@              @@ @@@     @@   ")
escreval (" @@@@@@@@@@@@@    @@@@@ @@    @@               @@@      @@@@ @@@@      @@@              @@ @ @@@@@@@@   ")
escreval (" @@  @@@@@@@@@@@@@@@@@@ @@    @@               @@@      @@@@ @@@@      @@@              @@ @     @@@@   ")
escreval (" @@          @@@@@@   @ @@    @@@@@@           @@@      @@@@ @@@@      @@@          @@@@@@ @       @@   ")
escreval (" @@                   @ @@       @@@@@@@@      @@@      @@@@ @@@@      @@@        @@@@@@@ @@       @@   ")
escreval (" @@                @@@@@@@          @@@@@@@@@  @@@      @@@@ @@@@      @@@  @@@@@@@       @@       @@   ")
escreval (" @@                @@@@@@@@@                @@@@@@      @@@@ @@@@      @@@@@@@        @@@@@@ @@    @@   ")
escreval (" @@                @@@  @@@@@@@@@@@@@                   @@@@ @@@@              @@@@@@@@@@@@  @@    @@   ")
escreval (" @@                @@@        @@@@@@@@@@@@              @@@@ @@@@         @@@@@@@@@@         @@    @@   ")
escreval (" @@                @@@              @@@@@@@@@@@@        @@@@ @@@@   @@@@@@@@@@@@             @@    @@   ")
escreval (" @@                @@@@@@@@              @@@@@@@@@@@@@@ @@@@ @@@@ @@@@@@@@@              @@@@@@    @@   ")
escreval (" @@                  @ @@@@@@@@@@               @@@@@@@@@@@@@@@@@@@@@              @@@@@@@@@ @     @@   ")
escreval (" @@                  @ @@       @@@@@@                   @@@                 @@@@@@@@     @@ @     @@   ")
escreval (" @@                  @ @@           @@@@@@@@             @@             @@@@@@            @@ @     @@   ")
escreval (" @@                  @ @@                  @@@@@@@@@@@@  @@   @@@@@@@@@@@@                @@ @     @@   ")
escreval (" @@                  @ @@                      @@@@@@@@@@@@@@@@@@@@                       @@ @     @@   ")
escreval (" @@                  @ @@    @@                     @@@@@@@@@@@@                      @@  @@ @     @@   ")
escreval (" @@                  @ @@    @@@@                      @@@@ @@@@                    @@@@  @@ @     @@   ")
escreval (" @@                  @ @@    @@@@@@@@@                 @@@@ @@@@               @@@@@@@@@  @@ @     @@   ")
escreval (" @@                  @ @@    @@     @@@@@              @@@@ @@@@         @@@@@@@@     @@  @@ @     @@   ")
escreval (" @@                  @ @@    @@        @@@@@@          @@@@ @@@@     @@@@@            @@  @@ @     @@   ")
escreval (" @@                  @ @@    @@             @@@@@      @@@@ @@@@     @@@              @@  @@ @     @@   ")
escreval (" @@                  @ @@    @@               @@@      @@@@ @@@@     @@@              @@  @@ @     @@   ")
escreval (" @@                  @ @@    @@               @@@      @@@@ @@@@     @@@              @@  @@ @     @@   ")
escreval (" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   ")


timer 1000

limpatela

timer 0


escreval(" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  ")
escreval(" @@                                                                                                @@  ")
escreval(" @@                                                                      @  @                      @@  ")
escreval(" @@                                                                      @  @                      @@  ")
escreval(" @@                                                                      @@@@   @    @             @@  ")
escreval(" @@                                                                @     @@@@@@@    @@             @@  ")
escreval(" @@          @@@@@@@@@                                            @@@    @@  @@@    @@@@@@@@@@@@@@@@@  ")
escreval(" @@      @@@@@       @@@@@                                      @@@@@@       @@@@  @@@@@@@@@@@@@@@@@@  ")
escreval(" @@    @@@@        @@@  @@@@                                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@  ")
escreval(" @@    @@         @@@@@  @@@                                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@  ")
escreval(" @@  @@@@         @@@@@   @@@@                               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        @@  ")
escreval(" @@  @@@  @@@       @      @@@                        @@     @@@ @@    @@  @@@@@@    @@            @@  ")
escreval(" @@  @@@@@@@@@             @@@                      @@@@@@    @@ @    @@  @@@@@@@@@   @@@@@@       @@  ")
escreval(" @@  @@@  @@@              @@@                    @@@@@@@@@    @       @ @@@@@@@@@@@ @@@@          @@  ")
escreval(" @@  @@@@            @@   @@@@                        @@@@              @@@@@@@@@@@@@@@@           @@  ")
escreval(" @@    @@          @@@@@@@@@                          @@@@@@@@@@    @@@@@@@    @@@@@@@@@           @@  ")
escreval(" @@    @@@@        @@@@@@@@@                          @@@@@@@@@@  @@@@@@         @@@               @@  ")
escreval(" @@      @@@@@       @@@@@                            @@@@@@@@    @ @         @@ @@ @@             @@  ")
escreval(" @@          @@@@@@@@@                                @@                                           @@  ")
escreval(" @@                                                   @@                                           @@  ")
escreval(" @@                                                 @@@@@@                                         @@  ")
escreval(" @@                                                @@@@@@@@                                        @@  ")
escreval(" @@                                              @@@  @@  @@@                                      @@  ")
escreval(" @@                                            @@@@   @@   @@@@                                    @@  ")
escreval(" @@                                           @@@@    @@    @@@@                                   @@  ")
escreval(" @@            @@@@@                        @@@@@     @@     @@@@@                                 @@  ")
escreval(" @@       @@@@@@@ @@@@@                  @@@@@@@      @@      @@@@@                              @@@@  ")
escreval(" @@    @@@@@@      @@@@@@               @@@@@@@       @@       @@@@@@                         @@@@@@@  ")
escreval(" @@ @@@@@@@           @@@        @@@@@@@@@@@@@       @@@@       @@@@@@@@@@@@                  @@@@ @@  ")
escreval(" @@@@@@@               @@@@       @@@@@   @@        @@  @@      @@    @@@@@                  @@@@  @@  ")
escreval(" @@                     @@@         @@@@@  @@      @@    @@    @@  @@@@@                   @@@     @@  ")
escreval(" @@@@@@@@@            @@@@@@@@@       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                       @@@@@@@@  ")
escreval(" @@  @@@@@@@@@@   @@@@@@@@@@@@@        @@@            @@ @@         @@                           @@@@  ")
escreval(" @@          @@@@@@                    @@@            @@ @@         @@                             @@  ")
escreval(" @@                                    @@@            @@ @@         @@                             @@  ")
escreval(" @@                                    @@@            @@ @@         @@                             @@  ")
escreval(" @@                                    @@@ @@@@@@     @@ @@  @@@@@@ @@                             @@  ")
escreval(" @@                                    @@@ @@@@@@@@@  @@ @@ @@@@@@@ @@                             @@  ")
escreval(" @@                                    @@@ @@     @@  @@ @@ @@   @@ @@                             @@  ")
escreval(" @@                                    @@@ @@     @@  @@ @@ @@   @@ @@                             @@  ")
escreval(" @@                                    @@@ @@     @@  @@ @@ @@   @@ @@                             @@  ")
escreval(" @@                                    @@@ @@@@@  @@  @@ @@ @@  @@@ @@                             @@  ")
escreval(" @@                                  @@@@@     @@@@@  @@ @@ @@@@@   @@@@                           @@  ")
escreval(" @@                                  @@@@@@@@@        @@ @@     @@@@@@@@                           @@  ")
escreval(" @@                                  @@@@@@@@@@@      @@ @@   @@@@@@@@@@                           @@  ")
escreval(" @@                                    @@@@@@@@@@@@@@ @@ @@@@@@@@@@@@@                             @@  ")
escreval(" @@                                    @@@ @@@@@@@@@@@@@@@@@@@@@@@@ @@                             @@  ")
escreval(" @@                                    @@@         @@@@@@@@@@       @@                             @@  ")
escreval(" @@                                    @@@           @@@@@@         @@                             @@  ")
escreval(" @@                                    @@@            @@ @@         @@                             @@  ")
escreval(" @@                                    @@@ @@@@       @@ @@    @@@@ @@                             @@  ")
escreval(" @@                                    @@@ @@@@@@@@@  @@ @@ @@@@@@@ @@                             @@  ")
escreval(" @@                                    @@@ @@     @@  @@ @@ @@   @@ @@                             @@  ")
escreval(" @@                                    @@@ @@     @@  @@ @@ @@   @@ @@                             @@  ")
escreval(" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  ")
      escreval("|------------------------|")
      escreval("  INDO PARA AS TORRES...  ")
      escreval("|------------------------|")
   fimprocedimento


//=========================================
// PROCEDIMENTOS: MOSTRAR STATUS
// Exibem os atributos de cada elemento antes
// da aventura comecar. O loop so sai quando
// o jogador digita "1" confirmando que leu.
// Tambem inicializa os atributos do personagem.
//=========================================
procedimento mostrar_Status_F
   var
      x : caractere
   inicio
      limpatela()
      enquanto x <> "1" faca
         escreval("|---------------------------|")
         escreval("|     HP      |     100     |")
         escreval("|---------------------------|")
         escreval("|   ATAQUE    |     15      |")
         escreval("|---------------------------|")
         escreval("|    MANA     |     100     |")
         escreval("|---------------------------|")
         escreval("|    CURA     | +30 DE CURA |")
         escreval("|---------------------------|")
         hpF <- 100
         manaF <- 100
         ataqueF <- 15
         curaF <- 30
         escreval("PREPARADO PARA ENFRENTAR OS ANDARES?")
         escreval("         1 - SIM || 2 - NAO         ")
         leia(x)
      fimenquanto
   fimprocedimento

procedimento mostrar_Status_D
   var
      x : caractere
   inicio
      limpatela()
      enquanto x <> "1" faca
         escreval("|----------------------------|")
         escreval("|     HP      |      180     |")
         escreval("|----------------------------|")
         escreval("|   ATAQUE    |      25      |")
         escreval("|----------------------------|")
         escreval("|    MANA     |      60      |")
         escreval("|----------------------------|")
         escreval("|   ESCAMAS   |   -60 DANO   |")
         escreval("| ANCESTRAIS  |   RECEBIDO   |")
         escreval("|----------------------------|")
         hpD <- 180
         manaD <- 60
         ataqueD <- 25
         escreval("PREPARADO PARA ENFRENTAR OS ANDARES?")
         escreval("         1 - SIM || 2 - NAO         ")
         leia(x)
      fimenquanto
   fimprocedimento

procedimento mostrar_Status_T
   var
      x : caractere
   inicio
      limpatela()
      enquanto x <> "1" faca
         escreval("|---------------------------|")
         escreval("|     HP      |      120    |")
         escreval("|---------------------------|")
         escreval("|   ATAQUE    |      20     |")
         escreval("|---------------------------|")
         escreval("|    MANA     |      80     |")
         escreval("|---------------------------|")
         escreval("|   ROUBO     | -30% ATAQUE |")
         escreval("|  DE VIDA    |  INIMIGOS   |")
         escreval("|---------------------------|")
         hpT <- 120
         manaT <- 80
         ataqueT <- 20
         escreval("PREPARADO PARA ENFRENTAR OS ANDARES?")
         escreval("         1 - SIM || 2 - NAO         ")
         leia(x)
      fimenquanto
   fimprocedimento

procedimento mostrar_Status_S
   var
      x : caractere
   inicio
      limpatela()
      enquanto x <> "1" faca
         escreval("|------------------------------|")
         escreval("|     HP      |      130       |")
         escreval("|------------------------------|")
         escreval("|   ATAQUE    |      20        |")
         escreval("|------------------------------|")
         escreval("|    MANA     |      110       |")
         escreval("|------------------------------|")
         escreval("|   BENCAO    |  +20% ATAQUE   |")
         escreval("|  CELESTIAL  |     EQUIPE     |")
         escreval("|------------------------------|")
         hpS <- 130
         manaS <- 110
         ataqueS <- 20
         escreval("PREPARADO PARA ENFRENTAR OS ANDARES?")
         escreval("         1 - SIM || 2 - NAO         ")
         leia(x)
      fimenquanto
   fimprocedimento


//=========================================
// PROCEDIMENTOS: ESCOLHA DE PERSONAGEM
// Cada procedimento exibe a arte ASCII do
// elemento, pede confirmacao e, se aceito:
//   - Define "personagem" com o codigo do elemento
//     (10=Fada, 20=Dragao, 30=Trevas, 40=Sagrado)
//   - Marca o elemento como ja recrutado
//   - Oferece ver o status antes de ir as torres
// Se recusar (escolhaD != "1"), volta ao menu.
//=========================================
procedimento fada
   inicio
      limpatela()
      escreval ("                                   /\                                     ")
 escreval ("                                  /  \                                    ")
 escreval ("                                  \  /                                    ")
 escreval ("                    *              \/                                     ")
 escreval ("                             /\    /\    /\                               ")
 escreval ("       *           *        /  \  /  \  /  \                              ")
 escreval ("                           / 0  \/ 0  \/ 0  \                             ")
 escreval ("           @@@@@           @@@@@@@@@@@@@@@@@@@@        @@@@@              ")
 escreval ("    *     @@** @@        @@@                  @@      @@ **@@@            ")
 escreval ("         @@**   @@       @@                    @@    @@    **@@@          ")
 escreval ("        @@**     @@     @@    @@     @@@@@     @@   @@       **@@@        ")
 escreval ("*      @@**       @@   @@   @@ @@@  @@   @@    @@  @@         ***@@       ")
 escreval ("      @@**         @@  @@  @@    @@@@    @@    @@ @@           ***@@      ")
 escreval ("      @@**          @@  @@ @@(0      0)  @@   @@ @@             ***@@     ")
 escreval ("       @@**          @@  @@ @@   __     @@   @@ @@               **@@     ")
 escreval ("    *  @@**           @  @@  @          @   @@ @@               **@@      ")
 escreval ("        @@**           @@@@@@@@@@@@@@@@@@@ @@@@@               **@@       ")
 escreval ("         @@**         @@@@@@@@@@@@@@@@@@@@@@@@                **@@        ")
 escreval ("          @@**        @@  @@ @@     @@ @@  @@               ***@@         ")
 escreval ("           @@**      @@  @@  @@@   @@@  @@  @@            ***@@@          ")
 escreval ("          @@**      @@  @@      @@@      @@  @@          **@@@@@@         ")
 escreval ("         @@**     @@  @@ @@@@@@     @@@@@@ @@  @@            ***@@@       ")
 escreval ("        @@**     @@  @@   @@           @@   @@  @@            ***@@@      ")
 escreval ("        @@**    @@  @@    @@           @@    @@   @@           ***@@      ")
 escreval ("        @@**   @@  @@     @@           @@     @@   @@          ***@@      ")
 escreval ("         @@**@@@   @@    @@             @@    @@    @@       ***@@@       ")
 escreval ("          @@@@    @@    @@               @@   @@ @   @@     ***@@@        ")
 escreval ("          @@ @@@ @@  @@@@                 @@@  @@ @@ @@   ****@@@         ")
 escreval ("          @@ @ @@@  @@@@    @     @    @   @@@    @ @@ *****@@@@          ")
 escreval ("           @@@   @@@@ @@    @     @    @   @@@@@@ @@      @@@             ")
 escreval ("                      @@    @     @    @   @@   @@@@@@@@@@@@              ")
 escreval ("                      @@    @     @    @   @@                             ")
 escreval ("                      @@    @     @    @   @@                             ")
 escreval ("                  @   @     @     @    @    @   @                         ")
 escreval ("                 @@@ @@     @     @    @    @@ @@@                        ")
 escreval ("                 @ @@@      @     @    @     @@@ @                        ")
 escreval ("                 @@@@@@    @      @     @   @@@@@@                        ")
 escreval ("                      @@@@@ @@@@@@ @@@@@ @@@@@                            ")
      escreval("-------------------------------------------")
      escreval("VOCE TEM CERTEZA DE ESCOLHER O ELEMENTO FADA?")
      escreval("1 - SIM || 2 - NAO")
      escreval("-------------------------------------------")
      leia(escolhaD)
      limpatela()
      se escolhaD = "1" entao
         escreval("VC ESCOLHEU O ELEMENTO FADA")
         escreval("-------------------------------------------")
         escreval("Agora voce ira trilhar o caminho das torres para chegar ao desafio final, boa sorte...")
         escreval("-------------------------------------------")
         fadaV <- 2
         personagem <- 10
         timer 4000
         limpatela()
         timer 0
         escreval("Voce deseja ver o status da sua classe?")
         escreval("1 - SIM || 2 - NAO")
         leia(status)
         se status = "1" entao
            elemento <- 0
            mostrar_Status_F()
            torre()
         senao
            torre()
            elemento <- 0
         fimse
      senao
         elemento <- 1
         limpatela()
      fimse
   fimprocedimento

procedimento sagrado
   inicio
      limpatela()
 escreval ("                             @@@@@@@@@@@@@@@@@@@                                     ")
 escreval ("                         @@@@@                  @@@@@                                ")
 escreval ("                        @@    @@@@@@@@@@@@@@@@@@@   @@@                              ")
 escreval ("                       @@   @@@                 @@@  @@@                             ")
 escreval ("                        @@    @@@@@@@@@@@@@@@@@@@   @@@                              ")
 escreval ("                         @@@@                     @@@@                               ")
 escreval (" @@@@@@@                 @@ @@@@@@@@@@@@@@@@@@@@@@@ @@                 @@@@@@@       ")
 escreval (" (___ @@@@@@            @@@        @@      @@       @@@            @@@@@@____)       ")
 escreval ("  (___(__@@@@@          @@@     @@@@@      @@@@@    @@@           @@@@@__)__)        ")
 escreval ("   (_(_______@@         @@@     @@            @@    @@@          @@______)_)         ")
 escreval ("    (__(_____@@@        @@@@    @@@@@      @@@@@   @@@@        @@@_____)___)         ")
 escreval ("     (__(____@@@@        @@@@      @@      @@     @@@@       @@@@______)__)          ")
 escreval ("      (__(_____@@@        @@@@     @@      @@    @@@@        @@@______)__)           ")
 escreval ("       (__(_____@@@        @@@@@@@@@@@@@@@@@@@@@@@@@        @@@______)__)            ")
 escreval ("       (___(_____ @@@      @@@@@@@@@@@@@@@@@@@@@@@@@       @@@_______)__)            ")
 escreval ("      (___(______(__@@@@@@@@   @               @   @@@@@@@@@______)_____)            ")
 escreval ("      (______(____(__@@  @@    @               @   @@_______)____)____)              ")
 escreval ("        (______(____(___@@   @@                @@   @@_____)______)___)              ")
 escreval ("         (______(______@@   @@@                @@@   @@___)____)______)              ")
 escreval ("          (_______(___@@   @@@                  @@@   @@___)________)                ")
 escreval ("           (___(___(@@    @@@                    @@@    @@______)__)                 ")
 escreval ("               (___@@    @@@                      @@@    @@____)                     ")
 escreval ("                  @@    @@@                        @@@    @@                         ")
 escreval ("                 @@    @@@@                        @@@@    @@                        ")
 escreval ("                 @@    @@@                          @@@    @@                        ")
 escreval ("                @@ @@  @@        @@@@@@@@@@@         @@  @@ @@                       ")
 escreval ("                @@ @@@@@         @@       @@          @@@@@ @@                       ")
 escreval ("                 @@@@ @@        @@@       @@@@        @@ @@@@                        ")
 escreval ("                      @@       @@@         @@@@       @@                             ")
 escreval ("                      @@@    @@@@            @@@@    @@@                             ")
 escreval ("                      @@@@@@@@@@@            @@@@@@@@@@                              ")
 escreval ("                     @@@@    @@@              @@     @@@@                            ")
 escreval ("                    @@@       @@@              @@       @@@                          ")
 escreval ("                  @@@        @@@              @@@        @@@                         ")
 escreval ("                  @@@@@@@@@@@@@@              @@@@@@@@@@@@@@                         ")
      escreval("")
      escreval("VOCE TEM CERTEZA DE ESCOLHER O ELEMENTO SAGRADO?")
      escreval("1 - SIM || 2 - NAO")
      leia(escolhaD)
      limpatela()
      se escolhaD = "1" entao
         escreval("VC ESCOLHEU O ELEMENTO SAGRADO")
         escreval("-------------------------------------------")
         escreval("Agora voce ira trilhar o caminho das torres para chegar ao desafio final, boa sorte...")
         escreval("-------------------------------------------")
         personagem <- 40
         sagradoV <- 1
         timer 4000
         limpatela()
         timer 0
         escreval("Voce deseja ver o status da sua classe?")
         escreval("1 - SIM || 2 - NAO")
         leia(status)
         se status = "1" entao
            elemento <- 0
            mostrar_Status_S()
            torre()
         senao
            torre()
            elemento <- 0
         fimse
      senao
         elemento <- 1
         limpatela()
      fimse
   fimprocedimento

procedimento trevas
   inicio
      limpatela()
   escreval("           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   ")
   escreval("      @@@@@@@@@                        @@@@@@@@@   ")
   escreval("     @@@@@                                  @@@@@   ")
   escreval("   @@@@@@                                    @@@@@@ ")
   escreval("   @@@@                                        @@@@   ")
   escreval(" @@@@@                @@@@@@@@@@                @@@@@ ")
   escreval("@@@@             @@@@@@@@     @@@@@@@             @@@@ ")
   escreval("@@@@            @@                  @@            @@@@ ")
   escreval("@@@        @@@  @@ @@     @@     @@  @@  @@        @@@  ")
   escreval("@@@        @@@@@@  @@@@   @@   @@@@  @@@@@@        @@@  ")
   escreval("@@@        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        @@@  ")
   escreval("@@@           @@@                    @@@           @@@  ")
   escreval("@@@             @@@@@@@        @@@@@@@             @@@  ")
   escreval("@@@  @@@@@@@@@@@@@    @@@@@@@@@@  @@@@@@@@@@@@@@@  @@@  ")
   escreval("@@@  @@@@   @@@@@@@@@@         @@@@@@@@@@@   @@@@@ @@@  ")
   escreval("@@@ @@@             @@@        @@@             @@@ @@@  ")
   escreval("@@@ @@@              @@@      @@@@             @@@ @@@  ")
   escreval("@@@ @@   @@@@@        @@@     @@        @@@@@   @@ @@@  ")
   escreval("@@@ @@   @@@@@@@@@@@              @@@@@@@@@@@   @@ @@@  ")
   escreval("@@@ @@   @@@@@@@@@@@              @@@@@@@@@@@   @@ @@@  ")
   escreval("@@@ @@   @@      @@@              @@@      @@   @@ @@@  ")
   escreval("@@@ @@   @@      @@@       @      @@@      @@   @@ @@@  ")
   escreval(" @@@@@   @@@@@@@@@@@      @@@     @@@@@@@@@@@   @@@@@   ")
   escreval(" @@@                     @@@@@                    @@@  ")
   escreval(" @@@                    @@   @@                   @@@  ")
   escreval(" @@@              @@              @@              @@@  ")
   escreval(" @@@              @@              @@              @@@  ")
   escreval(" @@@@            @@@              @@@            @@@@  ")
   escreval("  @@@@@      @@@@@@                @@@@@@      @@@@@   ")
   escreval("      @@@@@@@@                          @@@@@@@@       ")
   escreval("      @@@  @@@                          @@@  @@@   ")
   escreval("      @@@  @@@@                       @@@@@  @@@   ")
   escreval("      @@@   @@@@ @ @ @ @ @ @ @ @ @ @ @ @@@   @@@   ")
   escreval("      @@@@  @ @ @ @ @ @ @ @ @ @ @ @ @ @     @@@@   ")
   escreval("      @@@@   @ @ @ @ @ @ @ @ @ @ @ @ @      @@@@   ")
   escreval("        @@@@                              @@@@     ")
   escreval("         @@@                             @@@@   ")
   escreval("         @@@@                            @@@@   ")
   escreval("           @@@@@@@                  @@@@@@@     ")
   escreval("               @@@@@              @@@@@@       ")
   escreval("                @@@@@@@@@@@@@@@@@@@@@@        ")
   escreval("                     @@@@@@@@@@@@@            ")
      escreval("")
      escreval("VOCE TEM CERTEZA DE ESCOLHER O ELEMENTO TREVAS?")
      escreval("1 - SIM || 2 - NAO")
      leia(escolhaD)
      limpatela()
      se escolhaD = "1" entao
         escreval("VC ESCOLHEU O ELEMENTO DAS TREVAS")
         escreval("-------------------------------------------")
         escreval("Agora voce ira trilhar o caminho das torres para chegar ao desafio final, boa sorte...")
         escreval("-------------------------------------------")
         personagem <- 30
         trevasV <- 1
         timer 4000
         limpatela()
         timer 0
         escreval("Voce deseja ver o status da sua classe?")
         escreval("1 - SIM || 2 - NAO")
         leia(status)
         se status = "1" entao
            elemento <- 0
            mostrar_Status_T()
            torre()
         senao
            torre()
            elemento <- 0
         fimse
      senao
         elemento <- 1
         limpatela()
      fimse
   fimprocedimento

procedimento dragao
   inicio
      limpatela()
escreval ("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
escreval ("@@                     @@@     @@                           @@                             @@     @@  ")
escreval ("@@                    @@@@@    @@                          @@@@                           @@@@    @@  ")
escreval ("@@                    @@ @@    @@                         @@@ @@@                         @@ @@@  @@  ")
escreval ("@@                   @@   @@@  @@                        @@@   @@@                       @@   @@@ @@  ")
escreval ("@@                  @@@    @@  @@                        @@     @@                      @@     @@ @@  ")
escreval ("@@                  @@      @@@@@                       @@       @@                    @@@      @@@@  ")
escreval ("@@                 @@        @@@@                     @@@         @@                  @@@        @@@  ")
escreval ("@@               @@@@          @@                    @@@          @@@                @@          @@@  ")
escreval ("@@               @@@            @@                   @@            @@@              @@            @@  ")
escreval ("@@              @@     @@@@      @@                 @@               @@            @@@     @@@    @@  ")
escreval ("@@             @@     @@  @@      @@               @@     @@@         @@@          @@     @@  @@  @@  ")
escreval ("@@            @@@    @@    @@     @@               @@   @@@ @@@@  @@@@@@@          @@    @@    @@ @@  ")
escreval ("@@            @@     @@    @@     @@               @@   @@   @@@  @@  @@@          @@    @@    @@ @@  ")
escreval ("@@            @@     @@    @@     @@@@@@@@@@@@@@@@@@@   @@   @@@  @@   @@@@@@@@@@@@@@    @@@@@@@@ @@  ")
escreval ("@@            @@     @@@@@@@@                           @@@@@@@@  @@  @@     @@@@                 @@  ")
escreval ("@@            @@                                                 @@@  @@     @@@@@@               @@  ")
escreval ("@@            @@  @@@@@@@@@@@                                  @@@@  @@@  @@@@   @@               @@  ")
escreval ("@@            @@@@@@@@@   @@@@           @@@@@@@@@@@@@@@@@@@@@@@@@   @@@@@@@     @@               @@  ")
escreval ("@@            @@@@      @   @@@@       @@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@               @@  ")
escreval ("@@            @@@      @@@    @@@@@@   @@@  @@@@@             @@@@@@@@@@      @@@@                @@  ")
escreval ("@@            @@@                  @@@@@@@@@@@                            @@@@@@                @@@@  ")
escreval ("@@            @@@                       @@@    @@@@@@@@@@@@@           @@@@@@@              @@@@@@@@   ")
escreval ("@@            @@@@@@@@@@@@@@@                @@@@ @@@   @@@       @@@@@@@@@             @@@@@@@   @@   ")
escreval ("@@            @@@@@@@@@@@@@@@@@                @@@@@    @@       @@@@@  @@@@@@@     @@@@@@@@@     @@   ")
escreval ("@@            @@         @@@@@@@@@@@            @@@@@@@@@@     @@@           @@@@@@@@@            @@   ")
escreval ("@@            @@      @@@@      @@@@@                          @@                                 @@   ")
escreval ("@@          @@@@@@@@@@@@@@@@@@   @@@@@@@@                    @@@@@@@@@@@@@                        @@   ")
escreval ("@@         @@@           @@@@       @@@@@@@@@                      @@@@@                          @@   ")
escreval ("@@         @@@@      @@@@@@@@    @@@@@@     @@@@@@            @@@@@@@                             @@   ")
escreval ("@@           @@@@  @@@@@         @@@@         @@@            @@@                                  @@   ")
escreval ("@@            @@@@@@@ @@@    @@@@@@@   @@@@@@@@@             @@@@                                 @@   ")
escreval ("@@            @@        @@ @@@@@@@  @ @@@@@@@                   @@@@@@@@@@                        @@   ")
escreval ("@@            @@       @@@@@@@@ @@@@@@@@@@                        @@@@@@@@                        @@   ")
escreval ("@@            @@      @@@@@@@@@@@@@@@@@            @@@@@@@@@@@@@@@@@   @@@                        @@   ")
escreval ("@@            @@     @@@@@@@@@@@@@@@@          @@@@@@@@@                @@@@@                     @@   ")
escreval ("@@            @@     @@                    @@@@@@@@@@@@@@                   @@@@@@@@              @@   ")
escreval ("@@            @@     @@                 @@@@@@         @@@@@@                   @@@@@@@@@@@       @@   ")
escreval ("@@            @@     @@@@@@@@@@@@@@@@@@@@@                  @@@@@@@                       @@@@@@  @@   ")
escreval ("@@            @@      @@@@@@@@@@@@@@@@@@                       @@@@@@@                       @@@@ @@   ")
escreval ("@@            @@                                   @@@               @@@@@@@@                   @@@@   ")
escreval ("@@            @@                              @@@@@@@@@@@@               @@@@@@@@                 @@   ")
escreval ("@@            @@                        @@@@@@@          @@@@@                   @@@@@@@@@@       @@   ")
escreval ("@@            @@                      @@@@@                  @@@@                       @@@@      @@   ")
escreval ("@@            @@                 @@@@@@                         @@@@@                      @@@@@@ @@   ")
escreval ("@@            @@               @@@                                   @@                         @@@@   ")
escreval ("@@            @@          @@@@@                                       @@@@@                      @@@   ")
escreval ("@@            @@       @@@@                                                @@                     @@   ")
escreval ("@@            @@   @@@@@                                                    @@@@@                 @@   ")
escreval ("@@            @@@@@@                                                             @@@              @@   ")
escreval ("@@         @@@@@@                                                                  @@@@           @@   ")
escreval ("@@     @@@@@                                                                          @@@@        @@   ")
escreval ("@@  @@@@@@                                                                               @@@@     @@   ")
escreval ("@@@@@                                                                                       @@@@@@@@   ")
escreval ("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   ")
      escreval("")
      escreval("VOCE TEM CERTEZA DE ESCOLHER O ELEMENTO DRAGAO?")
      escreval("1 - SIM || 2 - NAO")
      leia(escolhaD)
      limpatela()
      se escolhaD = "1" entao
         escreval("VC ESCOLHEU O ELEMENTO DRAGAO")
         escreval("-------------------------------------------")
         escreval("Agora voce ira trilhar o caminho das torres para chegar ao desafio final, boa sorte...")
         escreval("-------------------------------------------")
         personagem <- 20
         dragaoV <- 1
         timer 2500
         limpatela()
         timer 0
         escreval("Voce deseja ver o status da sua classe?")
         escreval("1 - SIM || 2 - NAO")
         leia(status)
         se status = "1" entao
            elemento <- 0
            mostrar_Status_D()
            torre()
         senao
            torre()
            elemento <- 0
         fimse
      senao
         elemento <- 1
         limpatela()
      fimse
   fimprocedimento


//=========================================
// TORRE DO DRAGAO
// Contem 3 procedimentos:
//   ir_embora_dragao : tenta fugir (D20 >= 11)
//   luta_dragao      : combate por turnos
//   historia_conversar_dragao : convence o dragao
//                              (D20 >= 11) ou luta
// cenario_dragao escolhe qual dos 3 chamar.
// Se o jogador E do Dragao, a torre e bloqueada.
//=========================================
procedimento ir_embora_dragao
   var
      y : inteiro
      x : caractere
   inicio
      limpatela()
      escreval("=== TENTANDO FUGIR ===")
      escreval("Voce tenta sair sem fazer barulho...")
      escreval("Role um D20 para tentar fugir (precisa de 11+)!")
      escreval("Pressione ENTER para rolar...")
      leia(x)
      aleatorio 1,20
      leia(y)
      aleatorio off
      escreval("Voce tirou: ", y, " no D20!")
      se y >= 11 entao
         escreval("CONSEGUIU FUGIR!")
         escreval("O Dragao ronca enquanto voce escapa pelas sombras...")
         escreval("(Você fugiu da torre - o Dragão não foi recrutado)")
         torreDragao <- 0
      senao
         escreval("VOCE ACORDOU O DRAGÃO!")
         escreval("O Dragao abre um olho e sorri... 'Interessante.'")
         timer 1500
         timer 0
         historia_conversar_dragao()
      fimse
      escreval("Pressione ENTER para continuar...")
      leia(x)
   fimprocedimento

// luta_dragao: combate principal da torre do Dragao.
// Cada turno: inimigo rola D20 (>= 11 acerta),
// depois jogador escolhe habilidade e rola D20.
// Variaveis locais de controle:
//   turno_perdido : inimigo perde proximo turno (sono/atordoamento)
//   escudo_ativo  : proximo dano recebido e bloqueado (Dragao/Sagrado)
//   bonus_ataque  : flag de ataque aumentado (Sagrado - Bencao Celestial)
// Loop termina quando vida do boss ou HP do jogador chegam a 0.
procedimento luta_dragao
   Var
      vida_dragao, x, turno_perdido, y : inteiro
      escudo_ativo, bonus_ataque : inteiro
      z : caractere
   inicio
      vida_dragao <- 150
      turno_perdido <- 0
      escudo_ativo <- 0
      bonus_ataque <- 0

      // inicializar atributos se ainda nao foram
      se hpF = 0 entao
         hpF <- 100
      fimse
      se manaF = 0 entao
         manaF <- 100
      fimse
      se hpD = 0 entao
         hpD <- 180
      fimse
      se manaD = 0 entao
         manaD <- 60
      fimse
      se hpT = 0 entao
         hpT <- 120
      fimse
      se manaT = 0 entao
         manaT <- 80
      fimse
      se hpS = 0 entao
         hpS <- 130
      fimse
      se manaS = 0 entao
         manaS <- 110
      fimse

      enquanto vida_dragao > 0 faca

         //-------------------------------------
         // FADA vs DRAGAO (boss)
         //-------------------------------------
         se personagem = 10 entao
            escreval("|============================|")
            escreval("|  FADA  HP:", hpF, "  MANA:", manaF, "  |")
            escreval("|============================|")
            escreval("|  DRAGAO BOSS  HP:", vida_dragao, "       |")
            escreval("|============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            // Se o inimigo estava sob efeito de sono/atordoamento,
            // ele perde este turno e o flag e resetado.
            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("DRAGAO ESTÁ DORMINDO - TURNO PERDIDO!")
            senao
               se x >= 11 entao
                  hpF <- hpF - 30
                  escreval("DRAGAO ACERTOU! -30 HP")
               senao
                  escreval("DRAGAO ERROU O ATAQUE!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - FEITICO BASICO  (15 dano, sem mana)")
            escreval("  2 - CANCAO DE NINAR (dorme dragao, 30 mana)")
            escreval("  3 - BENCAO DIVINA   (cura +30 HP, 20 mana)")
            escreval("  4 - CANHAO FLOWER   (30 dano, 10 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  escreval("FADA usou FEITIÇO BÁSICO - tirou ", y, " no D20!")
                  se y >= 11 entao
                     vida_dragao <- vida_dragao - 15
                     escreval("ACERTOU! -15 HP no Dragao")
                  senao
                     escreval("ERROU o ataque!")
                  fimse
               caso 2
                  se manaF < 30 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 30)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaF <- manaF - 30
                     escreval("FADA usou CANÇÃO DE NINAR - tirou ", y, " no D20!")
                     se y >= 11 entao
                        turno_perdido <- 1
                        escreval("ACERTOU! Dragão vai dormir no próximo turno!")
                     senao
                        escreval("ERROU! Dragão resistiu a canção.")
                     fimse
                  fimse
               caso 3
                  se manaF < 20 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 20)")
                  senao
                     se hpF >= 100 entao
                        escreval("SUA VIDA JÁ ESTÁ NO MÁXIMO!")
                     senao
                        aleatorio 1,20
                        leia(y)
                        aleatorio off
                        manaF <- manaF - 20
                        escreval("FADA usou BENÇÃO DIVINA - tirou ", y, " no D20!")
                        se y >= 11 entao
                           hpF <- hpF + 30
                           escreval("BENÇÃO! +30 HP recuperado!")
                        senao
                           escreval("ERROU! Benção falhou.")
                        fimse
                     fimse
                  fimse
               caso 4
                  se manaF < 10 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 10)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaF <- manaF - 10
                     escreval("FADA usou CANHÃO FLOWER - tirou ", y, " no D20!")
                     se y >= 11 entao
                        vida_dragao <- vida_dragao - 30
                        escreval("ACERTOU! Canhão Flower! -30 HP no Dragão")
                     senao
                        escreval("ERROU! Dragão desviou.")
                     fimse
                  fimse
            fimescolha

            // Se o jogador morreu (HP <= 0), forca o fim do loop
            // zerando a vida do boss (condicao do enquanto).
            se hpF <= 0 entao
               vida_dragao <- 0
            fimse
         fimse // fim fada

         //-------------------------------------
         // DRAGAO (jogavel) vs DRAGAO INIMIGO (boss)
         //-------------------------------------
         se personagem = 20 entao
            escreval("|==============================|")
            escreval("|  DRAGÃO  HP:", hpD, "  MANA:", manaD, "  |")
            escreval("|==============================|")
            escreval("|  DRAGÃO INIMIGO  HP:", vida_dragao, "     |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("DRAGÃO INIMIGO ESTÁ ATORDOADO - TURNO PERDIDO!")
            senao
               se x >= 11 entao
                  // Escamas Ancestrais ativas: absorve o proximo dano.
                  se escudo_ativo = 1 entao
                     escudo_ativo <- 0
                     escreval("DRAGÃO ACERTOU mas ESCAMAS ANCESTRAIS absorveram! (-60 dano bloqueado)")
                  senao
                     hpD <- hpD - 35
                     escreval("DRAGÃO INIMIGO ACERTOU! -35 HP")
                  fimse
               senao
                  escreval("DRAGÃO INIMIGO ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - MORDIDA          (25 dano, sem mana)")
            escreval("  2 - BAFO DE FOGO     (40 dano, 15 mana)")
            escreval("  3 - ESCAMAS ANCESTRAIS (-60 dano recebido, 25 mana)")
            escreval("  4 - FURIA DRAGONICA  (60 dano, 40 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  escreval("DRAGÃO usou MORDIDA - tirou ", y, " no D20!")
                  se y >= 11 entao
                     vida_dragao <- vida_dragao - 25
                     escreval("MORDIDA! -25 HP no inimigo")
                  senao
                     escreval("ERROU a mordida!")
                  fimse
               caso 2
                  se manaD < 15 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 15)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaD <- manaD - 15
                     escreval("DRAGAO usou BAFO DE FOGO - tirou ", y, " no D20!")
                     se y >= 11 entao
                        vida_dragao <- vida_dragao - 40
                        escreval("BAFO DE FOGO! -40 HP no inimigo")
                     senao
                        escreval("ERROU! Fogo não acertou.")
                     fimse
                  fimse
               caso 3
                  se manaD < 25 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 25)")
                  senao
                     manaD <- manaD - 25
                     escudo_ativo <- 1
                     escreval("ESCAMAS ANCESTRAIS ATIVADAS! Proximo ataque recebe -60 dano!")
                  fimse
               caso 4
                  se manaD < 40 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 40)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaD <- manaD - 40
                     escreval("DRAGÃO usou FÚRIA DRAGÔNICA - tirou ", y, " no D20!")
                     se y >= 11 entao
                        vida_dragao <- vida_dragao - 60
                        escreval("FÚRIA DRAGÔNICA! -60 HP no inimigo!")
                     senao
                        escreval("ERROU! Fúria desperdiçada.")
                     fimse
                  fimse
            fimescolha

            se hpD <= 0 entao
               vida_dragao <- 0
            fimse
         fimse // fim dragao personagem

         //-------------------------------------
         // TREVAS vs DRAGAO (boss)
         //-------------------------------------
         se personagem = 30 entao
            escreval("|==============================|")
            escreval("|  TREVAS  HP:", hpT, "  MANA:", manaT, "  |")
            escreval("|==============================|")
            escreval("|  DRAGAO BOSS  HP:", vida_dragao, "       |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("DRAGÃO COM ATAQUE REDUZIDO este turno! (-30%)")
               se x >= 11 entao
                  hpT <- hpT - 14
                  escreval("DRAGÃO ACERTOU! -14 HP (reduzido pela Marca Sombria)")
               senao
                  escreval("DRAGÃO ERROU!")
               fimse
            senao
               se x >= 11 entao
                  hpT <- hpT - 20
                  escreval("DRAGÃO ACERTOU! -20 HP")
               senao
                  escreval("DRAGÃO ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - ATAQUE BASICO    (20 dano, sem mana)")
            escreval("  2 - SOMBRA CORRUPTA  (45 dano, 25 mana)")
            escreval("  3 - ROUBO DE VIDA    (18 dano +9 HP, 20 mana)")
            escreval("  4 - MARCA SOMBRIA    (-30% ataque dragao, 30 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  escreval("TREVAS usou ATAQUE BASICO - tirou ", y, " no D20!")
                  se y >= 11 entao
                     vida_dragao <- vida_dragao - 20
                     escreval("ACERTOU! -20 HP no Dragao")
                  senao
                     escreval("ERROU o ataque!")
                  fimse
               caso 2
                  se manaT < 25 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 25)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaT <- manaT - 25
                     escreval("TREVAS usou SOMBRA CORRUPTA - tirou ", y, " no D20!")
                     se y >= 11 entao
                        vida_dragao <- vida_dragao - 45
                        escreval("SOMBRA CORRUPTA! -45 HP no Dragao!")
                     senao
                        escreval("ERROU! Sombra dispersou.")
                     fimse
                  fimse
               caso 3
                  se manaT < 20 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 20)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaT <- manaT - 20
                     escreval("TREVAS usou ROUBO DE VIDA - tirou ", y, " no D20!")
                     se y >= 11 entao
                        vida_dragao <- vida_dragao - 18
                        hpT <- hpT + 9
                        escreval("ROUBO DE VIDA! -18 HP no Dragao, +9 HP em voce!")
                     senao
                        escreval("ERROU! Roubo de vida falhou.")
                     fimse
                  fimse
               caso 4
                  se manaT < 30 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 30)")
                  senao
                     manaT <- manaT - 30
                     turno_perdido <- 1
                     escreval("TREVAS usou MARCA SOMBRIA! Dragao tera -30% de ataque no proximo turno!")
                  fimse
            fimescolha

            se hpT <= 0 entao
               vida_dragao <- 0
            fimse
         fimse // fim trevas

         //-------------------------------------
         // SAGRADO vs DRAGAO (boss)
         //-------------------------------------
         se personagem = 40 entao
            escreval("|==============================|")
            escreval("|  SAGRADO HP:", hpS, "  MANA:", manaS, "  |")
            escreval("|==============================|")
            escreval("|  DRAGAO BOSS  HP:", vida_dragao, "       |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("DRAGÃO BLOQUEADO pelo Escudo Sagrado!")
            senao
               se x >= 11 entao
                  hpS <- hpS - 25
                  escreval("DRAGÃO ACERTOU! -25 HP")
               senao
                  escreval("DRAGÃO ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - LUZ PURIFICADORA  (20 dano, sem mana)")
            escreval("  2 - JULGAMENTO DIVINO  (35 dano, 25 mana)")
            escreval("  3 - BENCAO CELESTIAL   (+20 HP + bonus ataque, 30 mana)")
            escreval("  4 - ESCUDO SAGRADO     (bloqueia proximo dano, 35 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  escreval("SAGRADO usou LUZ PURIFICADORA - tirou ", y, " no D20!")
                  se y >= 11 entao
                     vida_dragao <- vida_dragao - 20
                     escreval("LUZ PURIFICADORA! -20 HP no Dragao")
                  senao
                     escreval("ERROU! Luz falhou.")
                  fimse
               caso 2
                  se manaS < 25 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 25)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaS <- manaS - 25
                     escreval("SAGRADO usou JULGAMENTO DIVINO - tirou ", y, " no D20!")
                     se y >= 11 entao
                        vida_dragao <- vida_dragao - 35
                        escreval("JULGAMENTO DIVINO! -35 HP no Dragao!")
                     senao
                        escreval("ERROU! Julgamento nao acertou.")
                     fimse
                  fimse
               caso 3
                  se manaS < 30 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 30)")
                  senao
                     // Bencao Celestial: cura HP e ativa bonus de ataque
                     // (bonus_ataque = 1 indica dano aumentado no proximo turno).
                     manaS <- manaS - 30
                     bonus_ataque <- 1
                     hpS <- hpS + 20
                     escreval("SAGRADO usou BENÇÃO CELESTIAL! Ataque aumentado e +20 HP curado!")
                  fimse
               caso 4
                  se manaS < 35 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 35)")
                  senao
                     manaS <- manaS - 35
                     turno_perdido <- 1
                     escreval("SAGRADO usou ESCUDO SAGRADO! Proximo ataque do Dragao sera bloqueado!")
                  fimse
            fimescolha

            se hpS <= 0 entao
               vida_dragao <- 0
            fimse
         fimse // fim sagrado

      fimenquanto // fim luta_dragao

      // Fim do loop de batalha.
      // Verifica quem venceu: se o HP do jogador chegou a 0,
      // ele perdeu - atributos resetam e personagem volta a 0
      // (sinaliza derrota para o loop externo reiniciar).
      // Se o boss chegou a 0 primeiro, o elemento e recrutado.
      // resultado final da luta
      escreval("Pressione ENTER para ver o resultado...")
      leia(z)

      se personagem = 10 entao
         se hpF <= 0 entao
            escreval("========================================")
            escreval("  FADA FOI DERROTADA... VOCE PERDEU!")
            escreval("  Voltando para escolha de classe...")
            escreval("========================================")
            hpF <- 100
            manaF <- 100
            personagem <- 0
         senao
            escreval("========================================")
            escreval("  VOCE VENCEU O DRAGÃO!")
            escreval("  O DRAGÃO SE JUNTOU A CAUSA!")
            escreval("========================================")
            torreDragao <- 1
            dragaoV <- 1
         fimse
      fimse

      se personagem = 20 entao
         se hpD <= 0 entao
            escreval("========================================")
            escreval("  DRAGÃO FOI DERROTADO... VOCE PERDEU!")
            escreval("  Voltando para escolha de classe...")
            escreval("========================================")
            hpD <- 180
            manaD <- 60
            personagem <- 0
         senao
            escreval("========================================")
            escreval("  VOCE VENCEU O DRAGÃO INIMIGO!")
            escreval("  ELE RECONHECE SUA FORCA E SE JUNTA!")
            escreval("========================================")
            torreDragao <- 1
            dragaoV <- 1
         fimse
      fimse

      se personagem = 30 entao
         se hpT <= 0 entao
            escreval("========================================")
            escreval("  TREVAS FOI DERROTADO... VOCE PERDEU!")
            escreval("  Voltando para escolha de classe...")
            escreval("========================================")
            hpT <- 120
            manaT <- 80
            personagem <- 0
         senao
            escreval("========================================")
            escreval("  VOCE VENCEU O DRAGÃO!")
            escreval("  O DRAGÃO SE JUNTOU A CAUSA!")
            escreval("========================================")
            torreDragao <- 1
            dragaoV <- 1
         fimse
      fimse

      se personagem = 40 entao
         se hpS <= 0 entao
            escreval("========================================")
            escreval("  SAGRADO FOI DERROTADO... VOCE PERDEU!")
            escreval("  Voltando para escolha de classe...")
            escreval("========================================")
            hpS <- 130
            manaS <- 110
            personagem <- 0
         senao
            escreval("========================================")
            escreval("  VOCE VENCEU O DRAGAO!")
            escreval("  O DRAGÃO SE JUNTOU A CAUSA!")
            escreval("========================================")
            torreDragao <- 1
            dragaoV <- 1
         fimse
      fimse

      escreval("Pressione ENTER para continuar...")
      leia(z)
   fimprocedimento

procedimento historia_conversar_dragao
   Var
      dado : inteiro
      x : caractere
   Inicio
      limpatela()
      escreval("=== CONVERSA COM O DRAGÃO ===")
      escreval("Voce se aproxima do Dragão adormecido e chama sua atenção...")
      escreval("Ele abre um olho. Vasto. Antigo. Cansado.")
      escreval("")
      escreval("DRAGÃO: 'Outro que veio tirar o meu sossego... ou me libertar?'")
      escreval("")
      escreval("Voce tenta convencer o Dragão a seguir a causa...")
      escreval("Role o D20! Tire de 11 a 20 para convencer, menos que isso a batalha começa!")
      escreval("Pressione ENTER para rolar o dado...")
      leia(x)

      aleatorio 1,20
      leia(dado)
      aleatorio off
      escreval("Voce tirou: ", dado, " no D20!")

      se dado >= 11 entao
         escreval("Você encara o dragão por alguns instantes antes ")
         escreval("de falar, com a voz cansada, mas sincera.")
         escreval("Eu tô cansado disso tudo… cansado dessas torres,")
         escreval("dessa prisão sem fim")
         escreval("Nós merecemos mais do que existir aqui dentro. ")
         escreval("Merecemos uma vida com algum propósito… algo maior ")
         escreval("do que essas paredes e batalhas eternas.")
         escreval("DRAGÃO: 'Hmm... Há algo diferente em você.'")
         escreval("DRAGÃO: 'Tudo bem. Eu irei... mas não por você.'")
         escreval("DRAGÃO: 'Pelo que virá depois.'")
         escreval("")
         escreval("SUCESSO! Você convenceu o Dragão a se juntar à causa!")
         torreDragao <- 1
         dragaoV <- 1
      senao
         escreval("")
         escreval("DRAGAO: 'Palavras vazias! Prove seu valor com a força!'")
         escreval("FALHOU! O Dragao ficou furioso e parte para o ataque!")
         timer 2000
         timer 0
         luta_dragao()
      fimse

      escreval("Pressione ENTER para continuar...")
      leia(x)
   fimprocedimento

procedimento cenario_dragao
   Var
      escolha_acao : inteiro
   inicio
      se personagem = 20 entao
         limpatela()
         escreval("========================================")
         escreval("  VOCÊ É O DRAGÃO!")
         escreval("  Não é possível enfrentar a sua própria")
         escreval("  torre. Escolha outra torre.")
         escreval("========================================")
         timer 2500
         timer 0
         escolha_torre <- 0
      senao
         limpatela()
         escreval ("                                @@@@@@@@@@@@@@@                                                  @@@@ ")                                                                                                                                    @@@@@@@
   escreval ("                               @@@@@@@@@@@@@@@                                              @@@@@@@@  ")
   escreval ("                                      @@@@@                                               @@@@    @@  ")
   escreval ("            @@@                    @@@@@@@@                                              @@@@     @@  ")
   escreval ("          @@@@@                    @@@@@                                               @@@@       @@   ")
   escreval ("          @@@@@                 @@@@@@@                        @@@@@@@@              @@@@         @@   ")
   escreval ("          @@@@@                 @@@@@                              @@               @@@           @@   ")
   escreval ("          @@@@@@             @@@@@@@@@@@@@@@@@@@                @@@@@@@        @@@@@@             @@   ")
   escreval ("         @@@@@@@             @@@@@@@@@@@@@@@@@@@               @@@@@@@@       @@@@@             @@@@   ")
   escreval ("         @@@@@@@@@                                                         @@@@@               @@@@    ")
   escreval ("         @@@@@@@@@@                                                    @@@@@@@@              @@@@@@    ")
   escreval ("         @@@@@@@@@@                                           @@@@@@@@@@@@@                  @@@@     ")
   escreval ("         @@@@@@@ @@@@                                   @@@@@@@@@  @@@@                     @@        ")
   escreval ("          @@@@@@@@@@@@@                         @@@@@@@@@        @@@                      @@@@        ")
   escreval ("          @@@  @@@@ @@@@                      @@@@@@                                      @@@@       ")
   escreval ("          @@@@@@@@@ @@@@@@                 @@@@@@@@                                      @@@@        ")
   escreval ("          @@@@@  @@  @@@@@@               @@@@@                                        @@@@@@@       ")
   escreval ("            @@@  @@@@  @@@@@@           @@@@@@                                         @@@@@@@@@@@   ")
   escreval ("             @@@  @@@     @@@@          @@@                                          @@@        @@@@ ")
   escreval ("             @@@@@  @@@@    @@@@@@  @@@@@                                           @@@@             ")
   escreval ("               @@@   @@@@@@@@@@@@@@@@@@@                                         @@@@@@              ")
   escreval ("               @@@@@@@@@@@@@@@@@@@@@@@     @@@@@@@@      @@@@@@                @@@@@@                ")
   escreval ("               @@@@@@@@@    @@@@@@@        @@@@@@@@      @@@@@@             @@@@@@@                 ")
   escreval ("                 @@@@@@@                     @@@@@@@@@@@@@@@@               @@@@                    ")
   escreval ("                 @@@ @@@                                                    @@@                      ")
   escreval ("                 @@                                                        @@@@         @@@@@@@@@@   ")
   escreval ("                 @@@@                                                     @@@@@  @@@@@@@@@@@@@@@@@@   ")
   escreval ("                 @@@@                                @@@@@@@@@              @@@@@@@@@@@@@@@@@@@@@@    ")
   escreval ("                  @@@@@                       @@@@@@@@@@@@@@@@                @@@@      @@@@@@@@      ")
   escreval ("                  @@@@@@@@@@@@@@@@@@@@    @@@@@@@@@@@@@                              @@@@@@           ")
   escreval ("                     @@@           @@@@@@@@@@                                       @@@               ")
   escreval ("                     @@@@@@                                                      @@@@                 ")
   escreval ("                        @@@@@                                                  @@@@                  ")
   escreval ("                        @@@@@@@@       @@@@@@@@@@@@@@@@@@                   @@@@@@                   ")
   escreval ("                            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@             @@@@@@@                     ")
   escreval ("                             @@@@@@@@@@@@             @@@@@@@@@@@@@@@@@@@@@@@@@                      ")
   escreval ("                                                              @@@@@@@@@@@@                           ")
   escreval ("                                                                                                     ")
         escreval("-----------------------------------------------------------------------------------------------------")
         escreval("VOCÊ ADENTRA O ANDAR MISTERIOSO E SE DEPARA COM UM ENORME DRAGÃO DORMINDO.")
         escreval("O QUE VOCE DECIDE FAZER?")
         escreval("1- CONVERSAR COM DRAGÃO || 2- ATACÁ-LO COVARDEMENTE || 3- TENTAR IR EMBORA")
         leia(escolha_acao)

         escolha escolha_acao
            caso 1
               historia_conversar_dragao()
            caso 2
               luta_dragao()
            caso 3
               ir_embora_dragao()
         fimescolha

         escolha_torre <- 0
      fimse
   fimprocedimento


//=========================================
// TORRE DAS TREVAS
// Mesma estrutura da Torre do Dragao:
//   ir_embora_trevas, luta_trevas,
//   historia_conversar_trevas, cenario_trevas.
// Boss: Trevas (HP 280). Se o jogador E Trevas,
// a torre e bloqueada.
//=========================================
procedimento ir_embora_trevas
   var
      y : inteiro
      x : caractere
   inicio
      limpatela()
      escreval("=== TENTANDO FUGIR ===")
      escreval("Você tenta sair do salão frio sem ser percebido...")
      escreval("Mas você sente que ela ja te analisou completamente.")
      escreval("Role um D20 para tentar fugir (precisa de 11+)!")
      escreval("Pressione ENTER para rolar...")
      leia(x)
      aleatorio 1,20
      leia(y)
      aleatorio off
      escreval("Voce tirou: ", y, " no D20!")
      se y >= 11 entao
         escreval("CONSEGUIU FUGIR!")
         escreval("Ela apenas observa voce sair, sem interferir.")
         escreval("(Torre ignorada - Trevas nao foi recrutada)")
         torreTrevas <- 0
      senao
         escreval("VOCE TROPEÇOU E CHAMOU ATENÇÃO!")
         escreval("A figura esquelética se levanta lentamente...")
         timer 1500
         timer 0
         historia_conversar_trevas()
      fimse
      escreval("Pressione ENTER para continuar...")
      leia(x)
   fimprocedimento

// luta_trevas: combate da torre das Trevas.
// Mesma logica de turno que luta_dragao.
// Boss tem HP 280 e causa dano de sombra.
procedimento luta_trevas
   Var
      vida_trevas, x, turno_perdido, y : inteiro
      escudo_ativo, bonus_ataque : inteiro
      z : caractere
   inicio
      // Boss Trevas tem atributos diferentes do jogavel
      vida_trevas <- 140
      turno_perdido <- 0
      escudo_ativo <- 0
      bonus_ataque <- 0

      se hpF = 0 entao
         hpF <- 100
      fimse
      se manaF = 0 entao
         manaF <- 100
      fimse
      se hpD = 0 entao
         hpD <- 180
      fimse
      se manaD = 0 entao
         manaD <- 60
      fimse
      se hpT = 0 entao
         hpT <- 120
      fimse
      se manaT = 0 entao
         manaT <- 80
      fimse
      se hpS = 0 entao
         hpS <- 130
      fimse
      se manaS = 0 entao
         manaS <- 110
      fimse

      enquanto vida_trevas > 0 faca

         //-------------------------------------
         // FADA vs TREVAS (boss)
         //-------------------------------------
         se personagem = 10 entao
            escreval("|============================|")
            escreval("|  FADA  HP:", hpF, "  MANA:", manaF, "  |")
            escreval("|============================|")
            escreval("|  TREVAS BOSS  HP:", vida_trevas, "     |")
            escreval("|============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("TREVAS DORMINDO POR CANÇÃO - TURNO PERDIDO!")
            senao
               se x >= 11 entao
                  hpF <- hpF - 25
                  escreval("TREVAS ACERTOU! -25 HP (Toque da Sombra)")
               senao
                  escreval("TREVAS ERROU O ATAQUE!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - FEITICO BASICO  (15 dano, sem mana)")
            escreval("  2 - CANCAO DE NINAR (dorme trevas, 30 mana)")
            escreval("  3 - BENCAO DIVINA   (cura +30 HP, 20 mana)")
            escreval("  4 - CANHAO FLOWER   (30 dano, 10 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  escreval("FADA usou FEITICO BASICO - tirou ", y, " no D20!")
                  se y >= 11 entao
                     vida_trevas <- vida_trevas - 15
                     escreval("ACERTOU! -15 HP em Trevas")
                  senao
                     escreval("ERROU o ataque!")
                  fimse
               caso 2
                  se manaF < 30 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 30)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaF <- manaF - 30
                     escreval("FADA usou CANCAO DE NINAR - tirou ", y, " no D20!")
                     se y >= 11 entao
                        turno_perdido <- 1
                        escreval("ACERTOU! Trevas vai dormir no proximo turno!")
                     senao
                        escreval("ERROU! Trevas resistiu.")
                     fimse
                  fimse
               caso 3
                  se manaF < 20 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 20)")
                  senao
                     se hpF >= 100 entao
                        escreval("SUA VIDA JA ESTA NO MAXIMO!")
                     senao
                        aleatorio 1,20
                        leia(y)
                        aleatorio off
                        manaF <- manaF - 20
                        se y >= 11 entao
                           hpF <- hpF + 30
                           escreval("BENCAO! +30 HP recuperado!")
                        senao
                           escreval("ERROU! Bencao falhou.")
                        fimse
                     fimse
                  fimse
               caso 4
                  se manaF < 10 entao
                     escreval("SEM MANA SUFICIENTE! (precisa 10)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaF <- manaF - 10
                     se y >= 11 entao
                        vida_trevas <- vida_trevas - 30
                        escreval("CANHAO FLOWER! -30 HP em Trevas")
                     senao
                        escreval("ERROU! Trevas desviou.")
                     fimse
                  fimse
            fimescolha

            se hpF <= 0 entao
               vida_trevas <- 0
            fimse
         fimse // fim fada vs trevas

         //-------------------------------------
         // DRAGAO vs TREVAS (boss)
         //-------------------------------------
         
escreval ("                                                                      @@@@@@@@@@@@@@            ")
escreval ("                                                                   @@@@            @@@@         ")
escreval ("                                                                 @@@        @@@@      @@@       ")
escreval ("                                                                @@         @  @ @       @@      ")
escreval ("                                                               @@  @@@@     @@@@   @@@@  @@     ")
escreval ("                                                               @@ @    @@@@      @@@   @ @@     ")
escreval ("                                                               @@ @       @     @      @ @@     ")
escreval ("           @@     @@                                           @@  @ @              @ @  @@     ")
escreval ("           @ @@   @ @@                                         @@  @ @@@@@      @@@@@ @  @@     ")
escreval ("     @     @@ @@   @ @@                                        @@  @ @@  @      @  @@ @  @@     ")
escreval ("    @ @     @@ @@@@@ @@                                        @@ @@ @@@@@      @@@@@ @@ @@     ")
escreval (" @@@@@@      @        @                  @                     @@@@         @@         @@@@     ")
escreval ("@@@@  @      @         @                @ @                    @@@@        @@@@        @@ @     ")
escreval ("@@ @  @     @           @              @@@@@                   @ @@     @       @      @@ @     ")
escreval (" @  @ @@    @           @            @@@ @@@@@                 @ @@    @         @     @@ @     ")
escreval ("  @  @ @@    @         @           @@@   @@  @@@               @@  @@@@           @@@@@  @@     ")
escreval ("   @  @ @@    @       @          @@@    @@@@   @@@@             @@ @@@@ I I I I I @@@@  @@      ")
escreval ("   @  @  @@   @       @        @@@     @@  @      @@@@@          @@ @@@@@@@@@@@@@@@@@  @@       ")
escreval ("  @   @   @@@ @       @     @@@@      @@   @@         @@@@@       @@ @@@@@@@@@@@@@@@  @@        ")
escreval (" @   @      @@@       @  @@@@       @@@     @             @@@      @@@ I I I I I I  @@@         ")
escreval ("@   @        @       @@@@@         @@       @               @@       @@@           @@@          ")
escreval ("    @       @                     @@        @@               @@       @@@        @@@            ")
escreval ("    @@@@@@@@@                    @@          @                 @@  xxxxx@@@@@@@@@@xxxx          ")
escreval ("    @ @   @          @@@@@       @           @@                 @ xxxxxxxxxxxxxxxxxxxxx         ")
escreval ("    @    @              @@@@    @@            @                  @ xxxxxxxxxxxxxxxxxxx          ")
escreval ("    @   @               @  @@@@ @  @@@@@@     @@                  @   xxxxxxxxxxxxx             ")
escreval ("    @  @                @@   @@ @@@@     @@@   @   @@@@@@@        @                             ")
escreval ("    @@@                  @@@   @@@         @@  @  @@     @@@      @                             ")
escreval ("                          @@@   @           @@ @@@          @@@   @                             ")
escreval ("                             @@              @@@@             @@  @                             ")
escreval ("                              @@              @@@              @ @@                             ")
escreval ("@                     @       @@              @@               @@@                              ")
escreval (" @                   @        @@                                @@                              ")
escreval ("  @@@@@@@@@@@@@@@@@@         @@                                 @@                              ")
escreval ("     @@    @        @@      @@                                                                  ")
escreval ("      @    @         @@    @@                                                                   ")
escreval ("      @   @          @@    @@                                                                   ")
escreval ("     @    @          @    @@                                                                    ")
escreval ("    @     @@@       @@    @@@@                                                                  ")
escreval ("   @       @ @      @@        @xxx                                                              ")
escreval ("xxxxxxxxxxxxxxxxxxxxxxxxxxxx@@xxxxxxxx                                                          ")
escreval ("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                                                       ")
escreval ("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                                                      ")
escreval ("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                                                       ")
escreval ("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                                                           ")
escreval (" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                                                               ")
         se personagem = 20 entao
            escreval("|==============================|")
            escreval("|  DRAGAO  HP:", hpD, "  MANA:", manaD, "  |")
            escreval("|==============================|")
            escreval("|  TREVAS BOSS  HP:", vida_trevas, "     |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("TREVAS ATORDOADO! TURNO PERDIDO!")
            senao
               se x >= 11 entao
                  se escudo_ativo = 1 entao
                     escudo_ativo <- 0
                     escreval("TREVAS ACERTOU mas ESCAMAS ANCESTRAIS absorveram!")
                  senao
                     hpD <- hpD - 30
                     escreval("TREVAS ACERTOU! -30 HP (Toque da Sombra)")
                  fimse
               senao
                  escreval("TREVAS ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - MORDIDA          (25 dano, sem mana)")
            escreval("  2 - BAFO DE FOGO     (40 dano, 15 mana)")
            escreval("  3 - ESCAMAS ANCESTRAIS (-60 dano recebido, 25 mana)")
            escreval("  4 - FURIA DRAGONICA  (60 dano, 40 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  escreval("DRAGAO usou MORDIDA - tirou ", y, " no D20!")
                  se y >= 11 entao
                     vida_trevas <- vida_trevas - 25
                     escreval("MORDIDA! -25 HP em Trevas")
                  senao
                     escreval("ERROU!")
                  fimse
               caso 2
                  se manaD < 15 entao
                     escreval("SEM MANA! (precisa 15)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaD <- manaD - 15
                     se y >= 11 entao
                        vida_trevas <- vida_trevas - 40
                        escreval("BAFO DE FOGO! -40 HP em Trevas!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 3
                  se manaD < 25 entao
                     escreval("SEM MANA! (precisa 25)")
                  senao
                     manaD <- manaD - 25
                     escudo_ativo <- 1
                     escreval("ESCAMAS ATIVADAS!")
                  fimse
               caso 4
                  se manaD < 40 entao
                     escreval("SEM MANA! (precisa 40)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaD <- manaD - 40
                     se y >= 11 entao
                        vida_trevas <- vida_trevas - 60
                        escreval("FURIA DRAGONICA! -60 HP em Trevas!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
            fimescolha

            se hpD <= 0 entao
               vida_trevas <- 0
            fimse
         fimse // fim dragao vs trevas

         //-------------------------------------
         // TREVAS (jogavel) vs TREVAS INIMIGA (boss)
         //-------------------------------------
         se personagem = 30 entao
            escreval("|==============================|")
            escreval("|  TREVAS  HP:", hpT, "  MANA:", manaT, "  |")
            escreval("|==============================|")
            escreval("|  TREVAS INIMIGA  HP:", vida_trevas, "   |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("TREVAS INIMIGA COM ATAQUE REDUZIDO (-30%)")
               se x >= 11 entao
                  hpT <- hpT - 22
                  escreval("TREVAS INIMIGA ACERTOU! -22 HP (reduzido)")
               senao
                  escreval("TREVAS INIMIGA ERROU!")
               fimse
            senao
               se x >= 11 entao
                  hpT <- hpT - 32
                  escreval("TREVAS INIMIGA ACERTOU! -32 HP (Sombra Corrupta Boss)")
               senao
                  escreval("TREVAS INIMIGA ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - ATAQUE BASICO    (20 dano, sem mana)")
            escreval("  2 - SOMBRA CORRUPTA  (45 dano, 25 mana)")
            escreval("  3 - ROUBO DE VIDA    (18 dano +9 HP, 20 mana)")
            escreval("  4 - MARCA SOMBRIA    (-30% ataque, 30 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  escreval("TREVAS usou ATAQUE BASICO - tirou ", y, " no D20!")
                  se y >= 11 entao
                     vida_trevas <- vida_trevas - 20
                     escreval("ACERTOU! -20 HP")
                  senao
                     escreval("ERROU!")
                  fimse
               caso 2
                  se manaT < 25 entao
                     escreval("SEM MANA! (precisa 25)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaT <- manaT - 25
                     se y >= 11 entao
                        vida_trevas <- vida_trevas - 45
                        escreval("SOMBRA CORRUPTA! -45 HP!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 3
                  se manaT < 20 entao
                     escreval("SEM MANA! (precisa 20)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaT <- manaT - 20
                     se y >= 11 entao
                        vida_trevas <- vida_trevas - 18
                        hpT <- hpT + 9
                        escreval("ROUBO DE VIDA! -18 HP no inimigo, +9 HP em voce!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 4
                  se manaT < 30 entao
                     escreval("SEM MANA! (precisa 30)")
                  senao
                     manaT <- manaT - 30
                     turno_perdido <- 1
                     escreval("MARCA SOMBRIA aplicada! Trevas inimiga tera -30% ataque!")
                  fimse
            fimescolha

            se hpT <= 0 entao
               vida_trevas <- 0
            fimse
         fimse // fim trevas vs trevas

         //-------------------------------------
         // SAGRADO vs TREVAS (boss)
         //-------------------------------------
         se personagem = 40 entao
            escreval("|==============================|")
            escreval("|  SAGRADO HP:", hpS, "  MANA:", manaS, "  |")
            escreval("|==============================|")
            escreval("|  TREVAS BOSS  HP:", vida_trevas, "     |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("TREVAS BLOQUEADA pelo Escudo Sagrado!")
            senao
               se x >= 11 entao
                  hpS <- hpS - 28
                  escreval("TREVAS ACERTOU! -28 HP")
               senao
                  escreval("TREVAS ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - LUZ PURIFICADORA  (20 dano, sem mana)")
            escreval("  2 - JULGAMENTO DIVINO  (35 dano, 25 mana)")
            escreval("  3 - BENCAO CELESTIAL   (+20 HP + bonus, 30 mana)")
            escreval("  4 - ESCUDO SAGRADO     (bloqueia dano, 35 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  se y >= 11 entao
                     vida_trevas <- vida_trevas - 20
                     escreval("LUZ PURIFICADORA! -20 HP em Trevas")
                  senao
                     escreval("ERROU!")
                  fimse
               caso 2
                  se manaS < 25 entao
                     escreval("SEM MANA! (precisa 25)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaS <- manaS - 25
                     se y >= 11 entao
                        vida_trevas <- vida_trevas - 35
                        escreval("JULGAMENTO DIVINO! -35 HP em Trevas!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 3
                  se manaS < 30 entao
                     escreval("SEM MANA! (precisa 30)")
                  senao
                     manaS <- manaS - 30
                     hpS <- hpS + 20
                     escreval("BENCAO CELESTIAL! +20 HP e bonus de ataque!")
                  fimse
               caso 4
                  se manaS < 35 entao
                     escreval("SEM MANA! (precisa 35)")
                  senao
                     manaS <- manaS - 35
                     turno_perdido <- 1
                     escreval("ESCUDO SAGRADO! Proximo ataque sera bloqueado!")
                  fimse
            fimescolha

            se hpS <= 0 entao
               vida_trevas <- 0
            fimse
         fimse // fim sagrado vs trevas

      fimenquanto // fim luta_trevas

      escreval("Pressione ENTER para o resultado...")
      leia(z)

      se personagem = 10 entao
         se hpF <= 0 entao
            escreval("  FADA FOI DERROTADA! Voltando para escolha...")
            hpF <- 100
            manaF <- 100
            personagem <- 0
         senao
            escreval("  VOCE VENCEU TREVAS! ELA SE JUNTA A CAUSA!")
            torreTrevas <- 1
            trevasV <- 1
         fimse
      fimse
      se personagem = 20 entao
         se hpD <= 0 entao
            escreval("  DRAGÃO FOI DERROTADO! Voltando para escolha...")
            hpD <- 180
            manaD <- 60
            personagem <- 0
         senao
            escreval("  VOCE VENCEU TREVAS! ELA SE JUNTA À CAUSA!")
            torreTrevas <- 1
            trevasV <- 1
         fimse
      fimse
      se personagem = 30 entao
         se hpT <= 0 entao
            escreval("  TREVAS FOI DERROTADA! Voltando para escolha...")
            hpT <- 120
            manaT <- 80
            personagem <- 0
         senao
            escreval("  VOCÊ VENCEU TREVAS INIMIGA! ELA ACEITA SUA PROPOSTA!")
            torreTrevas <- 1
            trevasV <- 1
         fimse
      fimse
      se personagem = 40 entao
         se hpS <= 0 entao
            escreval("  SAGRADO FOI DERROTADO! Voltando para escolha...")
            hpS <- 130
            manaS <- 110
            personagem <- 0
         senao
            escreval("  VOCE VENCEU TREVAS! ELA SE JUNTA À CAUSA!")
            torreTrevas <- 1
            trevasV <- 1
         fimse
      fimse

      escreval("Pressione ENTER para continuar...")
      leia(z)
   fimprocedimento

procedimento historia_conversar_trevas
   Var
      dado : inteiro
      x : caractere
   Inicio
      limpatela()
      escreval("=== CONVERSA COM TREVAS ===")
      escreval("Um salão frio. Uma figura esqueletica sentada no centro.")
      escreval("Ela fala pouco, mas seus olhos vazios observam tudo.")
      escreval("")
      escreval("TREVAS: 'Você quer me usar... ou realmente tem um proposito?'")
      escreval("")
      escreval("Voce tenta demonstrar que seu proposito e real...")
      escreval("Role o D20! Tire de 11+ para convencer. Menos que isso: batalha!")
      escreval("Pressione ENTER para rolar...")
      leia(x)

      aleatorio 1,20
      leia(dado)
      aleatorio off
      escreval("Voce tirou: ", dado, " no D20!")

      se dado >= 11 entao
         escreval("")
         escreval("TREVAS: '...Proposito real. Raro.'")
         escreval("TREVAS: 'Tudo bem. Mas lembre-se... eu ja te analisei.'")
         escreval("")
         escreval("SUCESSO! Trevas se juntou a causa!")
         torreTrevas <- 1
         trevasV <- 1
      senao
         escreval("")
         escreval("TREVAS: 'Sua intencao e vazia. Prove com acao.'")
         escreval("FALHOU! Trevas te envolve em ilusoes. Prepare-se para lutar!")
         timer 1500
         timer 0
         luta_trevas()
      fimse

      escreval("Pressione ENTER para continuar...")
      leia(x)
   fimprocedimento

procedimento cenario_trevas
   Var
      escolha_acao : inteiro
   inicio
      se personagem = 30 entao
         limpatela()
         escreval("========================================")
         escreval("  VOCE É TREVAS!")
         escreval("  Não é possível enfrentar a sua própria")
         escreval("  torre. Escolha outra torre.")
         escreval("========================================")
         timer 2500
         timer 0
         escolha_torre <- 0
      senao
         limpatela()
escreval(" ----------------------------------------------------------------------------------------------------------------------------  ")
escreval(" ----------------------------------------------------------------------------------------------------------------------------  ")
escreval(" ----------------------------------------------------------------------------------------------------------------------------  ")
escreval(" ----------------------------------------------------------------------------------------------------------------------------  ")
escreval(" ----------------------------------------------------------------------------------------------------------------------------  ")
escreval(" --------------------------------------------------------------------------------*#####=-------------------------------------  ")
escreval(" --------------------------------------------------------------------------------######=-------------------------------------  ")
escreval(" ------------------------------=##+#*=---------------------------------------=@@@######%@@*----------------------------------  ")
escreval(" --------------------=%%*@%%-----=+------------------------------------------=%%%######%%%*----------------------------------  ")
escreval(" -----------=-==-------=#=------------------------------------------------=%%%%%%++++++#%%%%%*-------------------------------  ")
escreval(" ---------=+=%++=------------++-=*=------------------------------------=+++######++++++*#####*+++----------------------------  ")
escreval(" ------------------=%*#%#+-=%=+@%-##-----------------------------------+%%%++++++++++++++++++*%%%----------------------------  ")
escreval(" ---------------------=-------=+------------------------------#########%%%#++++++++++++++++++*%%%#########+------------------  ")
escreval(" -------------------------------------------------------------%%%%%%%%%%%%%++++++++++++++++++*%%%%%%%%%%%%+------------------  ")
escreval(" ---------------------------------------------------=%%%%%%%%%%%%*******#########++++++##########******%%%%%%%%%%%%#---------  ")
escreval(" ---------------------------------------------------=###########%*******#########++++++*#########******###%%%%%%%%#*---------  ")
escreval(" ---------------------------------------------------=************################++++++*###############************+---------  ")
escreval(" ------------------------------------------------+**#############################++++++*############################**#------  ")
escreval(" ------------------------------------------------+###############################++++++*###############################------  ")
escreval(" ------------------------------------------------+#####################################################################------  ")
escreval(" ------------------------------------------=-----*#########################################################%%%%%%%%%%%%------  ")
escreval(" -----------------------------------------+*+=----------------%%%%%%%%%*------------------------=%%%%%%%%%+------------------  ")
escreval(" ----------------------------------------=****+---------------#%%%%%%##+------------------------=%%%%%%#%#+------------------  ")
escreval(" ----------------------------------------+##***=--------------*##******=------------------------=###******=------------------  ")
escreval(" ---------------------------------------*%%##*++=-------------*##******=------------------------=###******=------------------  ")
escreval(" -------------------------=++++++===----*%%%##**+=------------*##******=------------------------=###******=------------------  ")
escreval(" -----------------------=*@@@@@@@@@+---=#%@@@%##**+-----------*##******=------------------------=###******=------------------  ")
escreval(" ---------------------=+%*-------*%+---*%%@@@@@##**=----------*##******=------------------------=###******=------------------  ")
escreval(" ---------------------------------+*--*%%@@@@@@@@%#*+---------*##******=------------------------=###******=------------------  ")
escreval(" ---------------------------------+*--*%%@@@@@@@@@@#+---------*##******=------------------------=###******=------------------  ")
escreval(" ---------------------------------+*--=#@@@@@@@@@@@%+---------*##******=------------------------=###******=------------------  ")
escreval(" --------------------------------=*#%###%@@@@@@@@@@%+---------*##******=------------------------=###******=------------------ ")
escreval(" --------------------------------=*@@@%%@@@@@@@@@@@#*=--------*##******=------------------------=###******=------------------ ")
escreval(" ---------------------------------+@@@@@@@@@@@@@@%%##=--------*##******=------------------------=###******=------------------ ")
escreval(" ---------------------------------+@@@@@@@@@@@@@@%%##=--------*##******=------------------------=###******=------------------ ")
escreval(" ---------------------------------+*==#@@@@@@@@@@%%##=--------*##******=------------------------=###******=#%%#*------------- ")
escreval(" ---------------------------------+*--*@@@@@@@@@%%%##=--------*##******=------------------------=###******=#%##*-----====---- ")
escreval(" ---------------------------------+*--*@@@@@@@@%%%###=--------*##******=------------------------=###***%%%@%%#######-#%##---- ")
escreval(" ---------------------------------+*--*@@@@@@@@%%%##*=--------*##******=------------------------=###***%%###########-#%##---- ")
escreval(" -------------=*#***+=------------+*--*@@@@@@@@%%%##%+--------*##******=------------------------=###***%%#*#####*###%%%#####+ ")
escreval(" -----------=#%###*****+--+***+---+*--*@%%@@@@@@@@@@@+--------*##******=------------------------=###******=#%%%*-*@%########+ ")
escreval(" ------=#*--=#%%####***+*%###***+=+*--*@%@@@@@@%##%*+=--------*##******=------------------------=###******=#%##+-----#%%%---- ")
escreval(" ----=*#%#++=#%%####***+*%####**+=+*--*@@@@@@@@%##%+----------*##******=------------------------=###******=#%##+-----#%##---- ")
escreval(" ----=**##++=#%%####***+*%####**+=+*--*@@@@@@@@@@%@@*------#########******+------------------=#########****%%##+-----#%##---- ")
escreval(" ------=%#--=#%%####***+*%####**+=+*-=#@@@@@@@@@@@@@@+-----#########******+------------------=#########****%%##+-----#%##---- ")
escreval(" --+###%@@###%%%%%##***+*%%%##***=+*=#%%@@@@@@@@@@@@@%*=###################**+------------+############****%%###+----#%##---- ")
escreval(" --+@@@@@@@@@%%%%%%#***+#%%%%%***=+**@@@@@@@@@@@@@@@@@@####################**+------------+#############***%%###+----#%##---- ")
escreval(" %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ")
escreval(" %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ")
escreval(" %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ")
escreval(" %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ")
escreval(" %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ")
escreval("")
         escreval("Um frio cortante preenche o ar. No centro do salão,")
         escreval("uma figura esqueletica sentada, impassível.")
         escreval("Seus olhos vazios pousam em você.")
         escreval("")
         escreval("TREVAS: 'Voce chegou... interessante.'")
         escreval("")
         escreval("O QUE VOCÊ DECIDE FAZER?")
         escreval("1- CONVERSAR COM TREVAS || 2- ATACAR || 3- TENTAR IR EMBORA")
         leia(escolha_acao)

         escolha escolha_acao
            caso 1
               historia_conversar_trevas()
            caso 2
               luta_trevas()
            caso 3
               ir_embora_trevas()
         fimescolha

         escolha_torre <- 0
      fimse
   fimprocedimento


//=========================================
// TORRE DA FADA
// Mesma estrutura das outras torres.
// Boss: Fada (HP 250). Se o jogador E Fada,
// a torre e bloqueada.
// Nota: fadaV usa valor 2 (em vez de 1) para
// distinguir fada jogavel de fada recrutada.
//=========================================
procedimento ir_embora_fada
   var
      y : inteiro
      x : caractere
   inicio
      limpatela()
      escreval("=== TENTANDO FUGIR ===")
      escreval("Voce tenta sair da floresta viva...")
      escreval("A Fada apenas observa voce sair, sem interferir.")
      escreval("Role um D20 para tentar fugir (precisa de 11+)!")
      escreval("Pressione ENTER para rolar...")
      leia(x)
      aleatorio 1,20
      leia(y)
      aleatorio off
      escreval("Voce tirou: ", y, " no D20!")
      se y >= 11 entao
         escreval("CONSEGUIU FUGIR!")
         escreval("As arvores se abrem e voce encontra a saida.")
         escreval("(Torre ignorada - Fada nao foi recrutada)")
         torreFada <- 0
      senao
         escreval("A floresta se fecha ao redor! Sem saida...")
         escreval("A Fada aparece na sua frente, olhando curiosa.")
         timer 1500
         timer 0
         historia_conversar_fada()
      fimse
      escreval("Pressione ENTER para continuar...")
      leia(x)
   fimprocedimento

// luta_fada: combate da torre da Fada.
// Boss tem HP 250.
procedimento luta_fada
   Var
      vida_fada, x, turno_perdido, y : inteiro
      escudo_ativo, bonus_ataque : inteiro
      z : caractere
   inicio
      // Boss Fada tem atributos diferentes do jogavel
      vida_fada <- 125
      turno_perdido <- 0
      escudo_ativo <- 0
      bonus_ataque <- 0

      se hpF = 0 entao
         hpF <- 100
      fimse
      se manaF = 0 entao
         manaF <- 100
      fimse
      se hpD = 0 entao
         hpD <- 180
      fimse
      se manaD = 0 entao
         manaD <- 60
      fimse
      se hpT = 0 entao
         hpT <- 120
      fimse
      se manaT = 0 entao
         manaT <- 80
      fimse
      se hpS = 0 entao
         hpS <- 130
      fimse
      se manaS = 0 entao
         manaS <- 110
      fimse

      enquanto vida_fada > 0 faca

         //-------------------------------------
         // FADA (jogavel) vs FADA INIMIGA (boss)
         //-------------------------------------
         se personagem = 10 entao
            escreval("|============================|")
            escreval("|  FADA  HP:", hpF, "  MANA:", manaF, "  |")
            escreval("|============================|")
            escreval("|  FADA INIMIGA  HP:", vida_fada, "    |")
            escreval("|============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("FADA INIMIGA DORMINDO - TURNO PERDIDO!")
            senao
               se x >= 11 entao
                  hpF <- hpF - 28
                  escreval("FADA INIMIGA ACERTOU! -28 HP (Canhao Flower Boss)")
               senao
                  escreval("FADA INIMIGA ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - FEITICO BASICO  (15 dano, sem mana)")
            escreval("  2 - CANCAO DE NINAR (dorme fada, 30 mana)")
            escreval("  3 - BENCAO DIVINA   (cura +30 HP, 20 mana)")
            escreval("  4 - CANHAO FLOWER   (30 dano, 10 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  se y >= 11 entao
                     vida_fada <- vida_fada - 15
                     escreval("FEITICO BASICO! -15 HP")
                  senao
                     escreval("ERROU!")
                  fimse
               caso 2
                  se manaF < 30 entao
                     escreval("SEM MANA! (precisa 30)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaF <- manaF - 30
                     escreval("FADA usou CANCAO DE NINAR - tirou ", y, " no D20!")
                     se y >= 11 entao
                        turno_perdido <- 1
                        escreval("ACERTOU! Fada inimiga vai dormir!")
                     senao
                        escreval("ERROU! Ela resistiu.")
                     fimse
                  fimse
               caso 3
                  se manaF < 20 entao
                     escreval("SEM MANA! (precisa 20)")
                  senao
                     se hpF >= 100 entao
                        escreval("VIDA JA NO MAXIMO!")
                     senao
                        aleatorio 1,20
                        leia(y)
                        aleatorio off
                        manaF <- manaF - 20
                        se y >= 11 entao
                           hpF <- hpF + 30
                           escreval("BENCAO! +30 HP!")
                        senao
                           escreval("ERROU!")
                        fimse
                     fimse
                  fimse
               caso 4
                  se manaF < 10 entao
                     escreval("SEM MANA! (precisa 10)")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaF <- manaF - 10
                     se y >= 11 entao
                        vida_fada <- vida_fada - 30
                        escreval("CANHAO FLOWER! -30 HP!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
            fimescolha

            se hpF <= 0 entao
               vida_fada <- 0
            fimse
         fimse // fim fada vs fada

         //-------------------------------------
         // DRAGAO vs FADA (boss)
         //-------------------------------------
         se personagem = 20 entao
            escreval("|==============================|")
            escreval("|  DRAGAO  HP:", hpD, "  MANA:", manaD, "  |")
            escreval("|==============================|")
            escreval("|  FADA BOSS  HP:", vida_fada, "       |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("FADA ATORDOADA - TURNO PERDIDO!")
            senao
               se x >= 11 entao
                  se escudo_ativo = 1 entao
                     escudo_ativo <- 0
                     escreval("FADA ACERTOU mas ESCAMAS ANCESTRAIS absorveram!")
                  senao
                     hpD <- hpD - 26
                     escreval("FADA BOSS ACERTOU! -26 HP")
                  fimse
               senao
                  escreval("FADA ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - MORDIDA          (25 dano, sem mana)")
            escreval("  2 - BAFO DE FOGO     (40 dano, 15 mana)")
            escreval("  3 - ESCAMAS ANCESTRAIS (25 mana)")
            escreval("  4 - FURIA DRAGONICA  (60 dano, 40 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  se y >= 11 entao
                     vida_fada <- vida_fada - 25
                     escreval("MORDIDA! -25 HP na Fada")
                  senao
                     escreval("ERROU!")
                  fimse
               caso 2
                  se manaD < 15 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaD <- manaD - 15
                     se y >= 11 entao
                        vida_fada <- vida_fada - 40
                        escreval("BAFO DE FOGO! -40 HP na Fada!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 3
                  se manaD < 25 entao
                     escreval("SEM MANA!")
                  senao
                     manaD <- manaD - 25
                     escudo_ativo <- 1
                     escreval("ESCAMAS ATIVADAS!")
                  fimse
               caso 4
                  se manaD < 40 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaD <- manaD - 40
                     se y >= 11 entao
                        vida_fada <- vida_fada - 60
                        escreval("FURIA DRAGONICA! -60 HP na Fada!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
            fimescolha

            se hpD <= 0 entao
               vida_fada <- 0
            fimse
         fimse // fim dragao vs fada

         //-------------------------------------
         // TREVAS vs FADA (boss)
         //-------------------------------------
         se personagem = 30 entao
            escreval("|==============================|")
            escreval("|  TREVAS  HP:", hpT, "  MANA:", manaT, "  |")
            escreval("|==============================|")
            escreval("|  FADA BOSS  HP:", vida_fada, "       |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("FADA COM ATAQUE REDUZIDO (-30%)")
               se x >= 11 entao
                  hpT <- hpT - 17
                  escreval("FADA ACERTOU! -17 HP (reduzido)")
               senao
                  escreval("FADA ERROU!")
               fimse
            senao
               se x >= 11 entao
                  hpT <- hpT - 25
                  escreval("FADA BOSS ACERTOU! -25 HP")
               senao
                  escreval("FADA ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - ATAQUE BASICO    (20 dano, sem mana)")
            escreval("  2 - SOMBRA CORRUPTA  (45 dano, 25 mana)")
            escreval("  3 - ROUBO DE VIDA    (18 dano +9 HP, 20 mana)")
            escreval("  4 - MARCA SOMBRIA    (-30% ataque, 30 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  se y >= 11 entao
                     vida_fada <- vida_fada - 20
                     escreval("ATAQUE BASICO! -20 HP na Fada")
                  senao
                     escreval("ERROU!")
                  fimse
               caso 2
                  se manaT < 25 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaT <- manaT - 25
                     se y >= 11 entao
                        vida_fada <- vida_fada - 45
                        escreval("SOMBRA CORRUPTA! -45 HP na Fada!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 3
                  se manaT < 20 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaT <- manaT - 20
                     se y >= 11 entao
                        vida_fada <- vida_fada - 18
                        hpT <- hpT + 9
                        escreval("ROUBO DE VIDA! -18 HP + 9 HP de volta!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 4
                  se manaT < 30 entao
                     escreval("SEM MANA!")
                  senao
                     manaT <- manaT - 30
                     turno_perdido <- 1
                     escreval("MARCA SOMBRIA! Fada tera -30% ataque proximo turno!")
                  fimse
            fimescolha

            se hpT <= 0 entao
               vida_fada <- 0
            fimse
         fimse // fim trevas vs fada

         //-------------------------------------
         // SAGRADO vs FADA (boss)
         //-------------------------------------
         se personagem = 40 entao
            escreval("|==============================|")
            escreval("|  SAGRADO HP:", hpS, "  MANA:", manaS, "  |")
            escreval("|==============================|")
            escreval("|  FADA BOSS  HP:", vida_fada, "       |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("FADA BLOQUEADA pelo Escudo Sagrado!")
            senao
               se x >= 11 entao
                  hpS <- hpS - 22
                  escreval("FADA BOSS ACERTOU! -22 HP")
               senao
                  escreval("FADA ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - LUZ PURIFICADORA  (20 dano, sem mana)")
            escreval("  2 - JULGAMENTO DIVINO  (35 dano, 25 mana)")
            escreval("  3 - BENCAO CELESTIAL   (+20 HP, 30 mana)")
            escreval("  4 - ESCUDO SAGRADO     (bloqueia dano, 35 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  se y >= 11 entao
                     vida_fada <- vida_fada - 20
                     escreval("LUZ PURIFICADORA! -20 HP na Fada")
                  senao
                     escreval("ERROU!")
                  fimse
               caso 2
                  se manaS < 25 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaS <- manaS - 25
                     se y >= 11 entao
                        vida_fada <- vida_fada - 35
                        escreval("JULGAMENTO DIVINO! -35 HP na Fada!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 3
                  se manaS < 30 entao
                     escreval("SEM MANA!")
                  senao
                     manaS <- manaS - 30
                     hpS <- hpS + 20
                     escreval("BENCAO CELESTIAL! +20 HP!")
                  fimse
               caso 4
                  se manaS < 35 entao
                     escreval("SEM MANA!")
                  senao
                     manaS <- manaS - 35
                     turno_perdido <- 1
                     escreval("ESCUDO SAGRADO! Proximo dano bloqueado!")
                  fimse
            fimescolha

            se hpS <= 0 entao
               vida_fada <- 0
            fimse
         fimse // fim sagrado vs fada

      fimenquanto // fim luta_fada

      escreval("Pressione ENTER para o resultado...")
      leia(z)

      se personagem = 10 entao
         se hpF <= 0 entao
            escreval("  FADA FOI DERROTADA! Voltando...")
            hpF <- 100
            manaF <- 100
            personagem <- 0
         senao
            escreval("  VOCE VENCEU A FADA! ELA SE JUNTA A CAUSA!")
            torreFada <- 1
            fadaV <- 2
         fimse
      fimse
      se personagem = 20 entao
         se hpD <= 0 entao
            escreval("  DRAGAO FOI DERROTADO! Voltando...")
            hpD <- 180
            manaD <- 60
            personagem <- 0
         senao
            escreval("  VOCE VENCEU A FADA! ELA SE JUNTA A CAUSA!")
            torreFada <- 1
            fadaV <- 2
         fimse
      fimse
      se personagem = 30 entao
         se hpT <= 0 entao
            escreval("  TREVAS FOI DERROTADA! Voltando...")
            hpT <- 120
            manaT <- 80
            personagem <- 0
         senao
            escreval("  VOCE VENCEU A FADA! ELA SE JUNTA A CAUSA!")
            torreFada <- 1
            fadaV <- 2
         fimse
      fimse
      se personagem = 40 entao
         se hpS <= 0 entao
            escreval("  SAGRADO FOI DERROTADO! Voltando...")
            hpS <- 130
            manaS <- 110
            personagem <- 0
         senao
            escreval("  VOCE VENCEU A FADA! ELA SE JUNTA A CAUSA!")
            torreFada <- 1
            fadaV <- 2
         fimse
      fimse

      escreval("Pressione ENTER para continuar...")
      leia(z)
   fimprocedimento

procedimento historia_conversar_fada
   Var
      dado : inteiro
      x : caractere
   Inicio
      limpatela()
      escreval("=== CONVERSA COM A FADA ===")
      escreval("Uma floresta viva dentro da torre.")
      escreval("Luz filtrada entre árvores ancestrais.")
      escreval("A Fada não aparece de imediato - ela observa...")
      escreval("")
      escreval("FADA: 'Você veio destruir o equilíbrio... ou protegê-lo?'")
      escreval("")
      escreval("Você tenta demonstrar que quer proteger o equilíbrio...")
      escreval("Role o D20! Tire de 11+ para convencer. Menos: batalha!")
      escreval("Pressione ENTER para rolar...")
      leia(x)

      aleatorio 1,20
      leia(dado)
      aleatorio off
      escreval("Voce tirou: ", dado, " no D20!")

      se dado >= 11 entao
         escreval("")
         escreval("FADA: 'Eu sinto em você... genuidade.'")
         escreval("FADA: 'Irei com você. Mas cuide de todos os seres no caminho.'")
         escreval("")
         escreval("SUCESSO! A Fada se juntou a causa!")
         torreFada <- 1
         fadaV <- 2
      senao
         escreval("")
         escreval("FADA: 'Mentira! A floresta rejeita sua presenca!'")
         escreval("FALHOU! A floresta ataca! Prepare-se para lutar!")
         timer 2500
         timer 0
         luta_fada()
      fimse

      escreval("Pressione ENTER para continuar...")
      leia(x)
   fimprocedimento

procedimento cenario_fada
   Var
      escolha_acao : inteiro
   inicio
      limpatela()
escreval ("                                                                                          ")
escreval ("                            vv              ^^^^ vvvvv^^^^^^^^vv ^^^              v       ")
escreval ("                     vvv^^^^vvvvv       vvvvvv       vvvvv^^^^vvv          vvv^^          ")
escreval ("                 vvvvvvvvv^^vvvvvv^^vvvvv    ^^^^vvvv ^^^vvvvv         vvvvvvvvv          ")
escreval ("        vvvvvvvvvvv^^^^^^^^^^^^^vvvvv^^^vvvvv vvvv^^^^   ^    vvvvvvvvvvv^^^^^^^          ")
escreval ("    vvvvvvv^^^^^^^^^vvv^^^^^^^vvvvvvvvvvv^^^vvv  ^v  vvv  vvvvvvv^^^^^^^^^vvv^^^          ")
escreval ("  vvvv^^^^^^vvvvv^^^^^^^vv^^^^^^^vvvv^^^vvvvvv^^^^ vvv/ vvvv^^^^^^vvvvv^^^^^^^vv          ")
escreval (" vv^^^^^^^^vvv^^^^^vv^^^^vvvvvvvvvvvv^^^^^^vv^   vvv / vv^^^^^^^^vvv^^^^^vv^^^^v          ")
escreval (" vvv^^^^^vvvv^^^^^^vvvvv^^vvvvvvvvv^^^^^^vvvvv^ vv  /  vvv^^^^^vvvv^^^^^^vvvvv^^          ")
escreval ("  vvvvvvvvvv^^^v^^^vvvvvv^^vvvvvvvvvv^^^vvvvvvvvv  /  / vvvvvvvvvv^^^v^^^vvvvvv^          ")
escreval ("   ^vv^^^vvvvvvv^^vvvvv^^^^^^^^vvvvvvvvv^^^^^^vvvvvv /   ^vv^^^vvvvvvv^^vvvvv^^^          ")
escreval ("     ^vvvvvvvvv^^^^vvvvvv^^^^^^vvvvvvvv^^^vvvvvvvvvv^v     ^vvvvvvvvv^^^^vvvvvv^          ")
escreval ("        ^^^^^^vvvv^^vvvvv^vvvv^^^v^^^^^^vvvvvv^^^^vvvv        ^^^^^^vvvv^^vvvvv^          ")
escreval (" vvvv^^vvv^^^vvvvvvvvvv^vvvvv^vvvvvv^^^vvvvvvv^^vvvvv^ vvvv^^vvv^^^vvvvvvvvvv^vv          ")
escreval ("vvv^vvvvv^^vvvvvvv^^vvvvvvv^^vvvvv^v  vvv^vvvv^^vvvvv^vvv^vvvvv^^vvvvvvv^^vvvvvv          ")
escreval (" ^vvvvvv^^vvvvvvvv^vv^vvv^^^^^^ ^^^   ^^^vvvvvvvv^^^^  ^vvvvvv^^vvvvvvvv^vv^vvv^          ")
escreval ("    ^^vvvvvvv^^vvvvvvvvvv^^^vvvv   ^^^^ vvv^^^      |     ^^vvvvvvv^^vvvvvvvvvv^          ")
escreval ("         ^^vvvvvv^^^^^^vvvvv   /vvvv    vvvv^v   |  |          ^^vvvvvv^^^^^^vvv          ")
escreval ("              ^^vvvvvvvvvvv   /     vvvvvvvvvvv     |               ^^vvvvvvvvvv         ")
escreval ("                    \_  ^\   /     /       |  |  |  |                     \_  ^\        ")
escreval ("                      \   \  |    /        |  |     |                       \          ")
escreval ("      (\__     __/)    \\ |  |   /         |  |  |  |                        \\       ")
escreval ("     :=)__)   (__(=:    \       /          |        |                         \      ")
escreval ("      (/   | /   \)      |     |           |     |  |               ^^^^^^     |     ")
escreval ("           |/            |     | ^^^^^^  ^^|     |  |^ ^^^^^^^^^^^^       ^^^^^|      ")
escreval ("           |    ^^^^^^^^ ||    |^^^   ^^^^ | |   |  |          ^               |     ")
escreval ("       ^^^^^^^^^^       / / \   \          / /  / \  \         ^^^            /     ")
escreval ("^^^^^^^  ^          ^^   ^^         ^                  ^^^       ^^^ ^^            ")
escreval ("^      ^^^       ^ ^^^^^^^         ^       ^             ^^^^      ^^^ ^^^         ")
escreval ("     ^^     ^   ^^^^^             ^       ^^                ^^^^    ^^^  ^^^      ")
escreval ("    ^^    ^^^^^^^               ^^^       ^                    ^     ^^     ^^^  ")
      escreval("Uma floresta viva dentro da torre. ")
      escreval("Luz filtra entre arvores ancestrais.")
      escreval("Flores brilham. ")
      escreval("Tudo parece vivo... e te observa")
      escreval("")
      escreval("Você sente que é observado, mas não vê ninguém.")
      escreval("")
      escreval("O QUE VOCÊ DECIDE FAZER?")
      escreval("1- CONVERSAR (chamar a Fada) || 2- ATACAR || 3- TENTAR IR EMBORA")
      leia(escolha_acao)

      escolha escolha_acao
         caso 1
            historia_conversar_fada()
         caso 2
            luta_fada()
         caso 3
            ir_embora_fada()
      fimescolha

      escolha_torre <- 0
   fimprocedimento


//=========================================
// TORRE DO SAGRADO
// Mesma estrutura das outras torres.
// Boss: Sagrado (HP 260). Se o jogador E Sagrado,
// a torre e bloqueada.
//=========================================
procedimento ir_embora_sagrado
   var
      y : inteiro
      x : caractere
   inicio
      limpatela()
      escreval("=== TENTANDO FUGIR ===")
      escreval("Você tenta sair da sala branca e silenciosa...")
      escreval("O Sagrado apenas observa, como se já soubesse seu destino.")
      escreval("Role um D20 para tentar fugir (precisa de 11+)!")
      escreval("Pressione ENTER para rolar...")
      leia(x)
      aleatorio 1,20
      leia(y)
      aleatorio off
      escreval("Voce tirou: ", y, " no D20!")
      se y >= 11 entao
         escreval("CONSEGUIU FUGIR!")
         escreval("A porta aparece e você sai.")
         escreval("(Torre ignorada - Sagrado nao foi recrutado)")
         torreSagrado <- 0
      senao
         escreval("A sala nao tem saída que voce possa ver...")
         escreval("SAGRADO: 'Há algo que você precisa responder antes de sair.'")
         timer 2500
         timer 0
         historia_conversar_sagrado()
      fimse
      escreval("Pressione ENTER para continuar...")
      leia(x)
   fimprocedimento

// luta_sagrado: combate da torre do Sagrado.
// Boss tem HP 260.
procedimento luta_sagrado
   Var
      vida_sagrado, x, turno_perdido, y : inteiro
      escudo_ativo, bonus_ataque : inteiro
      z : caractere
   inicio
      // Boss Sagrado tem atributos diferentes do jogavel
      vida_sagrado <- 130
      turno_perdido <- 0
      escudo_ativo <- 0
      bonus_ataque <- 0

      se hpF = 0 entao
         hpF <- 100
      fimse
      se manaF = 0 entao
         manaF <- 100
      fimse
      se hpD = 0 entao
         hpD <- 180
      fimse
      se manaD = 0 entao
         manaD <- 60
      fimse
      se hpT = 0 entao
         hpT <- 120
      fimse
      se manaT = 0 entao
         manaT <- 80
      fimse
      se hpS = 0 entao
         hpS <- 130
      fimse
      se manaS = 0 entao
         manaS <- 110
      fimse

      enquanto vida_sagrado > 0 faca

         //-------------------------------------
         // FADA vs SAGRADO (boss)
         //-------------------------------------
         se personagem = 10 entao
            escreval("|============================|")
            escreval("|  FADA  HP:", hpF, "  MANA:", manaF, "  |")
            escreval("|============================|")
            escreval("|  SAGRADO BOSS  HP:", vida_sagrado, "   |")
            escreval("|============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("SAGRADO DORMINDO - TURNO PERDIDO!")
            senao
               se x >= 11 entao
                  hpF <- hpF - 27
                  escreval("SAGRADO ACERTOU! -27 HP (Julgamento Boss)")
               senao
                  escreval("SAGRADO ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - FEITICO BASICO  (15 dano, sem mana)")
            escreval("  2 - CANCAO DE NINAR (dorme sagrado, 30 mana)")
            escreval("  3 - BENCAO DIVINA   (cura +30 HP, 20 mana)")
            escreval("  4 - CANHAO FLOWER   (30 dano, 10 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  se y >= 11 entao
                     vida_sagrado <- vida_sagrado - 15
                     escreval("FEITICO BASICO! -15 HP no Sagrado")
                  senao
                     escreval("ERROU!")
                  fimse
               caso 2
                  se manaF < 30 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaF <- manaF - 30
                     escreval("FADA usou CANCAO DE NINAR - tirou ", y, " no D20!")
                     se y >= 11 entao
                        turno_perdido <- 1
                        escreval("ACERTOU! Sagrado vai dormir!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 3
                  se manaF < 20 entao
                     escreval("SEM MANA!")
                  senao
                     se hpF >= 100 entao
                        escreval("VIDA JA NO MAXIMO!")
                     senao
                        aleatorio 1,20
                        leia(y)
                        aleatorio off
                        manaF <- manaF - 20
                        se y >= 11 entao
                           hpF <- hpF + 30
                           escreval("BENCAO! +30 HP!")
                        senao
                           escreval("ERROU!")
                        fimse
                     fimse
                  fimse
               caso 4
                  se manaF < 10 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaF <- manaF - 10
                     se y >= 11 entao
                        vida_sagrado <- vida_sagrado - 30
                        escreval("CANHÃO FLOWER! -30 HP no Sagrado!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
            fimescolha

            se hpF <= 0 entao
               vida_sagrado <- 0
            fimse
         fimse // fim fada vs sagrado

         //-------------------------------------
         // DRAGAO vs SAGRADO (boss)
         //-------------------------------------
         se personagem = 20 entao
            escreval("|==============================|")
            escreval("|  DRAGAO  HP:", hpD, "  MANA:", manaD, "  |")
            escreval("|==============================|")
            escreval("|  SAGRADO BOSS  HP:", vida_sagrado, "   |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("SAGRADO ATORDOADO - TURNO PERDIDO!")
            senao
               se x >= 11 entao
                  se escudo_ativo = 1 entao
                     escudo_ativo <- 0
                     escreval("SAGRADO ACERTOU mas ESCAMAS ANCESTRAIS absorveram!")
                  senao
                     hpD <- hpD - 28
                     escreval("SAGRADO BOSS ACERTOU! -28 HP")
                  fimse
               senao
                  escreval("SAGRADO ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - MORDIDA          (25 dano, sem mana)")
            escreval("  2 - BAFO DE FOGO     (40 dano, 15 mana)")
            escreval("  3 - ESCAMAS ANCESTRAIS (25 mana)")
            escreval("  4 - FURIA DRAGONICA  (60 dano, 40 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  se y >= 11 entao
                     vida_sagrado <- vida_sagrado - 25
                     escreval("MORDIDA! -25 HP no Sagrado")
                  senao
                     escreval("ERROU!")
                  fimse
               caso 2
                  se manaD < 15 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaD <- manaD - 15
                     se y >= 11 entao
                        vida_sagrado <- vida_sagrado - 40
                        escreval("BAFO DE FOGO! -40 HP no Sagrado!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 3
                  se manaD < 25 entao
                     escreval("SEM MANA!")
                  senao
                     manaD <- manaD - 25
                     escudo_ativo <- 1
                     escreval("ESCAMAS ATIVADAS!")
                  fimse
               caso 4
                  se manaD < 40 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaD <- manaD - 40
                     se y >= 11 entao
                        vida_sagrado <- vida_sagrado - 60
                        escreval("FURIA DRAGONICA! -60 HP no Sagrado!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
            fimescolha

            se hpD <= 0 entao
               vida_sagrado <- 0
            fimse
         fimse // fim dragao vs sagrado

         //-------------------------------------
         // TREVAS vs SAGRADO (boss)
         //-------------------------------------
         se personagem = 30 entao
            escreval("|==============================|")
            escreval("|  TREVAS  HP:", hpT, "  MANA:", manaT, "  |")
            escreval("|==============================|")
            escreval("|  SAGRADO BOSS  HP:", vida_sagrado, "   |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("SAGRADO COM ATAQUE REDUZIDO (-30%)")
               se x >= 11 entao
                  hpT <- hpT - 19
                  escreval("SAGRADO ACERTOU! -19 HP (reduzido)")
               senao
                  escreval("SAGRADO ERROU!")
               fimse
            senao
               se x >= 11 entao
                  hpT <- hpT - 27
                  escreval("SAGRADO BOSS ACERTOU! -27 HP")
               senao
                  escreval("SAGRADO ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - ATAQUE BASICO    (20 dano, sem mana)")
            escreval("  2 - SOMBRA CORRUPTA  (45 dano, 25 mana)")
            escreval("  3 - ROUBO DE VIDA    (18 dano +9 HP, 20 mana)")
            escreval("  4 - MARCA SOMBRIA    (-30% ataque, 30 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  se y >= 11 entao
                     vida_sagrado <- vida_sagrado - 20
                     escreval("ATAQUE BASICO! -20 HP no Sagrado")
                  senao
                     escreval("ERROU!")
                  fimse
               caso 2
                  se manaT < 25 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaT <- manaT - 25
                     se y >= 11 entao
                        vida_sagrado <- vida_sagrado - 45
                        escreval("SOMBRA CORRUPTA! -45 HP no Sagrado!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 3
                  se manaT < 20 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaT <- manaT - 20
                     se y >= 11 entao
                        vida_sagrado <- vida_sagrado - 18
                        hpT <- hpT + 9
                        escreval("ROUBO DE VIDA! -18 HP + 9 HP de volta!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 4
                  se manaT < 30 entao
                     escreval("SEM MANA!")
                  senao
                     manaT <- manaT - 30
                     turno_perdido <- 1
                     escreval("MARCA SOMBRIA! Sagrado tera -30% ataque proximo turno!")
                  fimse
            fimescolha

            se hpT <= 0 entao
               vida_sagrado <- 0
            fimse
         fimse // fim trevas vs sagrado

         //-------------------------------------
         // SAGRADO (jogavel) vs SAGRADO INIMIGO (boss)
         //-------------------------------------
         se personagem = 40 entao
            escreval("|==============================|")
            escreval("|  SAGRADO HP:", hpS, "  MANA:", manaS, "  |")
            escreval("|==============================|")
            escreval("|  SAGRADO INIMIGO  HP:", vida_sagrado, " |")
            escreval("|==============================|")

            aleatorio 1,20
            leia(x)
            aleatorio off

            se turno_perdido = 1 entao
               turno_perdido <- 0
               escreval("SAGRADO INIMIGO BLOQUEADO pelo Escudo!")
            senao
               se x >= 11 entao
                  hpS <- hpS - 35
                  escreval("SAGRADO INIMIGO ACERTOU! -35 HP (Julgamento Divino Boss)")
               senao
                  escreval("SAGRADO INIMIGO ERROU!")
               fimse
            fimse

            escreval("------------------------------------------")
            escreval("  1 - LUZ PURIFICADORA  (20 dano, sem mana)")
            escreval("  2 - JULGAMENTO DIVINO  (35 dano, 25 mana)")
            escreval("  3 - BENCAO CELESTIAL   (+20 HP, 30 mana)")
            escreval("  4 - ESCUDO SAGRADO     (bloqueia dano, 35 mana)")
            escreval("------------------------------------------")
            leia(ataque)

            escolha ataque
               caso 1
                  aleatorio 1,20
                  leia(y)
                  aleatorio off
                  se y >= 11 entao
                     vida_sagrado <- vida_sagrado - 20
                     escreval("LUZ PURIFICADORA! -20 HP no Sagrado inimigo")
                  senao
                     escreval("ERROU!")
                  fimse
               caso 2
                  se manaS < 25 entao
                     escreval("SEM MANA!")
                  senao
                     aleatorio 1,20
                     leia(y)
                     aleatorio off
                     manaS <- manaS - 25
                     se y >= 11 entao
                        vida_sagrado <- vida_sagrado - 35
                        escreval("JULGAMENTO DIVINO! -35 HP!")
                     senao
                        escreval("ERROU!")
                     fimse
                  fimse
               caso 3
                  se manaS < 30 entao
                     escreval("SEM MANA!")
                  senao
                     manaS <- manaS - 30
                     hpS <- hpS + 20
                     escreval("BENCAO CELESTIAL! +20 HP e bonus!")
                  fimse
               caso 4
                  se manaS < 35 entao
                     escreval("SEM MANA!")
                  senao
                     manaS <- manaS - 35
                     turno_perdido <- 1
                     escreval("ESCUDO SAGRADO! Proximo dano bloqueado!")
                  fimse
            fimescolha

            se hpS <= 0 entao
               vida_sagrado <- 0
            fimse
         fimse // fim sagrado vs sagrado

      fimenquanto // fim luta_sagrado

      escreval("Pressione ENTER para o resultado...")
      leia(z)

      se personagem = 10 entao
         se hpF <= 0 entao
            escreval("  FADA FOI DERROTADA! Voltando...")
            hpF <- 100
            manaF <- 100
            personagem <- 0
         senao
            escreval("  VOCE VENCEU O SAGRADO! ELE SE JUNTA A CAUSA!")
            torreSagrado <- 1
            sagradoV <- 1
         fimse
      fimse
      se personagem = 20 entao
         se hpD <= 0 entao
            escreval("  DRAGAO FOI DERROTADO! Voltando...")
            hpD <- 180
            manaD <- 60
            personagem <- 0
         senao
            escreval("  VOCE VENCEU O SAGRADO! ELE SE JUNTA A CAUSA!")
            torreSagrado <- 1
            sagradoV <- 1
         fimse
      fimse
      se personagem = 30 entao
         se hpT <= 0 entao
            escreval("  TREVAS FOI DERROTADA! Voltando...")
            hpT <- 120
            manaT <- 80
            personagem <- 0
         senao
            escreval("  VOCE VENCEU O SAGRADO! ELE SE JUNTA A CAUSA!")
            torreSagrado <- 1
            sagradoV <- 1
         fimse
      fimse
      se personagem = 40 entao
         se hpS <= 0 entao
            escreval("  SAGRADO FOI DERROTADO! Voltando...")
            hpS <- 130
            manaS <- 110
            personagem <- 0
         senao
            escreval("  VOCE VENCEU O SAGRADO INIMIGO! ELE ACEITA VOCE!")
            torreSagrado <- 1
            sagradoV <- 1
         fimse
      fimse

      escreval("Pressione ENTER para continuar...")
      leia(z)
   fimprocedimento

procedimento historia_conversar_sagrado
   Var
      dado : inteiro
      x : caractere
   Inicio
      limpatela()
      escreval("=== CONVERSA COM O SAGRADO ===")
      escreval("Uma sala branca e silenciosa.")
      escreval("Tudo iluminado, mas sem origem de luz.")
      escreval("O ser sagrado está no centro, imóvel,")
      escreval("olhando diretamente para voce.")
      escreval("")
      escreval("SAGRADO: 'Por que você luta? Pelo poder... ou pela escolha?'")
      escreval("")
      escreval("Você tenta responder com coerência e propósito...")
      escreval("Role o D20! Tire de 11+ para convencer. Menos: julgamento!")
      escreval("Pressione ENTER para rolar...")
      leia(x)

      aleatorio 1,20
      leia(dado)
      aleatorio off
      escreval("Voce tirou: ", dado, " no D20!")

      se dado >= 11 entao
         escreval("")
         escreval("SAGRADO: 'Sua resposta é... coerente.'")
         escreval("SAGRADO: 'Eu não luto por você. Luto pelo que é certo.'")
         escreval("SAGRADO: 'Me guie bem.'")
         escreval("")
         escreval("SUCESSO! O Sagrado se juntou a causa!")
         torreSagrado <- 1
         sagradoV <- 1
      senao
         escreval("")
         escreval("SAGRADO: 'Você não sabe o que quer. Deixe-me te mostrar.'")
         escreval("FALHOU! O Sagrado te quebra com julgamento. Prepare para lutar!")
         timer 2500
         timer 0
         luta_sagrado()
      fimse

      escreval("Pressione ENTER para continuar...")
      leia(x)
   fimprocedimento

procedimento cenario_sagrado
   Var
      escolha_acao : inteiro
   inicio
      limpatela()
escreval ("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ")
escreval ("@@       @@@@                                                               @@@@@@                @@ ")
escreval ("@@        @@@@@                                                            @@@@                   @@ ")
escreval ("@@          @@@@@@                                                     @@@@@@                     @@ ")
escreval ("@@            @@@@@                @@@@@@@@@@@@@@                     @@@@@                       @@ ")
escreval ("@@               @@@@           @@@@@@@@@@@@@@@@@@@@                @@@@                          @@ ")
escreval ("@@                  @@@      @@@@                  @@@@          @@@@                             @@ ")
escreval ("@@                   @@@@ @@@@                        @@@@   @@@@@                                @@ ")
escreval ("@@                     @@@@@@        @@@@@@@@@@@        @@@@@@@@@                                 @@ ")
escreval ("@@                     @@@@@@        @@@@@@@@@@@         @@@@@                                    @@ ")
escreval ("@@                   @@@@   @@@@@    @@@@@@@@@@@     @@@@@ @@@@                                   @@ ")
escreval ("@@                   @@@        @@@  @@@@@@@@@@@   @@@      @@@                                   @@ ")
escreval ("@@                  @@@@          @@@@@@@@@@@@@@@@@@        @@@@                                  @@ ")
escreval ("@@                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@                                 @@ ")
escreval ("@@                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                 @@ ")
escreval ("@@                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                 @@ ")
escreval ("@@                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                 @@ ")
escreval ("@@                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                 @@ ")
escreval ("@@                  @@@@          @@@@@@@@@@@@@@@@           @@@@                   @@@@@@@@@@@@  @@ ")
escreval ("@@                   @@@        @@@@@@@@@@@@@@@@@@@@        @@@                     @@@@@@@@@@@@  @@ ")
escreval ("@@                   @@@       @@@@  @@@@@@@@@@@  @@@@      @@@                  @@@@@@@@@@@@@@@@@@@ ")
escreval ("@@                   @@@@@   @@@@    @@@@@@@@@@@   @@@@    @@@@                  @@@@@@@@@@@@@@@@@@@ ")
escreval ("@@                     @@@  @@@@     @@@@@@@@@@@     @@@@  @@@                   @@@@@@@@@@@@@@@@@@@ ")
escreval ("@@                      @@@@@        @@@@@@@@@@@        @@@@                      @@@          @@@@@ ")
escreval ("@@ @@                   @@@@@@       @@@@@@@@@@@       @@@@@@                     @@@@@@@@@@@@@@@@@@ ")
escreval ("@@ @@                @@@@@  @@@@@    @@@@@@@@@@@   @@@@@@  @@@@                   @@@@@@@@@@@@@@@@@@ ")
escreval ("@@@@@@@@            @@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@     @@@                      @@@@@@@@@    @@ ")
escreval ("@@@@@@@@          @@@@          @@@@@@@@@@@@@@@@@@@@        @@@@@                    @@@@@@@@@    @@ ")
escreval ("@@ @@       @@@  @@@@               @@@@@@@@@@@@@             @@@@                  @@@@@@@@@@@@  @@ ")
escreval ("@@ @@       @@@  @@                  @@@@@@@@@@@                 @@@                @@@@@@@@@@@@  @@ ")
escreval ("@@@@@@@@ @@@@@@@@@                   @@@@@@@@@@@                   @@@              @@@@@@@@@@@@  @@ ")
escreval ("@@@@@@@@@@@ @@@@                     @@@@@@@@@@@                    @@@@          @@@@@@@@@@@@@@@ @@ ")
escreval ("@@     @@@@@@@@                 @@@@@@@@@@@@@@@@@@@@                  @@@@    @@@@@@@@@@@@@@@@@@@@@@ ")
escreval ("@@       @@@@@@@@@          @@@@@@@@@@@@@@@@@@@@@@@@@@@                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ")
escreval ("@@     @@@@   @@@@@@@   @@@@@@@@@                 @@@@@@@@               @@@@@@@@@@              @@@ ")
escreval ("@@    @@@           @@@@@@@                             @@@@@@        @@@@@@@@@                   @@ ")
escreval ("@@ @@@@             @@@@@@                                 @@@@@  @@@@@@@     @@@                 @@ ")
escreval ("@@@@@            @@@@@@@                                    @@@@@@@@@          @@@@               @@ ")
escreval ("@@@@           @@@@@@                                         @@@@@@             @@@@             @@ ")
escreval ("@@           @@@@@@                                             @@@@@             @@@@@           @@ ")
escreval ("@@          @@@@@@                                               @@@@@@             @@@@          @@ ")
escreval ("@@        @@@                                                       @@@@@              @@@        @@ ")
escreval ("@@       @@@@                                                         @@@@             @@@        @@ ")
escreval ("@@    @@@@@@                                                           @@@@@            @@@@@     @@ ")
escreval ("@@    @@@@                                                               @@@@             @@@@    @@ ")
escreval ("@@  @@@@                                                                  @@@@@             @@@@     ")
escreval ("@@ @@@@@                                                                   @@@@@@@@@@@@@@@@@@@@@@@@@ ")
escreval ("@@@@@@                                                                       @@@@@@@@@@@@@@@@@@@@@@@ ")
escreval ("@@                                                                                                @@ ")
escreval ("@@                                                                                                @@ ")
escreval ("@@                                                                                                @@ ")
escreval ("@@                                                                                                @@ ")
escreval ("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ")

timer 1000

limpatela

timer 0

 escreval ("                                 @@@@@@@@@@@@@@@@@@@                                     ")
 escreval ("       IN NÓMINE PATRIS,     @@@@@                  @@@@@                                ")
 escreval (" ET FÍLII, ET SPÍRITUS     @@    @@@@@@@@@@@@@@@@@@@   @@@                              ")
 escreval ("  SANCTI. AMEN...         @@   @@@                 @@@  @@@                             ")
 escreval ("                           @@    @@@@@@@@@@@@@@@@@@@   @@@                              ")
 escreval ("                            @@@@                     @@@@                               ")
 escreval ("    @@@@@@@                 @@ @@@@@@@@@@@@@@@@@@@@@@@ @@                 @@@@@@@       ")
 escreval ("    (___ @@@@@@            @@@          @@   @@        @@@              @@@@@@@@@       ")
 escreval ("     (___(__@@@@@          @@@     @@@@@      @@@@@    @@@           @@@@@__)__)        ")
 escreval ("      (_(_______@@         @@@     @@            @@    @@@          @@______)_)         ")
 escreval ("       (__(_____@@@        @@@@    @@@@@      @@@@@   @@@@        @@@_____)___)         ")
 escreval ("        (__(____@@@@        @@@@      @@      @@     @@@@       @@@@______)__)          ")
 escreval ("         (__(_____@@@        @@@@     @@      @@    @@@@        @@@______)__)           ")
 escreval ("          (__(_____@@@        @@@@@@@@@@@@@@@@@@@@@@@@@        @@@______)__)            ")
 escreval ("          (___(_____ @@@      @@@@@@@@@@@@@@@@@@@@@@@@@       @@@_______)__)            ")
 escreval ("         (___(______(__@@@@@@@@   @     @@  @@    @   @@@@@@@@@______)_____)            ")
 escreval ("         (______(____(__@@  @@    @    @@ @@ @@   @    @@______)____)____)              ")
 escreval ("           (______(____(___@@   @@     @@ @@ @@   @@    @@____)______)___)              ")
 escreval ("            (______(______@@   @@@@@@@@@@ @@ @@@@@@@@@@  @@___)____)______)              ")
 escreval ("             (_______(___ @@  @        @  @@  @        @ @@ ___)________)                ")
 escreval ("              (___(___(___@@           @@@@@@@@         @@____)______)__)                 ")
 escreval ("                  (___(____@@@@@@@@@@@@        @@@@@@@@@@_____)____)                     ")
 escreval ("                           @@@                        @@@                               ")
 escreval ("                          @@@@                        @@@@                              ")
 escreval ("                          @@@                          @@@                              ")
 escreval ("                          @@            @@@@            @@                              ")
 escreval ("                         @@           @@    @@           @@                             ")
 escreval ("                         @@         @@@      @@@         @@                             ")
 escreval ("                         @@        @@@        @@@        @@                             ")
 escreval ("                         @@@     @@@@          @@@@     @@@                             ")
 escreval ("                           @@@@@@                  @@@@@@                              ")
   escreval("-----------------------------------------------------------------------------------------------------")
   escreval("-----------------------------------------------------------------------------------------------------")
   escreval("VOCÊ ADENTRA O ANDAR MISTERIOSO, A LUZ ALI DENTRO NÃO ILUMINAVA;")
   escreval("ELA PURIFICAVA, E CADA PASSO EM DIREÇÃO À CRIATURA PARECIA UM PECADO COMETIDO. O QUE FAZER???")
      escreval("")
      escreval("SAGRADO: 'Eu sabia que voce viria.'")
      escreval("")
      escreval("O QUE VOCÊ DECIDE FAZER?")
      escreval("1- CONVERSAR COM SAGRADO || 2- ATACAR || 3- TENTAR IR EMBORA")
      leia(escolha_acao)

      escolha escolha_acao
         caso 1
            historia_conversar_sagrado()
         caso 2
            luta_sagrado()
         caso 3
            ir_embora_sagrado()
      fimescolha

      escolha_torre <- 0
   fimprocedimento


//=========================================
// VERIFICACAO E BATALHA FINAL
//=========================================
// veri: verifica se o jogador recrutou todos os
// elementos antes de ir ao desafio final.
// Exibe o checklist de recrutados e, se todos
// estiverem completos, chama batalha_final.
// Caso contrario, exibe mensagem de derrota.
procedimento veri
   inicio
      // Condicao de acesso ao enigma do Maxwell:
      // TODOS os 4 elementos precisam estar recrutados.
      // fadaV usa valor 2 porque e o codigo especial da Fada.
      se (dragaoV = 1) e (fadaV = 2) e (trevasV = 1) e (sagradoV = 1) entao
         escreval("========================================")
         escreval("  TODOS OS ELEMENTOS FORAM RECRUTADOS! ")
         escreval("========================================")
         escreval(" DRAGÃO....  RECRUTADO!")
         escreval(" FADA......  RECRUTADA!")
         escreval(" TREVAS....  RECRUTADO!")
         escreval(" SAGRADO...  RECRUTADO!")
         escreval("========================================")
         escreval("  O CAMINHO PARA O DESAFIO FINAL")
         escreval("       ESTÁ ABERTO!")
         escreval("========================================")
         timer 3000
         limpatela()
         timer 0
         batalha_final()
      senao
         escreval("========================================")
         escreval("  VOCÊ AINDA NÃO RECRUTOU TODOS OS")
         escreval("    ELEMENTOS. VOLTE AS TORRES!")
         escreval("========================================")
         // Exibe [X] para recrutados e [ ] para faltantes.
         se dragaoV = 1 entao
            escreval("  [X] DRAGAO")
         senao
            escreval("  [ ] DRAGAO")
         fimse
         se fadaV = 2 entao
            escreval("  [X] FADA")
         senao
            escreval("  [ ] FADA")
         fimse
         se trevasV = 1 entao
            escreval("  [X] TREVAS")
         senao
            escreval("  [ ] TREVAS")
         fimse
         se sagradoV = 1 entao
            escreval("  [X] SAGRADO")
         senao
            escreval("  [ ] SAGRADO")
         fimse
         escreval("========================================")
         timer 3000
         timer 0
      fimse
   fimprocedimento

// batalha_final: confronto com MAXWELL.
// So e acessivel se todos os 4 elementos estiverem
// recrutados (dragaoV=1, fadaV=2, trevasV=1, sagradoV=1).
// Apresenta um enigma sobre algoritmos.
// Resposta correta (2): vitoria. Errada: derrota.
procedimento batalha_final
   var
      resposta_enigma : inteiro
   inicio
      escreval("  ##################################################")
      escreval("  ##   *** TOWER FINAL - O DESAFIO DE MAXWELL *** ##")
      escreval("  ##################################################")
      timer 2000
      timer 0
escreval ("                     @@@@@@@@                       @@")
escreval ("            @@@@@@@@@@@@ @@ @@@@@@@@@             @@ @@")
escreval ("         @@@@      @@ @@ @@  @@    @@@@         @@@  @@")
escreval ("       @@@@       @@ @@   @@  @@     @@@@     @@@ @ @@")
escreval ("      @@         @@ @@  @  @@  @@       @@  @@@  @ @@")
escreval ("     @@         @@ @@  @ @  @@  @@        @@@  @  @@")
escreval ("    @@    @@@@@@@@@@   @ @   @@ @@@@@@@@@@@  @   @@")
escreval ("   @@    @@     @@ @  @   @  @@@@        @@@@   @@")
escreval ("   @@   @@       @@@  @   @  @@@         @@    @@")
escreval ("   @@   @@         @@@@    @@@ @@@@@@@@   @@  @@")
escreval ("   @@   @@           @@@@@@@ @@@      @@@  @@@@")
escreval ("  @@    @@            @@@  @@          @@   @@")
escreval ("   @@    @@ @@@@@@     @@@ @@            @@  @@")
escreval ("   @@    @@      @@    @@                @@  @@")
escreval ("   @@@@  @@            @@   @@@@@@@      @@  @@")
escreval ("  @@  @  @@ @@@@@@@    @@  @@     @@    @@@  @@")
escreval (" @@ @  @@@ @@  @@@ @   @@  @@  0  @@   @@@@  @@")
escreval ("@@  @@  @@ @@  @@@     @@  @@     @@    @@@ @@")
escreval ("@@ @  @@@@   @@@@@     @@@  @@@@@@@       @@@@")
escreval ("@@ @   @@            @ @@@@                @@")
escreval (" @@ @ @@@            @ @@@@@@  @@          @@")
escreval ("  @@   @@            @ @@ @@@   @@         @@")
escreval ("   @@@@@@           @  @@        @@       @@")
escreval ("      @@           @   @@         @@@@@@@@@@")
escreval ("      @@            @@ @@  @  @  @@       @@")
escreval ("      @@       @@      @@  @  @  @@       @@")
escreval ("     @@       @@@@@@@@@@@@@@@@@@@@       @@")
escreval ("       @@      @@      @@  @  @  @       @@")
escreval ("        @@      @@     @@  @  @         @@")
escreval ("         @@      @@    @@              @@")
escreval ("         @@       @@@@@@            @@@")
escreval ("           @@@         @@          @@@")
escreval ("             @@@       @@        @@@")
escreval ("               @@@     @@      @@@")
escreval ("                 @@@@@@@@@@@@@@@")
      escreval("")
      escreval("  >>> MAXWELL, O CRIADOR DAS TORRES, SURGE DAS SOMBRAS <<<")
      timer 3000
      timer 0

      se (dragaoV = 1) e (fadaV = 2) e (trevasV = 1) e (sagradoV = 1) entao

         escreval("========================================================")
         escreval(" MAXWELL: Ah... você chegou até mim com todos os quatro")
         escreval("  elementos. Impressionante. Mas antes de me derrotar,")
         escreval("  você deverá provar que realmente merece passar!")
         escreval("========================================================")
         escreval("")
         escreval(" MAXWELL: Diga-me, aventureiro...")
         escreval("")
         escreval(" MAXWELL: O QUE É UM ALGORITMO?")
         escreval("")
         escreval("  1 - É um programa de computador escrito em C ou Python.")
         escreval("")
         escreval("  2 - É uma sequência finita de instruções bem definidas")
         escreval("      e ordenadas para resolver um problema ou executar")
         escreval("      uma tarefa.")
         escreval("")
         escreval("  3 - É um tipo de hardware usado para processar dados")
         escreval("      mais rapidamente em servidores.")
         escreval("")
         escreval("  4 - É o nome dado ao conjunto de bugs encontrados")
         escreval("      em um software durante os testes.")
         escreval("")
         escreval("========================================================")
         escreval(" QUAL É A SUA RESPOSTA? (1, 2, 3 ou 4)")
         escreval("========================================================")
         leia(resposta_enigma)

         se resposta_enigma = 2 entao
            escreval("========================================================")
            escreval(" MAXWELL: ...")
            timer 2000
            timer 0
            escreval(" MAXWELL: Você... acertou.")
            timer 1500
            timer 0
            escreval(" MAXWELL: Interessante. Voce entendeu o que eu realmente")
            escreval("  queria testar.")
            escreval(" MAXWELL: Você percorreu por todo o caminho e entendeu a")
            escreval(" a mensagem.")
            escreval(" MAXWELL: Vocês estão livres")
            escreval("Os elementos descem as escadas da torre e partem á um novo")
            escreval("propósito.")
            escreval("========================================================")
            timer 2000
            timer 0
            escreval("  ****************************************************")
            escreval("  *                                                  *")
            escreval("  *   DRAGAO + FADA + TREVAS + SAGRADO = VITÓRIA!   *")
            escreval("  *                                                  *")
            escreval("  ****************************************************")
            timer 2000
            timer 0
            escreval("  ****************************************************")
            escreval("  *                                                  *")
            escreval("  *    VOCE NÃO TRANCOU O CURSO.                    *")
            escreval("  *    VOCÊ ENTENDEU O SISTEMA.                     *")
            escreval("  *                                                  *")
            escreval("  *  Você provou que aprendeu lógica e algoritmos!  *")
            escreval("  *  Parabéns por salvar todos os elementos!!!      *")
            escreval("  *                                                  *")
            escreval("  ****************************************************")
         senao
            escreval("========================================================")
            escreval(" MAXWELL: ERRADO!")
            timer 1500
            timer 0
            escreval(" MAXWELL: Você chegou até aqui... e ainda não entendeu.")
            escreval(" MAXWELL: Sem conhecimento, nao irá a lugar algum!")
            escreval("========================================================")
            timer 4000
            timer 0
            escreval("  ****************************************************")
            escreval("  *                                                  *")
            escreval("  *         VOCE TRANCOU O CURSO!!!                 *")
            escreval("  *                                                  *")
            escreval("  *  Os elementos se dispersaram... MAXWELL venceu. *")
            escreval("  *  Volte a estudar e tente novamente!             *")
            escreval("  *                                                  *")
            escreval("  ****************************************************")
         fimse

      senao
         escreval("========================================================")
         escreval(" MAXWELL: Você ousou me desafiar sem reunir todos?")
         escreval("")
         escreval(" MAXWELL: Você FALHOU em trilhar o caminho e não pôde")
         escreval("  salvar todos os elementos. Sem eles, você nada é.")
         escreval("========================================================")
         timer 2000
         timer 0
         escreval("  ****************************************************")
         escreval("  *                                                  *")
         escreval("  *         VOCÊ TRANCOU O CURSO!!!                 *")
         escreval("  *                                                  *")
         escreval("  *  Você no reuniu todos os elementos a tempo.    *")
         escreval("  *  MAXWELL venceu sem nem precisar do enigma!     *")
         escreval("  *                                                  *")
         escreval("  ****************************************************")
      fimse

   fimprocedimento


//=========================================
// INICIO DO PROGRAMA PRINCIPAL
// Fluxo geral:
//   1. Reset de todas as variaveis
//   2. Loop de escolha de classe (repita/ate)
//   3. Loop do mapa de torres (repita/ate)
//      - Jogador escolhe torres (1-4) ou vai ao
//        desafio final (5) ou sai (8)
//      - Torres recrutam elementos e atualizam flags
//   4. Se personagem=0 (morreu), reinicia tudo.
//      Se escolha_torre=8 (saiu), encerra o jogo.
//=========================================
Inicio

   // Loop externo: engloba uma partida completa.
   // Se o jogador morrer (personagem = 0), o loop reinicia
   // e o jogador escolhe um novo elemento do zero.
   // Se o jogador sair (escolha_torre = 8), encerra.
   // loop externo: reinicia tudo se o jogador morrer
   repita

   // Zera todos os flags e atributos para garantir
   // que uma nova partida comece do zero limpo.
   // resetar personagem e variaveis de controle para escolha de classe
   personagem <- 0
   trevasV <- 0
   dragaoV <- 0
   sagradoV <- 0
   fadaV <- 0
   torreDragao <- 0
   torreTrevas <- 0
   torreSagrado <- 0
   torreFada <- 0
   hpF <- 0
   manaF <- 0
   hpD <- 0
   manaD <- 0
   hpT <- 0
   manaT <- 0
   hpS <- 0
   manaS <- 0

   // Loop de escolha de classe: repete ate o jogador
   // confirmar um elemento (elemento = 0 sinaliza confirmacao).
   // escolha de classes
   repita
      limpatela()
      escreval("O mundo foi dividido em quatro torres, cada uma representando um elemento:")
      escreval("                    DRAGÃO | TREVAS | FADA | SAGRADO                      ")
      escreval("Esses elementos foram aprisionados por Maxwell, o criador das torres, ")
      escreval("que acreditava que o caos do mundo só poderia ser controlado se esses")
      escreval("poderes fossem selados.")
      escreval("Mas existe uma exceção: um dos elementos foi “quebrado” pela própria prisão")
      escreval("ele não aceitou o destino e despertou como o Rebelde, o personagem jogável.")
      escreval("---------------------------------------------------------------------------")
      escreval("                         ----BEM VINDO AO GAME----                         ")
      escreval("                     ----ESCOLHA O ELEMENTO REBELDE----                    ")
      escreval("              1- SAGRADO|| 2- TREVAS || 3- DRAGAO || 4- FADA               ")
      escreval("")
      leia(elemento)

      escolha elemento
         caso 1
            sagrado()
         caso 2
            trevas()
         caso 3
            dragao()
         caso 4
            fada()
      fimescolha

   ate(elemento = 0)

   // Loop das torres: o jogador navega pelo mapa
   // ate sair (8) ou morrer (personagem = 0).
   repita
      timer 2000
      limpatela()
      timer 0

      // Menu principal das torres.
      // Mostra o status de cada torre: normal, torre concluida,
      // seu elemento (inimigo) ou ja recrutado.
      escreval("========================================")
      escreval("     ESCOLHA UM ANDAR DA TORRE")
      escreval("========================================")

      se dragaoV = 1 entao
         escreval("  1 - DRAGAO    [RECRUTADO]")
      senao
         se torreDragao = 1 entao
            escreval("  1 - DRAGAO    [TORRE CONCLUIDA]")
         senao
            se personagem = 20 entao
               escreval("  1 - DRAGAO    [SEU ELEMENTO - INIMIGO AQUI]")
            senao
               escreval("  1 - DRAGAO")
            fimse
         fimse
      fimse

      se trevasV = 1 entao
         escreval("  2 - TREVAS    [RECRUTADO]")
      senao
         se torreTrevas = 1 entao
            escreval("  2 - TREVAS    [TORRE CONCLUIDA]")
         senao
            se personagem = 30 entao
               escreval("  2 - TREVAS    [SEU ELEMENTO - INIMIGO AQUI]")
            senao
               escreval("  2 - TREVAS")
            fimse
         fimse
      fimse

      se sagradoV = 1 entao
         escreval("  3 - SAGRADO   [RECRUTADO]")
      senao
         se torreSagrado = 1 entao
            escreval("  3 - SAGRADO   [TORRE CONCLUIDA]")
         senao
            se personagem = 40 entao
               escreval("  3 - SAGRADO   [SEU ELEMENTO - INIMIGO AQUI]")
            senao
               escreval("  3 - SAGRADO")
            fimse
         fimse
      fimse

      se fadaV = 2 entao
         escreval("  4 - FADA      [RECRUTADA]")
      senao
         se torreFada = 1 entao
            escreval("  4 - FADA      [TORRE CONCLUIDA]")
         senao
            se personagem = 10 entao
               escreval("  4 - FADA      [SEU ELEMENTO - INIMIGO AQUI]")
            senao
               escreval("  4 - FADA")
            fimse
         fimse
      fimse

      escreval("  5 - IR AO DESAFIO FINAL (MAXWELL)")
      escreval("  8 - SAIR DO JOGO")
      escreval("========================================")
      leia(escolha_torre)

      escolha escolha_torre
         caso 1
            se dragaoV = 1 entao
               escreval("Voce ja recrutou o Dragao! Escolha outra torre.")
               timer 2000
               timer 0
            senao
               se torreDragao = 1 entao
                  escreval("Voce ja concluiu esta torre! Escolha outra.")
                  timer 2000
                  timer 0
               senao
                  cenario_dragao()
               fimse
            fimse
         caso 2
            se trevasV = 1 entao
               escreval("Voce ja recrutou Trevas! Escolha outra torre.")
               timer 2000
               timer 0
            senao
               se torreTrevas = 1 entao
                  escreval("Voce ja concluiu esta torre! Escolha outra.")
                  timer 2000
                  timer 0
               senao
                  cenario_trevas()
               fimse
            fimse
         caso 3
            se sagradoV = 1 entao
               escreval("Voce ja recrutou Sagrado! Escolha outra torre.")
               timer 2000
               timer 0
            senao
               se torreSagrado = 1 entao
                  escreval("Voce ja concluiu esta torre! Escolha outra.")
                  timer 2000
                  timer 0
               senao
                  cenario_sagrado()
               fimse
            fimse
         caso 4
            se fadaV = 2 entao
               escreval("Voce ja recrutou a Fada! Escolha outra torre.")
               timer 2000
               timer 0
            senao
               se torreFada = 1 entao
                  escreval("Voce ja concluiu esta torre! Escolha outra.")
                  timer 2000
                  timer 0
               senao
                  cenario_fada()
               fimse
            fimse
         caso 5
            veri()
      fimescolha

   ate((escolha_torre = 8) ou (personagem = 0))

   // loop externo: continua so se morreu (personagem = 0)
   // se escolha_torre = 8 o jogador saiu, encerra
   ate(escolha_torre = 8)

Fimalgoritmo
