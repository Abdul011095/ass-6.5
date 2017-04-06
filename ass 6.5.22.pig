1.td = load '/user/acadgild/TravelData.txt' using PigStorage('\t') as (CityPair:chararray, fromLocation:chararray, toLocation:chararray, Producttype:int, Adults:int, Seniors:int, Children:int, Youth:int, Infant:int, DateofTravel:chararray, TimeofTravel:chararray, DateofReturn:chararray, TimeofReturn:int, Price:float, Hotel:chararray);



//it will load the dataset into the pig storage.

2.gs = group td by fromLocation;


// will group the data records based on source place.

3.cs = foreach gsgenerate group, COUNT(td.fromLocation)as c;



// will iterate through the records to count the number of sources from where the people are coming from. 

4.orderby = order cs by c DESC; 



//line 4 will order the count_source in descending order.

5.ts = limit orderby 20;


// will generate the top 20 source locations.


6.dump ts;

//line 6 will display the result
