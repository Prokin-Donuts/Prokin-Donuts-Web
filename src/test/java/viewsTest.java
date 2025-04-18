import org.junit.jupiter.api.Test;
import org.springframework.web.bind.annotation.GetMapping;
public class viewsTest {
    @Test
    @GetMapping("/home/login")
    public void login(){}
    @Test
    @GetMapping("/home/signup")
    public void signup(){}

    @Test
    @GetMapping("/home/findId")
    public void findId(){}

    @Test
    @GetMapping("/home/findPassword")
    public void findPassword(){}

    @Test
    @GetMapping("/fm/order")
    public void Forder(){}

    @Test
    @GetMapping("/wm/outbound")
    public void Woutbound(){}

    @Test
    @GetMapping("/wm/inbound/status")
    public void Wstatus(){}

    @Test
    @GetMapping("/wm/inbound/approval")
    public void Wapproval(){}

    @Test
    @GetMapping("/wm/warehouse")
    public void Wwarehouse(){}

    @Test
    @GetMapping("/wm/inbound/request")
    public void Wrequest(){}

    @Test
    @GetMapping("/wm/member")
    public void Wmember(){}

    @Test
    @GetMapping("/wm/Dashboard")
    public void WDashboard(){}

    @Test
    @GetMapping("/qh/Dashboard")
    public void QDashboard(){}

    @Test
    @GetMapping("/qh/inbound/request")
    public void QIrequest(){}

    @Test
    @GetMapping("/qh/inbound/status")
    public void QIstatus(){}

    @Test
    @GetMapping("/qh/member/list")
    public void QMlist(){}

    @Test
    @GetMapping("/qh/member/request")
    public void QMrequest(){}

    @Test
    @GetMapping("/qh/franchise")
    public void Qfranchise(){}

    @Test
    @GetMapping("/qh/inventory")
    public void Qinventory(){}

    @Test
    @GetMapping("/qh/outbound")
    public void Qoutbound(){}

    @Test
    @GetMapping("/qh/product")
    public void Qproduct(){}

    @Test
    @GetMapping("/qh/warehouse")
    public void Qwarehouse(){}


}
