package si.kcclass.deliverycost.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Post {

    @NotNull
    @Column(unique = true)
    private String zipCode;

    @NotNull
    private String name;
    
    public String toString() {
    	return zipCode + " - " + name;
    }
}
