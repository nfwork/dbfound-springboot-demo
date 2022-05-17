import com.nfwork.dbfound.model.tools.ModelTool;
import com.nfwork.dbfound.springboot.demo.App;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest(classes = App.class)
@RunWith(SpringRunner.class)
public class ModelGenerate {

    @org.junit.Test
    public void test(){
        ModelTool.generateModel("","dbfound","sys_user","user_id");
    }
}
