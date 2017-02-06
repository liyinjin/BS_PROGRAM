/**
 * 
 */
         function pagerFilter(data){
			if (typeof data.length == 'number' && typeof data.splice == 'function'){	// is array
				data = {
					total: data.length,
					rows: data
				}
			}
			var dg = $(this);
			var opts = dg.datagrid('options');
			var pager = dg.datagrid('getPager');
			pager.pagination({
				onSelectPage:function(pageNum, pageSize){
					opts.pageNumber = pageNum;
					opts.pageSize = pageSize;
					pager.pagination('refresh',{
						pageNumber:pageNum,
						pageSize:pageSize
					});
					dg.datagrid('loadData',data);
				}
			});
			if (!data.originalRows){
				data.originalRows = (data.rows);
			}
			var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
			var end = start + parseInt(opts.pageSize);
			data.rows = (data.originalRows.slice(start, end));
			return data;
		}
         /**
          * 日历格式
          */
         	function formatCalendar(date){
         		var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
         		var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"	+ (date.getMonth() + 1);
         		return date.getFullYear() + '-' + month + '-' + day;
         	}
         	
         	
         	