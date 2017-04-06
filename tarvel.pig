1.td = load '/user/acadgild/TravelData.txt' using PigStorage('\t') as (CityPair:chararray, fromLocation:chararray, toLocation:chararray, Producttype:int, Adults:int, Seniors:int, Children:int, Youth:int, Infant:int, DateofTravel:chararray, TimeofTravel:chararray, DateofReturn:chararray, TimeofReturn:int, Price:float, Hotel:chararray);



// the above statement will load the data set into the pig storage.


2.gd = group td by toLocation;



//the above  statement will group the data by the destination place.

3. cd = foreach gd generate group, COUNT(td.toLocation)as c;



//the above statemnt will iterate the records having to find the count value of destination place.

4.orderby = order cd by c DESC;



//the above will order the count_destination based on the count value by descending.

5.td = limit orderby 20;



//the above statement will find the records having top 20 records of destination travelled.

6.dump td;

//the above statement will display the result.
