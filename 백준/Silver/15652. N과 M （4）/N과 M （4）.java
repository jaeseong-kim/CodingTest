import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {
    public static int[] arr;
    public static int[] answer;

    public static StringBuffer sb;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine(), " ");

        // N, M 입력
        int N = Integer.parseInt(st.nextToken());
        int M = Integer.parseInt(st.nextToken());

        // 자연수 배열
        arr = new int[N];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = i + 1;
        }

        // 수열
        sb = new StringBuffer();
        answer = new int[M];
        sequence(0, 0, M);

        // 출력
        System.out.println(sb);
    }

    public static void sequence(int idx, int cur, int depth) {
        if (cur == depth) {

            for (int i = 0; i < answer.length; i++) {
                sb.append(answer[i]).append(" ");
            }
            sb.append("\n");
            return;
        }

        for (int i = idx; i < arr.length; i++) {
            answer[cur] = arr[i];
            sequence(i, cur + 1, depth);
        }
    }
}