# A Simple Follower

This code shows how a simple follower can be implemented.It uses Vectors to calculate Acceleration,Velocity and Direction.

### Formulae
 
 We know that:        
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; **Force** = Mass * Acceleration   
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; Let **Mass** = 1, then     
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; **Force** = Acceleration &mdash; (1)  

### Vector:
&nbsp;&nbsp; A **Vector** is an entity that has both magnitude and direction.Basically, it is a 2 * 1 (or in case of 3D 3 * 1) sized array.  
storing X,Y(and Z) values.Difference between two vectors gives us the direction of path.
    
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; Vector v = new Vector(5,4) -> [5,4].     
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; Vector v2 = new Vector(2,3) -> [2,3].    

#### Vector Addition
&nbsp;&nbsp; &nbsp; v.add(v2) :   
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; v = v + v2 ([5+2,4+3], thus v = [7,7]).  

#### Vector Subtraction
&nbsp;&nbsp; &nbsp; v.sub(v2) :   
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; v = v - v2 ([5-2,4-3], thus v = [3,1]).  

#### Vector Magnitude  
&nbsp;&nbsp; &nbsp; value = v.mag() :   
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; value = sqrt(v.x*v.x + v.y*v.y) (i.e sqrt(25+16) -> sqrt(41) -> 6.4031).     


### Working:
1. We calculate the difference between Location vector of Object(green cirlce) and destination.   
2. In this step the difference vector is normalized (magnitude of vector is compressed to 1).    
3. This normalized vector is then scaled by multiplying it with some scalar.    
4. Then scaled vector is set as new Acceleration vector.   
5. This Acceleration vector is add into vector representing velocity of object.  
6. At last velocity object is added to Location vector of the object and then we draw the object at new location.  

                
