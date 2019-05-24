package com.mbyte.easy.util;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import com.mbyte.easy.admin.entity.Zbj;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.HSSFColor;

/**
 * 导出Excel公共方法
 *
 * @author 刘雪奇
 * @version 1.0
 */
public class ExportExcel {

    HSSFWorkbook workbook = new HSSFWorkbook();// 创建工作簿对象 中有多个sheet
    //显示的导出表的标题
    private String title;
    //导出表的列名
    private String[] rowName;

    private List<List<Object[]>> list = new ArrayList<List<Object[]>>();

    private List<Object[]> countList = new ArrayList<>();

    private String[] categoryName;


    //构造方法，传入要导出的数据
    public ExportExcel(String title, String[] rowName, List<List<Object[]>> list, String[] categoryName, List<Object[]> countList) {
        this.list = list;
        this.rowName = rowName;
        this.title = title;
        this.categoryName = categoryName;
        this.countList = countList;
    }


    public ExportExcel(String title, String[] rowName) {
        this.rowName = rowName;
        this.title = title;
    }



    /**
     * 导出猪八戒指定信息列表
     * @param
     * @throws Exception
     */
    public void exportPersonInfo(String sheetTitle,List<Zbj> countList) throws Exception {
        try {
            HSSFSheet sheet = workbook.createSheet(sheetTitle);// 创建工作表
            sheet.setColumnWidth(1, 4000);
            sheet.setColumnWidth(2, 8000);
            sheet.setColumnWidth(3, 4000);
            sheet.setColumnWidth(4, 12000);
            sheet.setColumnWidth(5, 4000);
            sheet.setColumnWidth(6, 4000);

            HSSFCellStyle style = this.getStyle(workbook);
            HSSFCellStyle numberStyle = this.getNumberStype(workbook);

            HSSFCellStyle headStyle = this.getColumnTopStyle(workbook);

            int columnNum = rowName.length;

            List<Zbj> dataList = countList;

            HSSFRow rowRowName = sheet.createRow(2);                // 在索引2的位置创建行(最顶端的行开始的第二行)
            HSSFRow rowRowName2 = sheet.createRow(3);                // 在索引2的位置创建行(最顶端的行开始的第二行)

            // 将列头设置到sheet的单元格中
            for (int n = 0; n < columnNum; n++) {
                HSSFCell cellRowName = rowRowName.createCell(n);                //创建列头对应个数的单元格
                cellRowName.setCellType(HSSFCell.CELL_TYPE_STRING);
                cellRowName.setCellStyle(headStyle);

                HSSFCell cellRowName2 = rowRowName2.createCell(n);                //创建列头对应个数的单元格
                cellRowName2.setCellType(HSSFCell.CELL_TYPE_STRING);
                cellRowName2.setCellStyle(headStyle);
                sheet.addMergedRegion(new CellRangeAddress(2, 3, n, n));

                //设置列头单元格的数据类型
                HSSFRichTextString text = new HSSFRichTextString(rowName[n]);
                cellRowName.setCellValue(text);                                    //设置列头单元格的值
                // HSSFCell cell = row.createCell((short) cellIndex);
                //创建表头
                HSSFRow row=sheet.createRow(1);
                //合并列
                HSSFCell cell=row.createCell(0);
                cell.setCellValue(sheetTitle);
                CellRangeAddress region=new CellRangeAddress(1, 1, 0, 7);
                sheet.addMergedRegion(region);
                cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell.setCellStyle(headStyle);
            }
            //将查询出的数据设置到sheet对应的单元格中
            for (int i = 0; i < dataList.size(); i++) {
                HSSFRow row = sheet.createRow(i + 6);//创建所需的行数
                HSSFCell cell1 = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
                cell1.setCellStyle(style);
                cell1.setCellValue(i + 1);

                HSSFCell cell2 = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
                cell2.setCellStyle(style);
                cell2.setCellValue(dataList.get(i).getFenleiId());

                HSSFCell cell3 = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
                cell3.setCellStyle(style);
                cell3.setCellValue(dataList.get(i).getName());

                HSSFCell cell4 = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
                cell4.setCellStyle(numberStyle);
                cell4.setCellValue(dataList.get(i).getAddr());

                HSSFCell cell5 = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
                cell5.setCellStyle(numberStyle);
                cell5.setCellValue(dataList.get(i).getLink());

                HSSFCell cell6 = row.createCell(5, HSSFCell.CELL_TYPE_STRING);
                cell6.setCellStyle(numberStyle);
                cell6.setCellValue(dataList.get(i).getType());

                HSSFCell cell7 = row.createCell(6, HSSFCell.CELL_TYPE_STRING);
                cell7.setCellStyle(numberStyle);
                cell7.setCellValue(dataList.get(i).getCredit());

                HSSFCell cell8 = row.createCell(7, HSSFCell.CELL_TYPE_STRING);
                cell8.setCellStyle(numberStyle);
                cell8.setCellValue(dataList.get(i).getScore());

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void saveExcel(HttpServletResponse response){
        if (workbook != null) {
            System.out.println(title);
            try {
                // String fileName = title + ".xls";
                String headStr = "attachment; filename=\"" + URLEncoder.encode(title,"utf-8") + ".xls\"";
                System.out.println(headStr);
//                response.setContentType("APPLICATION/OCTET-STREAM");
//                response.setHeader("Content-Disposition", headStr);
////                response.addHeader("Content-Length", String.valueOf(100000));
                OutputStream out = response.getOutputStream();
//                out.clear();      //清空缓存的内容
//                out=pageContext.pushBody();  //更新PageContext的out属性的内容
                workbook.write(out);
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    /*
     * 列头单元格样式
     */
    public HSSFCellStyle getColumnTopStyle(HSSFWorkbook workbook) {

        // 设置字体
        HSSFFont font = workbook.createFont();
        //设置字体大小
        font.setFontHeightInPoints((short)11);
        //字体加粗
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
        //设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        //设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        //设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        //设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        //设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        //设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        //设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);
        //在样式用应用设置的字体;
        style.setFont(font);
        //设置自动换行;
        style.setWrapText(false);
        //设置水平对齐的样式为居中对齐;
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        return style;

    }

    /*
     * 列数据信息单元格样式
     */
    public HSSFCellStyle getStyle(HSSFWorkbook workbook) {
        // 设置字体
        HSSFFont font = workbook.createFont();
        //设置字体大小
        //font.setFontHeightInPoints((short)10);
        //字体加粗
        //font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
        //设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        //设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        //设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        //设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        //设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        //设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        //设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);
        //在样式用应用设置的字体;
        style.setFont(font);
        //设置自动换行;
        style.setWrapText(false);
        //设置水平对齐的样式为居中对齐;
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        return style;

    }


    /**
     * 设置金额单元格样式
     * @param workbook
     * @return
     */
    public HSSFCellStyle getNumberStype(HSSFWorkbook workbook) {
        // 设置字体
        HSSFFont font = workbook.createFont();
        HSSFDataFormat format = workbook.createDataFormat();
        //设置字体大小
        //font.setFontHeightInPoints((short)10);
        //字体加粗
        //font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
        //设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        //设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        //设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        //设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        //设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        //设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        //设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);
        //在样式用应用设置的字体;
        style.setFont(font);
        //设置自动换行;
        style.setWrapText(false);
        //设置水平对齐的样式为居中对齐;
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
//		HSSFDataFormat format= demoWorkBook.createDataFormat();

        style.setDataFormat(format.getFormat("#,##0.00")); //  四位小数
        return style;

    }

}
