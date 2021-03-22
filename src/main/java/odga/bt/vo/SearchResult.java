package odga.bt.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import odga.bt.domain.Touritems;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SearchResult {
	private List<Touritems> lists;
	private int count;
}
