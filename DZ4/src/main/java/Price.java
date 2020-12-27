import javax.persistence.*;
import java.util.List;


@Entity
public class Price {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "ticket_price")
    private int price;

    @ManyToMany
    @JoinTable(
            name = "price_seansi",
            joinColumns = @JoinColumn(name = "seansi_id"),
            inverseJoinColumns = @JoinColumn(name = "price_id")
    )
    private List<Seanses> prices;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}

