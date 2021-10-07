package Mygame
import java.util.*;
import java.time.Duration;
import java.util.Random;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    
import java.util.logging.Level; 
import java.util.logging.Logger; 
import java.util.logging.*; 
/** Game is a class that represents a guessing game 
 * @author Mateusz Obara
 */

public class Game {
	protected final Logger logger = Logger.getLogger(getClass().getName());
	/** Toolbox is a class that includes various needed methods that are not related to reading/writing intput/output or game logic */
	static class Toolbox{
		static int factorial(int n){
			int r = 1;
			for(int i = 2; i <= n; i++)
				r *= i;
			return r;
		}
	}

	/** State class represents a single 'game state' in round, each round has a single state. */
	private class State {
		int difficulty = 3;
		int tries = 0;
		String playerName = "DefaultPlayerName";
		boolean finished = false;
		boolean playerWin = false;

		LocalDateTime gameStart;
		long totalGameLength;

		ArrayList<Integer> permutation;
		
		State(int diff, String name){
			this.difficulty = diff;
			this.playerName = name;
			this.permutation = new ArrayList<Integer>();
			for (int i = 1; i <= difficulty; i++)
				permutation.add(i);
			Collections.shuffle(this.permutation);
			this.gameStart = LocalDateTime.now();
		}

		/**incrTries increments inner 'tries' value.*/
		void incrTries(){ this.tries++; }

		/**permmutationString is a shortcut to print random permutation.
		/* @return a string representing permutation.*/
		String permutationString(){ return permutation.toString(); }

		/**currentGameLength evaluates time between start of state and current one
		 * @return long representing seconds between start of state and its finish */
		long currentGameLength(){ return Duration.between(gameStart, LocalDateTime.now()).getSeconds();}


		/** finish writes into fields that are meant to be filled when state is finished (a single round ended)*/
		void finish(){ 
			this.totalGameLength = currentGameLength();
			this.finished = true;
		}
	}

	/** Round class represents a single round of the game */
	private class Round{
		State state;
		int maxTries;

		Round(State state){ this.state = state; }

		Round(int diff, String name){ 
			this.state = new State(diff, name); 
			this.maxTries = Toolbox.factorial(diff);
		}

		/** isWinningGuess checks if given 'guess' is same as permutation meant to be guessed.
		 * @param guess an ArrayList representing guess
		 * @return a boolean representing whether guess is correct */
		boolean isWinningGuess(ArrayList<Integer> guess){ return state.permutation.equals(guess); }

		/** hintAtString produces a helpful hint for player, by choosing one incorrect index of permutation and hinting whether it should be on the left or right of given in the guess.
		 * @param guess an ArrayList representing guess
		 * @return a String representing hint*/
		String hintAtString(ArrayList<Integer> guess){
			ArrayList<Integer> unequalIndexes = new ArrayList<Integer>();

			for (Integer i = 0; i < guess.size(); i++)
				if (guess.get(i) != state.permutation.get(i))
					unequalIndexes.add(i);
			Integer randomIndex = unequalIndexes.get(new Random().nextInt(unequalIndexes.size()));
			Integer position = randomIndex - guess.indexOf(state.permutation.get(randomIndex));
			return String.format(Msg.RoundHint, state.permutation.get(randomIndex), position < 0 ? "left": "right");
		}

		/** parseGuess is parsing input into format of permutation (ArrayList<Integer>).
		 * @param line a String representing player input
		 * @throws GameException.InputNotAdigit when part of permutation is not a digit
		 * @throws GameException.InvalidInputLength when input and permutation to guess are different in size
		 * @throws GameException.OutOfBounds when input is a digit that doesnt appear in permutation
		 * @return a ArrayList<Integer> representing guess of permutation that player did input */
		ArrayList<Integer> parseGuess(String line) throws Exception {
			ArrayList<Integer> retlist = new ArrayList<Integer>();

			for(String s : line.trim().split(" ")){
				try {
					retlist.add(Integer.parseInt(s));
				} catch(NumberFormatException e) {
					throw new GameException.InputNotADigit();
				}
			}
			if(retlist.size() != state.difficulty)
				throw new GameException.InvalidInputLength();
			for(Integer digit : retlist){
				if(!(1 <= digit && digit <= 9))
					throw new GameException.InputNotADigit();
				if(!(digit <= state.difficulty))
					throw new GameException.InputOutOfBounds();
			}

        	logger.log(Level.INFO, this.state.playerName + " move: " + retlist); 
			return retlist;
		}

		/** playRound is used for dialogue between Game and Player and controls the game logic in single round
		 * @param scanner a Scanner that is used to read player intput*/
		void playRound(Scanner scanner){
			ArrayList<Integer> input;

        	logger.log(Level.INFO, "RoundStart: " + state.gameStart); 
			System.out.println(String.format(Msg.RoundWelcome, state.playerName));
			System.out.println(state.permutationString());

			boolean isOngoing = true;
			do {
				System.out.println(Msg.RoundTriesleft);
				try {
					assert this.state.tries <= this.maxTries : Msg.RoundLost;
					String line = scanner.nextLine().trim();
					switch(line) {
						case "giveup":
							isOngoing = false;
							break;
						case "help":
							System.out.println(Msg.Help);
							break;
						default:
							input = parseGuess(line);
							if(isWinningGuess(input)){
								System.out.println(Msg.RoundWin);
								isOngoing = false;
								state.playerWin = true;
							} else {
								System.out.println(Msg.RoundWrongAnswer);
								System.out.println(hintAtString(input));
							}
							this.state.incrTries();
					}
				} catch(AssertionError e) {
					System.out.println(e.getMessage());
					isOngoing = false;
				} catch(Exception e) {
					System.out.println(e.getMessage() + Msg.tryagain);
				} 
			} while(isOngoing);
			this.state.finish();
			System.out.println(String.format(Msg.RoundLasted, this.state.totalGameLength));
        	logger.log(Level.INFO, "Round end; lasted: " + this.state.totalGameLength + "; win status:" + this.state.playerWin); 
			System.out.println(Msg.RoundEnd);
		}
	}

	/** scanPlayerName scans and parses input line representing player name
	  * @param scanner a Scanner that is used to read player intput
	  * @throws GameException.UnreadableInput when scanned line is empty or white
	  * @return trimmed, non empty, non white String representing player name*/
	String scanPlayerName(Scanner scanner) throws GameException.UnreadableInput {
		String name = scanner.nextLine().trim();
		if(name.isBlank()){
			throw new GameException.UnreadableInput();
		}
        logger.log(Level.INFO, "Player name: " + name); 
		return name;
	}

	/** gameloop is used for dialogue between Game and Player and inititating game rounds
	 * @param difficulty a int representing difficulty of first round */
	public void gameloop(int difficulty){
        logger.log(Level.INFO, "GameStart: " + LocalDateTime.now()); 
		Scanner scanner = new Scanner(System.in);
		String name = "defaultName";
		boolean isOnGoing = true;

		System.out.println(Msg.GameWelcome);
		System.out.println(Msg.QuestionName);

		boolean repeat = true;
		while(repeat){
			try {
				name = scanPlayerName(scanner);
				repeat = false;
			} catch (Exception e) {
				System.out.println(e.getMessage() + Msg.tryagain);
			}
		}
		do { 
			Round r = new Round(difficulty, name);
			r.playRound(scanner);
			if (r.state.playerWin) {
				System.out.println(Msg.GameNextround);
				if (difficulty < 9)
					difficulty++;
			} else {
				System.out.println(Msg.GameRetry);
			}
			switch (scanner.nextLine().trim()){
				case "help":
					System.out.println(Msg.Help);
				case "y":
					isOnGoing = true;
					break;
				case "n":
					isOnGoing = false;
					break;
				default:
					System.out.println(Msg.tryagain);
			}
		} while (isOnGoing);
		System.out.println(Msg.GameEnd);
        logger.log(Level.INFO, "GameEnd: " + LocalDateTime.now()); 
	}

	public static void main(String[] args){
		Game g = new Game();
		g.gameloop(3);
	}
}
