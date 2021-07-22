from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, String
from flask_cors import CORS, cross_origin
import json
import re
import os

app = Flask(__name__)
CORS(app)

basedir = os.path.abspath(os.path.dirname(__file__))
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'students.db')

db = SQLAlchemy(app)

# class numbers
tenth = [122, 131, 111, 121, 112]
eleventh = [222, 221, 232, 211, 212, 231]
twelfth = [331, 332, 322, 311, 321]

# access
access_username = 'This data is privte.'
access_password = 'This data is privte.'


# Routes
@app.route('/')
def main():
    return jsonify(message='This is the Ghods high school API')


@app.route('/register')
@cross_origin()
def register():
    national_code = request.args.get('national_code')
    student = Student.query.filter_by(national_code=national_code).first()
    if student:
        if int(student.class_number) in twelfth:
            print('?')
            return jsonify(message='false'), 404
        else:
            if int(student.class_number) in twelfth:
                need_to_pause = 'False'
                student.phone = ' '
                student.postal_code = ' '
                student.address = ' '
                db.session.commit()
            else:
                if student.postal_code != '':
                    need_to_pause = 'False'
                else:
                    need_to_pause = 'True'
            return jsonify(register='true', password=student.password, need_to_pause=need_to_pause), 302
    else:
        return jsonify(register='false'), 404


@app.route('/update_student', methods=['PUT'])
@cross_origin()
def update_student():
    username = request.args.get('access_username')
    password = request.args.get('access_pass')
    if username == access_username and password == access_password:
        national_code = request.args.get('national_code')
        student = Student.query.filter_by(national_code=national_code).first()
        if student:
            student.phone = request.args.get('phone')
            student.postal_code = request.args.get('postal_code')
            student.address = request.args.get('address')
            db.session.commit()
            return jsonify(messgae='Student data successfully updated'), 200
        else:
            return jsonify(message='That student does not exist'), 404
    else:
        return jsonify('You don\'t have access'), 401


@app.route('/get_statistics', methods=['GET'])
@cross_origin()
def get_statistics():
    students = Student.query.all()

    who_received10 = 0
    who_received11 = 0
    who_received12 = 0
    all10 = 0
    all11 = 0
    all12 = 0
    who_did_not_receive = 0
    everyone = len(students)
    for i in range(len(students)):
        if students[i].phone != '':
            if int(students[i].class_number) in tenth:
                all10 += 1
                who_received10 += 1
            if int(students[i].class_number) in eleventh:
                all11 += 1
                who_received11 += 1
            if int(students[i].class_number) in twelfth:
                all12 += 1
                who_received12 += 1
        else:
            who_did_not_receive += 1
            if int(students[i].class_number) in tenth:
                all10 += 1
            if int(students[i].class_number) in eleventh:
                all11 += 1
            if int(students[i].class_number) in twelfth:
                all12 += 1

    who_received = who_received10 + who_received11 + who_received12

    percentage10 = who_received10 / everyone
    percentage11 = who_received11 / everyone
    percentage12 = who_received12 / everyone

    percentage10 = int(re.findall(r"^0.(\d\d)\d*$", str(percentage10))[0]) if percentage10 != 0.0 else 0
    percentage11 = int(re.findall(r"^0.(\d\d)\d*$", str(percentage11))[0]) if percentage11 != 0.0 else 0
    percentage12 = int(re.findall(r"^0.(\d\d)\d*$", str(percentage12))[0]) if percentage12 != 0.0 else 0
    another_percentage = 100 - (percentage10 + percentage11 + percentage12)

    return jsonify(who_received=who_received, who_did_not_receive=who_did_not_receive, all10=all10, all11=all11,
                   all12=all12, who_received10=who_received10, who_received11=who_received11,
                   who_received12=who_received12, percentage10=percentage10, percentage11=percentage11,
                   percentage12=percentage12, did_not_receive=another_percentage)


@app.route('/get_students_info', methods=['GET'])
@cross_origin(0)
def get_students_info():
    mode = request.args.get('mode')
    username = request.args.get('access_username')
    password = request.args.get('access_pass')
    students = Student.query.all()
    if username == access_username and password == access_password:
        if mode == 'who_did':
            who_did = []
            for i in range(len(students)):
                if int(students[i].class_number) not in twelfth:
                    if students[i].phone != '':
                        who_did.append({
                            "id": students[i].id,
                            "name": students[i].name,
                            "national_code": students[i].national_code,
                            "class_number": students[i].class_number,
                            "phone": students[i].phone,
                            "postal_code": students[i].postal_code,
                            "address": students[i].address
                        })
            return jsonify(who_did=who_did)
        elif mode == 'who_did_not':
            who_did_not = []
            who_did_not_name_all = ''
            who_did_not_name10 = ''
            who_did_not_name11 = ''
            who_did_not_name12 = ''
            for i in range(len(students)):
                if students[i].phone == '':
                    if int(students[i].class_number) in tenth:
                        who_did_not_name10 = who_did_not_name10 + students[i].name + '\n'
                    if int(students[i].class_number) in tenth:
                        who_did_not_name11 = who_did_not_name11 + students[i].name + '\n'
                    if int(students[i].class_number) in tenth:
                        who_did_not_name12 = who_did_not_name12 + students[i].name + '\n'
                    who_did_not_name_all = who_did_not_name_all + students[i].name + '\n'
                    who_did_not.append({
                        "id": students[i].id,
                        "name": students[i].name,
                        "national_code": students[i].national_code,
                        "class_number": students[i].class_number,
                    })
            return jsonify(who_did_not=who_did_not, who_did_not_name_all=who_did_not_name_all,
                           who_did_not_name10=who_did_not_name10, who_did_not_name11=who_did_not_name11,
                           who_did_not_name12=who_did_not_name12)
        else:
            return jsonify(message='not found'), 404
    else:
        return jsonify('You don\'t have access'), 401


# Database Functions
@app.cli.command('db_create')
def db_create():
    db.create_all()
    print('Database created!')


@app.cli.command('db_drop')
def db_drop():
    db.drop_all()
    print('Database dropped!')


@app.cli.command('db_seed')
def db_seed():
    data_file = open(os.path.join(basedir, 'students.json'), 'r').read()
    students_data = json.loads(data_file)
    for i in range(len(students_data['data'])):
        student = Student(national_code=students_data['data'][i]['NC'],
                          name=students_data['data'][i]['N'],
                          class_number=students_data['data'][i]['CN'],
                          password=students_data['data'][i]['PC'],
                          phone='',
                          postal_code='',
                          address='')
        db.session.add(student)
    db.session.commit()
    print('Database seeded!')


# Database models
class Student(db.Model):
    __tablename__ = 'students'
    id = Column(Integer, primary_key=True)
    national_code = Column(String)
    name = Column(String)
    class_number = Column(String)
    password = Column(String)
    phone = Column(String)
    postal_code = Column(String)
    address = Column(String)


if __name__ == '__main__':
    app.run()
