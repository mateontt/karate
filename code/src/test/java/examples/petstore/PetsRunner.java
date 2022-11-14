package examples.petstore;

import com.intuit.karate.junit5.Karate;

class PetsRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("petstore").relativeTo(getClass());
    }    

}
