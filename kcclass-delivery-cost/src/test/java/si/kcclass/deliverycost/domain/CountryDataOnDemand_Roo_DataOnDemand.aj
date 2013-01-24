// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package si.kcclass.deliverycost.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;
import si.kcclass.deliverycost.domain.Country;
import si.kcclass.deliverycost.domain.CountryDataOnDemand;

privileged aspect CountryDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CountryDataOnDemand: @Component;
    
    private Random CountryDataOnDemand.rnd = new SecureRandom();
    
    private List<Country> CountryDataOnDemand.data;
    
    public Country CountryDataOnDemand.getNewTransientCountry(int index) {
        Country obj = new Country();
        setCode(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void CountryDataOnDemand.setCode(Country obj, int index) {
        String code = "code_" + index;
        obj.setCode(code);
    }
    
    public void CountryDataOnDemand.setName(Country obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Country CountryDataOnDemand.getSpecificCountry(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Country obj = data.get(index);
        Long id = obj.getId();
        return Country.findCountry(id);
    }
    
    public Country CountryDataOnDemand.getRandomCountry() {
        init();
        Country obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Country.findCountry(id);
    }
    
    public boolean CountryDataOnDemand.modifyCountry(Country obj) {
        return false;
    }
    
    public void CountryDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Country.findCountryEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Country' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Country>();
        for (int i = 0; i < 10; i++) {
            Country obj = getNewTransientCountry(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
