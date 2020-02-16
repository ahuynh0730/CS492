import 'package:flutter/material.dart';



class ResumeScreen extends StatelessWidget {

  final name = 'Anthony Huynh';
  final link = 'github.com/ahuynh0730';
  final email = 'ahuynh0730@gmail.com';
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisCount: 1,
        childAspectRatio: 4,
        children: <Widget>[
          Container(
            child: ResumeHeader(name: name, email: email, link: link),
          ),
          Container(
            child: JobPosition(
              jobTitle: 'Software Engineer Intern',
              companyName: 'Google',
              dates: '06/2018-current',
              location: 'St. Louis, MO',
              description: 'This is what I did at this position',
            ),
          ),
          Container(
            child: JobPosition(
              jobTitle: 'Software Engineer Intern',
              companyName: 'Apple',
              dates: '06/2018-current',
              location: 'St. Louis, MO',
              description: 'This is what I did at this position',
            ),
          ),
          Container(
            child: JobPosition(
              jobTitle: 'Software Engineer Intern',
              companyName: 'Charter',
              dates: '06/2018-current',
              location: 'St. Louis, MO',
              description: 'This is what I did at this position',
            ),
          ),
          Container(
            child: JobPosition(
              jobTitle: 'Software Engineer Intern',
              companyName: 'Ameren',
              dates: '06/2018-current',
              location: 'St. Louis, MO',
              description: 'This is what I did at this position',
            ),
          ),
          Container(
            child: JobPosition(
              jobTitle: 'Student',
              companyName: 'OSU',
              dates: '06/2018-current',
              location: 'St. Louis, MO',
              description: 'This is what I did at this position',
            ),
          ),
        ],
      ),
    );
  }
}

class ResumeHeader extends StatelessWidget {

  final name;
  final email;
  final link;

  const ResumeHeader({Key key, this.name, this.email, this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      alignment: Alignment.center,
      child: Column(
        children: <Widget> [
          Text(name, style: TextStyle(fontSize: 30),),
          Text(email, style: TextStyle(fontSize: 20),),
          Text(link, style: TextStyle(fontSize: 20),)
        ],
      )
    );
  }
}

class JobPosition extends StatelessWidget {

  final jobTitle;
  final companyName;
  final dates;
  final location;
  final description;

  const JobPosition({Key key, this.jobTitle, this.companyName, this.dates, this.location, this.description}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Text(jobTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(companyName),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(dates),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(location),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(description),
          ),
        ],
      ),
    );
  }
}