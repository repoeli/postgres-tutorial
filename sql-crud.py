from sqlalchemy import (
    create_engine, Column, Integer, String
)
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker


# executing the instructions from the "chinook" database
db = create_engine("postgresql+psycopg2://postgres:postgres@localhost:5432/chinook")
base = declarative_base()


# create a class-based model for the "Programmer" table
class Programmer(base):
    __tablename__ = "Programmer"
    id = Column(Integer, primary_key=True)
    first_name = Column(String)
    last_name = Column(String)
    gender = Column(String)
    nationality = Column(String)
    famous_for = Column(String)


# instead of connecting to the database directly, we will ask for a session
# create a new instance of sessionmaker, then point to our engine (the db)
Session = sessionmaker(db)
# opens an actual session by calling the Session() subclass defined above
session = Session()

# creating the database using declarative_base subclass
base.metadata.create_all(db)


# creating records on our Progammer table
ada_lovelace = Programmer(
    first_name="Ada",
    last_name="Lovelace",
    gender="F",
    nationality="British",
    famous_for="First Programmer"
)

alan_turing = Programmer(
    first_name="Alan",
    last_name="Turing",
    gender="M",
    nationality="British",
    famous_for="Modern Computing"
)

grace_hopper = Programmer(
    first_name="Grace",
    last_name="Hopper",
    gender="F",
    nationality="American",
    famous_for="COBOL language"
)

margaret_hamilton = Programmer(
    first_name="Margaret",
    last_name="Hamilton",
    gender="F",
    nationality="American",
    famous_for="Apollo 11"
)

bill_gates = Programmer(
    first_name="Bill",
    last_name="Gates",
    gender="M",
    nationality="American",
    famous_for="Microsoft"
)

tim_berners_lee = Programmer(
    first_name="Tim",
    last_name="Berners-Lee",
    gender="M",
    nationality="British",
    famous_for="World Wide Web"
)

eli_zeb_wond = Programmer(
    first_name="Eliazer",
    last_name="Zerubabel",
    gender="M",
    nationality="American",
    famous_for="to be honest for Nothing"
)

# add each instance of our programmers to our session
# session.add(ada_lovelace)
# session.add(alan_turing)
# session.add(grace_hopper)
# session.add(margaret_hamilton)
# session.add(bill_gates)
# session.add(tim_berners_lee)
# session.add(eli_zeb_wond)

# commit our session to the database
# session.commit()

# update a record in the Programmer table
# programmer_to_update = session.query(Programmer).filter_by(id=7).first()
# programmer_to_update.famous_for = "I am still for Nothing!"

# updating multiple records in the Programmer table
# programmers_to_update_multiple = session.query(Programmer)
# for programmer in programmers_to_update_multiple:
#     if programmer.gender == "M":
#         programmer.gender = "Male"
#     elif programmer.gender == "F":
#         programmer.gender = "Female"
#     else:
#         print("Gender not defined")
#         programmer.gender = "Prefer not to say"
#     session.add(programmer)


# to delete all records from the Programmer table
# programmers_to_delete_all = session.query(Programmer).all()
# for programmer in programmers_to_delete_all:
#     print(f"Deleting programmer: {programmer.first_name} {programmer.last_name}")
#     session.delete(programmer)
#     session.commit()


# deleting a single record from the Programmer table
fname = input("Enter the first name of the programmer to delete: ")
lname = input("Enter the last name of the programmer to delete: ")

programmer_to_delete = session.query(Programmer).filter_by(first_name=fname, last_name=lname).first()

# defensive programming to check if the programmer exists
if programmer_to_delete is not None:
    print(f"Deleted programmer: {programmer_to_delete.first_name} {programmer_to_delete.last_name}")
    confirmation = input("Are you sure you want to delete this programmer? (yes/no): ")
    if confirmation.lower() == "yes":
        session.delete(programmer_to_delete)
        session.commit()
        print("Programmer deleted successfully.")
    elif confirmation.lower() == "no":
        print("Deletion cancelled.")
    else:
        print("Invalid input. Deletion cancelled.")

else:
    print("Programmer not found")

# query the database to find all Programmers
programmers = session.query(Programmer)
for programmer in programmers:
    print(
        programmer.id,
        programmer.first_name + " " + programmer.last_name,
        programmer.gender,
        programmer.nationality,
        programmer.famous_for,
        sep=" | "
    )