package odga.bt.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import odga.bt.domain.Planner;
import odga.bt.domain.S_Planner;
import odga.bt.domain.Touritems;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MyPlanner {
	private long m_id;
	private long p_id;
	private List<Planner> planner;
	private List<Touritems> p_img;
}
