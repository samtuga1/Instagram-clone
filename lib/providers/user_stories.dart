import 'package:flutter/cupertino.dart';

class UserStory {
  final String id;
  final String title;
  final String profileImage;
  final List<String> images;

  UserStory({
    required this.id,
    required this.title,
    required this.profileImage,
    required this.images,
  });
}

class UserStories with ChangeNotifier {
  final List<UserStory> _stories = [
    UserStory(
      id: 'm1',
      title: 'Samuel',
      profileImage:
          'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
      images: [
        'https://ichef.bbci.co.uk/news/976/cpsprodpb/13F00/production/_95146618_bills.jpg',
        'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
        'data:image/jpeg;base64,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'
      ],
    ),
    UserStory(
      id: 'm2',
      title: 'Bentil',
      profileImage:
          'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
      images: [
        'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
        'data:image/jpeg;base64,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'
      ],
    ),
    UserStory(
      id: 'm3',
      title: 'Kelvin',
      profileImage:
          'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
      images: [
        'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
        'data:image/jpeg;base64,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'
      ],
    ),
    UserStory(
      id: 'm4',
      title: 'Adelaide',
      profileImage:
          'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
      images: [
        'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
        'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFRgVFRUZGBgYGhgYGhgYGBgYGBgYGBgZGRgYGBgcIS4lHB4rIRgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGhISHDQhISE0MTQ0NDQxNzE0MTQ0MTQ0NDQ0NDQ1NDQ0NDQ0NDQxNDQ0NDQxNDQxNDQ0NDQ0NDQ0NP/AABEIARMAtwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAADAAECBAUGBwj/xAA+EAACAQIDBQUFBgYBBAMAAAABAgADEQQSIQUxQVFhBiJxgaETMlKRwQdCYnKx0SOCkrLh8BQkg8LxM0Nz/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAECAwT/xAAiEQEBAAICAgEFAQAAAAAAAAAAAQIRITEDElETMkFCYXH/2gAMAwEAAhEDEQA/AOSWnDCnJhYQCefb06ByxrQ5WIpKAWjiTKyFoCENTMEBJ3giyGizwCmTENbGJgXjgxXkELSQk1SEFPS8KEVjlYQppERAHaBdZZJganSIzQXSOqAiKSQSoSiIR2iEKgyRSwoikUASawcmplRNVjlI4aSYwAMsjlk3aQzXhDASUSiPlhdGWEtBiSDQCLJBZFZMmRU0Ahk5SsGhqcKZoiJN0MiUPKRQTA1TLDKZXrLpLGarM8S1ZFljhZWRQ8mpggslaCDgCKDUx5GjlIrQ4EG4iJQmHWNfrE0g5ljNSNucSoLwBhUMthKtIghDTEBTaGvI1sN0EioEIwkAsCxTIELYSuqwyyKfLaTAEgDFeARjB54+fSDvIqDmVqplh4BxLEoREQWSIjiVk1orR5NBCxC0eEZYpF0KYBzDEwLxEobNAtCNGyzTCAkkMlliCxtdDJCAwKCV9pY4Ul5sfdH1PSTW13pYxOKRBdjb9TMavt8/cXzbU/KQpYB6pzud/A8vpLVPZKjeb+Ubxn9Jjll/GY+1a5PvkeS/tJptquPvX8VE0TstI67NQdfGX3x+D6WXybC9o13VFt1Go+XCbNOqrgMjAg8pzeM2cN40Mz6Nd6D3U6cR91h1Eupl0luWPbtrxXgNn41KyZhodzLyMs5ZjpuXYbSLiGKyDrAqMI6iEdJECVnSSpCBZFYVQJK1ECsUkTFAiwgXh2MCxvEKDJLHZYllZSCyQAij2hQ6tQIrOdwF/wBhMLCU2qOar68hw8ugl3bD5ilMcTmbw3D6y5SpgLpwi3U/0xx3d38C0UhhThMKg4y7kEzY7SswUbQbpNN0ErVBaSLYzay6SlVwoZdRNHEC4g2WyTblWDga5w9UfCdG5W5+W+diBOMx4vOn2BXL0VvvW6n+Xd6Wly5m3PHi6Xwsi6wuWRaYdFdxBmGYRsku00CIUCPkkwsbNBkRSTRQIObweWEiJgoLCMNIRhGKyskpkxBgSawMXEa126WHlYfW816Gqn5ecyagtXceB+YE0sG+lhv39PGMrp08c3GrhcKzWsJpHZxEx6lfEqO44A6AX9YTB7bbdUck/iFvpM1udtH/AIsFXoU195gPGKri7Lf1nNY7HGq2VR4sxsoHMzM5q26i7isTQvZXzHoJSxbjJYeu+JKaUhvJJG/Ll+V9ZSxGIL67xznTVjl7b7qjXF1M2OyDdxx+Meqj9pkvy5zQ2DiVpI2a5u17iwAAAG82vL+rH7R0wMZhIUKyuodTcHdCETk6AlZECGIkcsCAkrR8sRECLCKIxTSAARwkigh7SALCSVYUCOwl2mldkg6jqguxAHMmw+cssspbUwwemynx8xul2aVcdhyH9odAQF0swJ3g3HG1/lKwxihLjMG5FbcdxN/OaWIpj/jI6i2ZQ1ug0v8AO8Js/Dq4CkDzF5JlL23cLj0xmxWIdLqpYA20zEgc8o0t8zDU6DDKSQbi5093eSMraNbTWbybPVLhXIHSw9SNJCpgwq6aknqfMkzVymmZhbUKS1Gpsc264AsN+XX6esxaOcnKz2OhvxseA5HynZJRKLl36anqd853EUAlUXFwT5i/IzGOXNdMsOIzsZs6mzhhZRochfNr+Y6m+/WNTwzLfL3VOnBvlcaTp1wo3hZHE0ABe9yPSb92Ppa5cjiaOU2uTfiSTIYpQyE/dGnTQafpD47fCYYXR7jumw1+IkWt6yW3hMZJttbEplKKA8j6kkTQcwSe6tt1h+kLOe2tGkLyTSEqHBiaKSWBC0UKUilRSWEDSKpCAQqQijqI9oDGCYQjSBkAMTrRCgi6Bhb8B7wI9flIbKq2ywmIpkqwABuOJItz0G+ZuEqWIk126TLmOzZFy52ImRi9pIoD1LhL6ADU203CMK5cBLzQromUKVVgu64B1jtejttymyAgAAAefU3nMY7baO2UU21OjWNulpr4l6TWDKjDqL8eFpX9oin3bW5j9LyzFLntY2XinAyuN24neekjtXFAIbb4z4sMLTF2gx1jVPaaZddrmXtn4Z3tZbqCLtmAtz0Ou7lM+b3Z1tHH5T+s3eI5TnJsBY4EdYxnJszGKMY00yVpMARKsYiAS8UgIoEFWNlk1ETCUQivExkRAkxkJJpG8gcTCdMrsvIkftN4TP2phz768NG8OBgg2BNrH1iqYu7BQrN4KSP0lHCV7aS9mHDfyP0M3JJ2ZW3oariqgXKKbAbvPw4SriTWCkhMvUso9Ly2dtKihX7tuJEy9obY9o3du1+hA8+k3tiyAYY1L9/KBw4m3PwkcZUGU8yYyOwvfe28/wC8JTxdS+kz2vQO82nR9nMO2V3t3cypf8QBa3yInN0zbWeqbK2GybLZT3Kjq9e5HuvYFAR+VUBHjOkw9pY5+/rdsjLGIlPZG0VroHGjDRl+E/tyl1p57NO25Zwgoj5I4ETG0BhGYxFpDNAizRSLGKBNG5wjStTaWFmqzA2ESrJkSSiZaCYSFoZ1g7QuitHjCImEYmNw/s3uPdOo6dJawTqd83tj4WnXZ6DgEvRqFOYdAGDL1FvUickgKm3+J0mNsY9pK6xMPRK3a0q1jQXcAJz9TFsvBvKx+sgK2f7jt5geusTDJq+TEfH4tPuiY1TU3mi1PmFToO858/2E6js72NNQipiFKINybmf83FF9T0nXHx1xyzVuwfZY4hxXqr/BQ3VT/wDY4On8gO/nu5zvO3O0Rh8FVe9mdTTTmXcFdPAZm/lmvh6YVQqgBQAAALAAaAAcBPJvtN2x7bECip7lEeRdt58hYDxM76mM4cLd1xmAxb0XzobHcRwYciJ2ezdsJX0Hdf4G3/yn7w9ZxSpFUTd4zhlhMnTHO4vSDBtONwm269PQtnXk+pt0bf8ArNzBbcp1LAnI3Jtx8G3fO05ZYZR3x8mNaLSBaScwc5tpkRRxFAhTlhZWQwntJqpBgYQSsj3MPmmVJ4FhCkzPx21KVL3mu3wrq3+POJLei2TtZImXtHaqICFIZh8gep+kxMftqpUuB3E5A6n8zfQTNQXNp2x8fy45+X4dT2KxNRtoYdwSWztm/KUe/gANbdJ3HabsSzM1bDrmDEs1MGzKTvKX0K9N46yn9lexTd8Q62AXIhPEv71vAC3807TbvaBcFQLkZnYhKaXtmc8WPBBvJ+pE73GWacZlZXjuJ2PVD5PZvn+HKwb5b50XZv7O8RX79Z2pJ8OYlz4p9zz16TM2j2oxjZmOLcltCqPkUX4Ki2svib9ZnLtXEYeojJWqUnAuzF1dWvrquoZd+jXlni13VuW+o9e2b2Nw2H1RMz/G3ebyPDymsuFmF2M7Vvi6d69PKwJBdA3s35Gx1UnfYXHUbp1iWOo1mt2MMfbWIXD4epVfQIjMeeg3DqdAOpnz1VqM7s7m7OSx8Sb2HSeqfbHtcBKeEU6uRUqdEQ9wHxYX/knllrCZt2BjSRds2gB3jUiw0PXUyZEkz84EWg2SEiIhVjB7SqU9Acy/C2vyO8TZwu26b6PdD+LVf6h9bTncsa055YY1vHO4u6pkEXBBB4g3HzEU4ek5U3VmU/hJH6RTn9K/Lf1p8Ouz6yV4MSYnN1EQaweO2ilEXc6nco1Y+XAdY9WuEVnbcov48h5mcViK7VHLubk+g4AdJrHH2Yyy9V/H7bqVLgHIvJTqfFpmR4p3mMnThcre0Zc2dhHqMFQXZiFXxMpgcJ3f2e7FepXSrbuUzcm29huHz/Saxm6lendmdnthMKlN2BcXZyLkZmOiqOOlhOb+0DZrNQOIqXDBqaUqY71szi+a3Ei/pynfpT1DNv4chz855Z9oe1lr4wYclxTw3vBdzVHRWzDqoOXp3uc6Yzd0ji8TcuiZg+QG4dPZ2O9lY8d2+86Xsj2RfEMajKUQ3GXgQbd3mefynP7OpFnUE5leoGYH3gQbXvy1vbjafQmGwy0kCILBRYfvN53Qp4XZyU1CKALcuAlvIF718oA14C3EmKnz5zj/ALUNs/8AHwZpqbPiCaY5hLfxW/pOXxcTlaPKO0e1ji8VVxF+67EJ0pr3U8LgX8WMzCecdVsIxMgSi5jILm/Abup4n6SVtLDQt6LxP084bKALDcIASIgsmRJqsAWWIrDlYypAGKdtTFCLqSeA0H1MUDfBhFaCUyQM8j1s7tHW7ioOJJPloPU+k5+am3Xu9uQUfO5/aZZnfCaxjz53eVKM0eRabZGwiZm08vE7p9DdksAtHC0lA+6GPVm1JP8AvCeLdjtkNiK6Io4gseQ5/K58p9BpTCqFG4C3ympxEUO0G1BhsPUr2DFF7ik2DO2iAngLkXPAXM8QwVes7PUeohdkzsbjXOS5UC3vXb1E6/7YtpKRSwveJs1Uhfi9ylm/Dc1D4qJxmGRAlQrSdRmVVLE9wj3g34jynXxzXJRFQqUJXgWGXfbmfCe8rVzqoHEAt06TwapkDd3Olk47y9vQGe9YCllRPyr87R5Egp0E8G7ebY/5WNcqb06X8KnyOU99/N7+SrPW+3O2P+Lg6jqbOw9nT553uARzyjM38s8DopYACcVO8ZFG87hqZMrJ5dy+Z/8AEfXy6wFSXex3n0HAf7zMkRJ2itAGEkgJPLHAgQZYzmw03nQecmYFtWPQep/x+sByABaKCNC/3jFA6C8khjkRWtPI9bnNqteo/wCa3yUCUpa2h77/AJ3+kqz0zqPNe6UiBcgSRj4ZbuLayo9i+yHZuVKlcjVrIv5QdfUT0Kq0wex1AUaAT4VUHqba+su7YxvsaFWuQT7Om7gDeSqkqB4mwm9co8a7W41q+OqsKyIgqpRU6EhaAzZvy5yx6k24QGGJKLesO/UJZTpY7s7f7/jNw6aqTQzEI7sWJswc91zfgPXUzXooQaanD3yIXI4upvZ25AT0YxKLQR3cjOj56iUydLtmcKConvFrCeI9lMOr4rDLkIJrBw2uUrTu5Uc/dnsO3NpLh6FSu/u00L25kaKo6lrDznLy3mEeT/attb22JTDKbphxduRquAT/AEpl/racZaSNR3Z6jm7uzO55sxLN5XO6IiclQ3XJ3D1PACEpoQNd51Pj/unlIhbtbgvq3+B+vSHywGCx8slaMYDRjGvIM0CbbpXQ6X4nX57vS0niG0C/EQP39LwVQmBFq1ooMrFA6lt+kiI7GMDPG9bmcebu/wD+jfqf2lUS1ix3qn52/uMrLPVOo817JofZY74PJk/uEC0Ns82N+RU/IianaPons5R/hZzvZifADQCYP2p43JhBTD5WquBYXuyJYuOg1W/y4zoOyrXwyHq39xnDfaXWd8VRpKiuEUML2uzklnTXcuXJfn5TpjN5J+Hn7BAzgV2bKERdGAdBvH5VtoJqtkBcrWY5VCoTmu40BToolTDU3ZkIop36rOugAOXem/RBrLrhyjH2a997BgNQ3wJyH+Z6JEre7BJ/11EZ84Sm7gcELKQV8dZqfa9tXu0sIp1c+2qD8CG1NT4tc/8AbkPs3pK2LruUCezpgBeC3azEnwT1nE9oNqHFYmriDudiKfSmvdQW4d0Anqxnm8n3LGaqyLmwvx3Acyd0NlkEF2vwXQePE/T5zAlTSwt/pPEyVo8izShEyDNIM0gXkEi0hmg3Y8JBqnDjxgTDZn/KCfM6D6xGDwhuHPM2+X/uSMBGPBsTFA6QtEDBEyaGeR63O4g9+p+Z/wC4yuksnUufiLH5kyrSM9U6jy3tNxpJYT73hJMNDGwW8joZR9A9gsRnw1vhY+uv1nmPafE06uMxFTO41cKRvLp3FVeS2UevOdR9lu0T7OspPuLn+S6/pONrNVK1WYISxVHI4MPgnbxzus1UoJSDJ33FkYmwPdfgi9OZ/wBFykqfwx7Rl3ltDZDwK9TYa+EZ/aA1CUQZURGsBZAbWI13mWXVwdaK3Snqtha1vfbmdZ30aXdnYk0tn4yoGJavUp4YMb3KlWd/MozTlFmljMZ/01GiDuqVqrj8TEU0v1yox8HEzKc8mX3VYnVewsN50Hjz8t8gFtYDl+0hTbMS3Ad0fU/TyjO/e47uXWZBHYwTk84zP4wbVOkBMTBsOsZ6kA1aARzKxewjM5PODdtJFaGB9wdST6yREhgT3F8/1MKZURiiMUDaMes+VGbkCfPhFeAx5/hvbhb+4Ty49x68uJWOG1AEr0PqYSkb3MDh958Z6nlWgJHCaP6SYggbPCPSOw7IuCxjMSGFN1uPhIYG3XUTmf4dgCWHf15BOf5ps9kVIw2PcG7KlJVTh/EcZmP9IHzmUjP3LIp1ZlvbvEb7z0eKcJTIEOaztcvoCDqnxt1lquUGe1VrAAA63caXB6C0DhS5VO4pBcsNB3yN6/ljY+qcj3RRme1/gOpKr5CdLdTZpk308Tf5yNV7AKN7aD9/rHcweG7xLnwX6n6TyKsqoUADhpBuY7NBM0gZjBFpJjIOYEWaBZ4mgmhSLwFRoRjAOZBo7NbueZ/WWDKezG7pHX6CWi0s6Q7RSJMUDbEjjP8A4n/Kf0iinlnceq9Vg0/dgKPvNFFPU8y5AVd4iihHUdn3Io4wX0NPDXHO1en+5+cznqG++KKd8PtZyWaDEDQnQ6anTwgMVUJNr6am3Ww1iijL7SdqOI90w1HRB4D9IopwaM8FFFAYwbxRQK5kDFFIoLQLxRSUW9m7m8ZbMUU1OkNFFFA//9k='
      ],
    ),
  ];
  List<UserStory> get stories {
    return [..._stories];
  }

  void moveToNextStory() {
    var currentImage = 0;
    _stories[currentImage++];
    notifyListeners();
  }

  UserStory findById(id) {
    return _stories.firstWhere((story) => id == story.id);
  }
}
