from sqlalchemy import (
    create_engine, Column, Integer, String
)
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker


# executing the instructions from the "chinook" database
db = create_engine("postgresql+psycopg2://postgres:postgres@localhost:5432/chinook")
base = declarative_base()


# create a class-based model for the "Programmer" table
class Country(base):
    __tablename__ = "Country"
    id = Column(Integer, primary_key=True)
    country_name = Column(String)
    capital_city = Column(String)
    population = Column(Integer)
    national_dish = Column(String)
    famous_for = Column(String)


# instead of connecting to the database directly, we will ask for a session
# create a new instance of sessionmaker, then point to our engine (the db)
Session = sessionmaker(db)
# opens an actual session by calling the Session() subclass defined above
session = Session()

# creating the database using declarative_base subclass
base.metadata.create_all(db)

# creating records on our Progammer table
uk= Country(
    country_name="United Kingdom",
    capital_city="London",
    population=67886011,
    national_dish="British food",
    famous_for="its rich scientific and technological discovery and innovation"
)

us = Country(
    country_name="United States",
    capital_city="Washington DC",
    population=331002651,
    national_dish="Hamburger",
    famous_for="its diverse culture and technology innovation"
)

fr = Country(
    country_name="France",
    capital_city="Paris",
    population=67886011,
    national_dish="Croissant",
    famous_for="its art, fashion, and cuisine"
)

gr = Country(
    country_name="Germany",
    capital_city="Berlin",
    population=83783942,
    national_dish="Sauerbraten",
    famous_for="its engineering and automotive industry"
)

it = Country(
    country_name="Italy",
    capital_city="Rome",
    population=60317116,
    national_dish="Pizza",
    famous_for="its rich history and culture"
)

et = Country(
    country_name="Estonia",
    capital_city="Tallinn",
    population=13376000,
    national_dish="Kohuke",
    famous_for="its digital society and e-governance initiatives"
)

eth = Country(
    country_name="Ethiopia",
    capital_city="Addis Ababa",
    population=115000000,
    national_dish="enjera",
    famous_for="for its rich history and diverse culture"
)

ch = Country(
    country_name="China",
    capital_city="Beijing",
    population=1439323776,
    national_dish="Peking Duck",
    famous_for="Great Wall of China, its rich history and recent technological advancements"
)


# add each instance of our countries to our session
# session.add(uk)
# session.add(us)
# session.add(fr)
# session.add(gr)
# session.add(it)
# session.add(et)
# session.add(ch)
# session.add(eth)

# commit our session to the database
# session.commit()

# update a record in the Country table
# country_to_update = session.query(Country).filter_by(id=7).first()
# country_to_update.famous_for = "I am still for Nothing!"

# updating multiple records in the Country table
# countries_to_update_multiple = session.query(Country)
# for country in countries_to_update_multiple:
#     if country.country_name == "United Kingdom":
#         country.famous_for = " its rich scientific and technological discovery and innovation!"
#     elif country.country_name == "United States":
#         country.famous_for = " its diverse culture and technology innovation"
#     else:
#         print("Country not defined")
#         country.famous_for = "Prefer not to say"
#     session.add(country)


# to delete all records from the Country table
# countries_to_delete_all = session.query(Country).all()
# for country in countries_to_delete_all:
#     print(f"Deleting country: {country.country_name}")
#     session.delete(country)           
#     session.commit()


# deleting a single record from the Country table   
country = input("Enter the country name to delete: ")
city = input("Enter the capital city of the country to delete: ")

country_to_delete = session.query(Country).filter_by(country_name=country, capital_city=city).first()

# defensive programming to check if the country exists
if country_to_delete is not None:
    print(f"Deleted country: {country_to_delete.country_name}")
    confirmation = input("Are you sure you want to delete this country? (yes/no): ")
    if confirmation.lower() == "yes":
        session.delete(country_to_delete)
        session.commit()
        print("Country deleted successfully.")
    elif confirmation.lower() == "no":
        print("Deletion cancelled.")
    else:
        print("Invalid input. Deletion cancelled.")

else:
    print("Country not found")

# query the database to find all countries
countries = session.query(Country)
for country in countries:
    print(
        country.id,
        country.country_name,
        country.capital_city,
        country.population,
        country.national_dish,
        country.famous_for,
        sep=" | "
    )