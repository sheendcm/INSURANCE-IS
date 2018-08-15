package controller;

import java.io.FileOutputStream;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

public class TryPdf {
	
	private static String FILE= "C:/Users/SHEEN/Downloads/testpdf";
	
	public static void main (String[] args)
	{
		try {
			Document document =new Document();
			PdfWriter.getInstance(document, new FileOutputStream(FILE));
			document.open();
			Paragraph p1= new Paragraph("Try pdf");
			document.add(p1);
			document.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
