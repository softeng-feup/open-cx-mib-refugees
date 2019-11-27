class RankingAlgorithm {

  List allItems = [
    {
      'name': 'Talk 1',
      'title': 'The title of talk 1',
      'speaker': 'Jose Dias',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'category': '1',
      'date': '17/11/2019',
      'start_hour': '09:00',
      'end_hour': '11:00',
      'rank': '97%',
      'selected': false
    },
    {
      'name': 'Talk 2',
      'title': 'The title of talk 2',
      'speaker': 'Joao Pereira',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'category': '2',
      'date': '17/11/2019',
      'start_hour': '12:00',
      'end_hour': '13:00',
      'rank': '93%',
      'selected': false
    },
    {
      'name': 'Talk 3',
      'title': 'The title of talk 3',
      'speaker': 'Maria Ribeiro',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'category': '3',
      'date': '17/11/2019',
      'start_hour': '16:00',
      'end_hour': '18:00',
      'rank': '93%',
      'selected': false
    },
    {
      'name': 'Talk 4',
      'title': 'The title of talk 4',
      'speaker': 'Patricia Rocha',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'category': '4',
      'date': '18/11/2019',
      'start_hour': '08:00',
      'end_hour': '09:00',
      'rank': '86%',
      'selected': false
    },
    {
      'name': 'Talk 5',
      'title': 'The title of talk 5',
      'speaker': 'Ines Vilarinho',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'category': '5',
      'date': '18/11/2019',
      'start_hour': '09:00',
      'end_hour': '11:00',
      'rank': '86%',
      'rank': '85%',
      'selected': false
    },
    {
      'name': 'Talk 6',
      'title': 'The title of talk 6',
      'speaker': 'Joao Afonso',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'category': '6',
      'date': '18/11/2019',
      'start_hour': '14:00',
      'end_hour': '17:00',
      'rank': '81%',
      'selected': false
    },
    {
      'name': 'Talk 7',
      'title': 'The title of talk 7',
      'speaker': 'Jose Dias',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'category': '7',
      'date': '18/11/2019',
      'start_hour': '10:00',
      'end_hour': '11:00',
      'rank': '75%',
      'selected': false
    },
    {
      'name': 'Talk 8',
      'title': 'The title of talk 8',
      'speaker': 'Ines Vilarinho',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'category': '8',
      'date': '19/11/2019',
      'start_hour': '14:00',
      'end_hour': '16:00',
      'rank': '75%',
      'selected': false
    },
    {
      'name': 'Talk 9',
      'title': 'The title of talk 9',
      'speaker': 'Quim Barreiros',
      'abstract': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu pellentesque enim. Duis sollicitudin nec nibh non pretium. Ut pharetra porta est, sed pulvinar leo lobortis vel. Morbi vel varius odio. Maecenas tristique quam sit amet orci auctor tristique. Ut justo nisl, porttitor ut massa in, iaculis tincidunt velit. ',
      'category': '9',
      'date': '19/11/2019',
      'start_hour': '17:00',
      'end_hour': '18:00',
      'rank': '70%',
      'selected': false
    }
  ];

  //preference of each lecture category
  List<int> index_list_1 = [];
  List<int> index_list_2 = [];
  List<int> index_list_3 = [];
  List<int> index_list_4 = [];
  List<int> index_list_5 = [];

  void rank() {
    List<int> survey_answers= [0,2,3,0,3,3,4,0,3,0,2];
    for (int i = 0; i < survey_answers.length; i++) {
      if (survey_answers[i] == 0) {
        index_list_1.add(i+1);
      }
      else if (survey_answers[i] == 1) {
        index_list_2.add(i+1);
      }
      else if (survey_answers[i] == 2) {
        index_list_3.add(i+1);
      }
      else if (survey_answers[i] == 3) {
        index_list_4.add(i+1);
      }
      else {
        index_list_5.add(i+1);
      }
    }

    List<String> rank_lectures=[];
    /*
    for i in db:
    if db.get(i).get('Category')==12:
    rank_lectures.append("n/d")
    for a in range(0, len(index_list_1)):
    if db.get(i).get('Category')==index_list_1[a]:
    rank_lectures.append(0)
    for b in range(0, len(index_list_2)):
    if db.get(i).get('Category')==index_list_2[b]:
    rank_lectures.append(0.25)
    for c in range(0, len(index_list_3)):
    if db.get(i).get('Category')==index_list_3[c]:
    rank_lectures.append(0.50)
    for d in range(0, len(index_list_4)):
    if db.get(i).get('Category')==index_list_4[d]:
    rank_lectures.append(0.75)
    for e in range(0, len(index_list_5)):
    if db.get(i).get('Category')==index_list_5[e]:
    rank_lectures.append(1) */
    }


}