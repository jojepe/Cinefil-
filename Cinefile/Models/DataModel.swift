//
//  DataModel.swift
//  Cinefile
//
//  Created by Joje on 29/05/25.
//

import Foundation

struct DataModel{
    
    var filmLists: [Movie] = [
        
        Movie(poster: "monica", title: "Turma Da Mônica: Uma Aventura no Tempo", year: "2007", synopsis: "Franjinha está construindo uma máquina do tempo e precisa reunir moléculas dos quatro elementos: ar, água, fogo e terra. Mônica joga Sansão e, sem querer, acerta o aparelho, espalhando os elementos. Agora a turma precisa consertá-la.", director: "Maurício de Souza", writers: "Mauricio de Sousa, Flávio de Souza, Didi Oliveira, Emerson Bernardo de Abreu", isFavorite: false, isWatched: false, rating: 0, genres: ["Animação", "Aventura", "Comédia", "Ficção Científica"]),
                
                Movie(poster: "tudo", title: "Tudo em Todo o Lugar ao Mesmo Tempo", year: "2022", synopsis: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado.", director: "Daniel Kwan, Daniel Scheinert", writers: "Daniel Kwan, Daniel Scheinert", isFavorite: false, isWatched: false, rating: 0, genres: ["Comédia", "Ação", "Aventura"]),
                
                Movie(poster: "cisne", title: "Cisne Negro", year: "2010", synopsis: "Uma esforçada bailarina luta para manter sua sanidade após obter o papel principal no Lago dos Cisnes de Tchaikovsky.", director: "Darren Aronofsky", writers: "Mark Heyman, Andres Heinz, John J. McLaughlin", isFavorite: false, isWatched: false, rating: 0, genres: ["Drama", "Thriller"]),
                
                Movie(poster: "barbie", title: "Barbie a Princesa e a Plebeia", year: "2004", synopsis: "Uma plebeia, moradora de um vilarejo, é muito parecida com a princesa do reino. Os destinos das duas se cruzam quando a princesa é sequestrada, e a moça humilde usa sua incrível semelhança com ela para tentar salvar das mãos do vilão.", director: "William Lau", writers: "Cliff Ruby, Elana Lesser, Ruth Handler", isFavorite: false, isWatched: false, rating: 0, genres: ["Animação", "Comédia", "Musical"]),
                
                Movie(poster: "truman", title: "Show de Truman", year: "1998", synopsis: "Truman Burbank é um pacato vendedor de seguros que leva uma vida simples com sua esposa Meryl Burbank. Porém, algumas coisas ao seu redor fazem com que ele passe a estranhar sua cidade, seus supostos amigos e até sua mulher. Após conhecer a misteriosa Lauren, ele fica intrigado e acaba descobrindo que toda sua vida foi monitorada por câmeras e transmitida em rede nacional.", director: "Peter Weir", writers: "Peter Weir, Andrew Niccol", isFavorite: false, isWatched: false, rating: 0, genres: ["Comédia", "Drama", "Sátira"]),
                
                Movie(poster: "spirit", title: "Spirit: O Corcel Indomável", year: "2002", synopsis: "Animação sobre a amizade entre um menino indígena e um cavalo indomável apaixonado por uma égua. Ambientada no Velho Oeste americano, mostra o impacto do processo civilizatório na vida dos três e também na amizade que construíram.", director: "Kelly Asbury, Lorna Cook", writers: "John Fusco", isFavorite: false, isWatched: false, rating: 0, genres: ["Animação", "Aventura", "Drama"]),
                
                Movie(poster: "labirinto", title: "Labirinto do Fauno", year: "2006", synopsis: "Em 1944, na Espanha, a jovem Ofélia e sua mãe doente chegam ao posto do novo marido de sua mãe, um sádico oficial do exército que está tentando reprimir uma guerrilheira. Enquanto explorava um labirinto antigo, Ofélia encontra o Pan fauno, que diz que a menina é uma lendária princesa perdida e que ela precisa completar três tarefas perigosas a fim de se tornar imortal.", director: "Guillermo del Toro", writers: "Guillermo del Toro", isFavorite: false, isWatched: false, rating: 0, genres: ["Fantasia", "Suspense", "Drama"]),
                
                Movie(poster: "predestinado", title: "O Predestinado", year: "2015", synopsis: "Um agente precisa viajar no tempo para impedir a ação de um criminoso responsável por um ataque que mata milhares de pessoas.", director: "Michael Spierig, Peter Spierig", writers: "Michael Spierig, Peter Spierig, Robert A Heinlein (autor da obra original)", isFavorite: false, isWatched: false, rating: 0, genres: ["Ficção Científica", "Suspense", "Ação"]),
                
                Movie(poster: "gigantes", title: "Gigantes de Aço", year: "2011", synopsis: "Em um futuro próximo, as máquinas substituem os homens no ringue. As lutas de boxe acontecem entre robôs de alta tecnologia. Charlie, um ex-lutador frustrado, decide se juntar ao filho para construir um competidor imbatível.", director: "Shawn Levy", writers: "Dan Gilroy, Les Bohem, Jeremy Leven, John Gatins, Richard Matheson (autor da obra original)", isFavorite: false, isWatched: false, rating: 0, genres: ["Ação", "Drama", "Ficção Científica", "Esporte"]),
                
                Movie(poster: "vastidao", title: "A Vastidão da Noite", year: "2019", synopsis: "Duas crianças procuram a fonte de uma misteriosa frequência que surgiu em sua cidade.", director: "Andrew Patterson", writers: "James Montague, Craig W. Sanger", isFavorite: false, isWatched: false, rating: 0, genres: ["Drama", "Ficção Científica", "Suspense"]),
                
                Movie(poster: "parasita", title: "Parasita", year: "2019", synopsis: "Toda a família de Ki-taek está desempregada, vivendo em um porão sujo e apertado. Por obra do acaso, ele começa a dar aulas de inglês para uma garota de família rica. Fascinados com a vida luxuosa destas pessoas, pai, mãe e filhos bolam um plano para se infiltrar também na abastada família, um a um. No entanto, os segredos e mentiras necessários à ascensão social cobram o seu preço.", director: "Bong Joon-ho", writers: "Bong Joon-ho, Jin Won Han", isFavorite: false, isWatched: false, rating: 0, genres: ["Comédia", "Suspense", "Drama"]),
                
                Movie(poster: "passivonas", title: "Passivonas", year: "2023", synopsis: "Duas alunas não populares do último ano do ensino médio criam um clube da luta para tentar impressionar e conquistar líderes de torcida.", director: "Emma Seligman", writers: "Emma Seligman, Rachel Sennott", isFavorite: false, isWatched: false, rating: 0, genres: ["Comédia", "Sátira"]),
                
                Movie(poster: "amnesia", title: "Amnésia (Memento)", year: "2001", synopsis: "Leonard está caçando o homem que estuprou e matou sua esposa. Ele tem dificuldades em encontrar o assassino pois sofre de uma forma intratável de perda de memória. Mesmo que ele possa lembrar detalhes da vida antes do acidente, Leonard não consegue lembrar o que aconteceu quinze minutos atrás, onde está indo ou a razão.", director: "Christopher Nolan", writers: "Christopher Nolan, Jonathan Nolan", isFavorite: false, isWatched: false, rating: 0, genres: ["Suspense", "Thriller"]),
                
                Movie(poster: "tenenbaums", title: "Os Excêntricos Tenenbaums", year: "2002", synopsis: "Royal e sua esposa Etheline tiveram três filhos muito diferentes entre si, mas igualmente bem-sucedidos. Quando Etheline resolve se casar com outro, o irresponsável e excêntrico Royal resolve lutar por seu amor reunindo toda a família.", director: "Wes Anderson", writers: "Wes Anderson, Owen Wilson", isFavorite: false, isWatched: false, rating: 0, genres: ["Comédia", "Drama"]),
                
                Movie(poster: "land", title: "La La Land", year: "2017", synopsis: "O pianista Sebastian conhece a atriz Mia, e os dois se apaixonam perdidamente. Em busca de oportunidades para suas carreiras na competitiva Los Angeles, os jovens tentam fazer o relacionamento amoroso dar certo, enquanto perseguem fama e sucesso.", director: "Damien Chazelle", writers: "Damien Chazelle", isFavorite: false, isWatched: false, rating: 0, genres: ["Musical", "Romance", "Comédia", "Drama"]),
                
                Movie(poster: "kiki", title: "Os Serviços de Entrega da Kiki", year: "1990", synopsis: "Por ordem de sua mãe, Kiki parte para um aprendizado de um ano, acompanhada por seu gato preto. A um comando de sua vassoura mágica, ela vai parar na charmosa cidadezinha de Moreoastal. Infelizmente, os hotéis locais não aceitam bruxas e a polícia a flagra fazendo algumas travessuras.", director: "Hayao Miyazaki", writers: "Hayao Miyazaki, Jack Fletcher, John Semper", isFavorite: false, isWatched: false, rating: 0, genres: ["Animação", "Fantasia"]),
                
                Movie(poster: "aquila", title: "O Feitiço de Áquila", year: "1985", synopsis: "O ladrão Gaston escapa da masmorra medieval de Aquila através da latrina. Os soldados estão prestes a matá-lo quando Navarra o salva. Navarra, viajando com seu falcão animado, planeja matar o bispo de Áquila com a ajuda de Gaston.", director: "Richard Donner", writers: "Michael Thomas, Tom Mankiewicz", isFavorite: false, isWatched: false, rating: 0, genres: ["Fantasia", "Aventura", "Drama"]),
                
                Movie(poster: "incriveis", title: "Os Incríveis", year: "2004", synopsis: "Depois do governo banir o uso de superpoderes, o maior herói do planeta, o Sr. Incrível, vive de forma pacata com sua família. Apesar de estar feliz com a vida doméstica, o Sr. Incrível ainda sente falta dos tempos em que viveu como super-herói, e sua grande chance de entrar em ação novamente surge quando um velho inimigo volta a atacar. Só que agora ele precisa contar com a ajuda de toda a família para vencer o vilão.", director: "Brad Bird", writers: "Brad Bird", isFavorite: false, isWatched: false, rating: 0, genres: ["Animação", "Ação", "Aventura"]),
        
    ]
}
