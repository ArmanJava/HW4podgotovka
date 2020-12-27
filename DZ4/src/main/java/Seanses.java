import javax.persistence.*;
import java.util.List;

@Entity
public class Seanses {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "raspisanie")
    private int raspisanie;

    @ManyToMany
    @JoinTable(
            name = "price_seansi",
            joinColumns = @JoinColumn(name = "seansi_id"),
            inverseJoinColumns = @JoinColumn(name = "price_id")
    )
    private List<Price> prices;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getRaspisanie() {
        return raspisanie;
    }

    public void setRaspisanie(int raspisanie) {
        this.raspisanie = raspisanie;
    }

}
