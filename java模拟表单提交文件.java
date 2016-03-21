package cn.yanweijia;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class uploadFile {
	/**
	 * ��������
	 * 
	 * @param url
	 *            �����ַ
	 * @param filePath
	 *            �ļ��ڷ���������·����������Ϊ���Լ����Է����д�����Խ��ò���ȥ����
	 * @return
	 * @throws IOException
	 */
	public static int send(String url, String filePath) throws IOException {

		File file = new File(filePath);
		if (!file.exists() || !file.isFile()) {
			return -1;
		}

		/**
		 * ��һ����
		 */
		URL urlObj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();

		/**
		 * ���ùؼ�ֵ
		 */
		con.setRequestMethod("POST"); // ��Post��ʽ�ύ����Ĭ��get��ʽ
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false); // post��ʽ����ʹ�û���

		// ��������ͷ��Ϣ
		con.setRequestProperty("Connection", "Keep-Alive");
		con.setRequestProperty("Charset", "UTF-8");

		// ���ñ߽�
		String BOUNDARY = "----------" + System.currentTimeMillis();
		con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

		// ����������Ϣ

		// ��һ���֣�
		StringBuilder sb = new StringBuilder();
		sb.append("--"); // ////////�����������
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"file\";filename=\"" + file.getName() + "\"\r\n");
		sb.append("Content-Type:application/octet-stream\r\n\r\n");

		byte[] head = sb.toString().getBytes("utf-8");

		// ��������

		OutputStream out = new DataOutputStream(con.getOutputStream());
		out.write(head);

		// �ļ����Ĳ���
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		int bytes = 0;
		byte[] bufferOut = new byte[1024];
		while ((bytes = in.read(bufferOut)) != -1) {
			out.write(bufferOut, 0, bytes);
		}
		in.close();

		// ��β����
		byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// ����������ݷָ���

		out.write(foot);

		out.flush();
		out.close();

		/**
		 * ��ȡ��������Ӧ�������ȡ,�����ύ���ɹ�
		 */

		// return con.getResponseCode();

		/**
		 * ����ķ�ʽ��ȡҲ�ǿ��Ե�
		 */
		try {
			// ����BufferedReader����������ȡURL����Ӧ
			BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				System.out.print(line);
			}
		} catch (Exception e) {
			System.out.println("����POST��������쳣��" + e);
			e.printStackTrace();
		}
		return 1;
	}

	public static void main(String[] args) throws IOException {
		System.out.println(uploadFile.send("http://localhost:8080/kechuang/uploadHead", "E:\\myHead.jpg"));
		;
	}
}
