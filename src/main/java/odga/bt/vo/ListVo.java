package odga.bt.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import odga.bt.domain.ListResult;
import odga.bt.domain.Touritems;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ListVo {
	private Touritems touritems;
	private ListResult listResult;
}
