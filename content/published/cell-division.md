Title: Cell Division
Date: 2018-06-26 18:11
Modified: 2018-06-26 18:11
Category: misc
Tags: Artificial Intelligence, Games, Cell-Division
Slug: cell-division
Authors: Matt Motoki
Illustration: cell-division-code-v2.png
Summary: A Biology-Inspired Board Game with an AI Opponent
Status: published



<h1 style="text-align: center; letter-spacing: 1px;"> <a href="https://mattmotoki.github.io/cell-division/"> Play the Game <span class="glyphicon glyphicon-play"></span> </a> </h1>

<br> 

# Introduction 



Cell Division is a strategy-based board game. Player take turns placing their cells. A player's cells divide when they connect with each other; vertical, horizontal and diagonal connections are allowed.  Your score is equal to the total number of cell that you have on the board.  The game ends when the board is full and the winner is the player with the most cells. 


Cell Division has a few properties that make it a great test bed for reinforcement learning algorithms

* Scoring mechanism is visually intuitive. 

* Larger branching factor than Go.

* Interesting long-term and short-term strategies. 

* Easily generalizes to multi-agent games

The current implementation of the game is written in plAIn HTML, CSS and Javascript.  The code is avAIlable [here](https://github.com/mattmotoki/cell-division).  

# Implementation

In the production implementation of the game, there are three fixed-difficulty AI opponents.  AI opponents are designed to be completely deterministic so that games are reproducible.  

The AI opponents implement a greedy strategy with a strong base heuristic. The quality of the heuristic determines the difficulty of the opponent.  Since the objective is to maximize your score, it makes sense to approximate the long term benefit of a move with its immediate increase in score.  It turns out that the increase in score can be decomposed in the a function of the following four variables: 

* $\text{overlap}_p(\text{move})$ is the number of cells adjacent to a move,
* $\text{interlap}_p(\text{move})$ is the number of times the move is sandwiched by its cell and its opposite,
* $\text{extensions}_p(\text{move})$ is the number of existing connections that a move extends,
* $\text{unconnected}_p(\text{move})$ is the number of unconnected cells that a move connects

and the formula is 


$$\begin{split}
\Delta \text{score}_p(\text{move}) 
&= \mathrm{I} \{\text{overlap}_p(\text{move})>1\} - \text{unconnected}_p(\text{move}) \\
&\quad + 2\cdot \big[\text{overlap}_p(\text{move}) - \text{interlap}_p(\text{move})\big] \\
&\quad + 2\cdot\big[  \text{overlap}_p(\text{move})  - \text{extensions}_p(\text{move}) \big],
\end{split}$$
where $p$ denotes the player playing the move.  By convention, define the first player ($p=1$) to be you and the second player ($p=2$) to be the AI  
One benefit of this decomposition is that each of the variables can be updated in an online fashion.   


Additional player-independent variables that have intuitive value are:

* $\text{openness}(\text{move})$ is move number of open positions adjacent to a move,
* $\text{centrality}(\text{move})$ measures how close a move is to the center of the board.

To calculate a value of a move, the AI opponent uses a weighted sum of the above variables.

## Easy, Medium and Hard Opponents
Cell Addition is a zero sum game and so your gAIn is the same as the AI's loss.  Thus, when designing the AI, it will be beneficial to take this into account. 

The easy AI's value function is simply
$$
\text{easy}(\text{move}) = \text{centrality}(\text{move});
$$
that is, the easy AI just places it's move in the center most position of the board with ties broken arbitrarily.

The hard AI's value function is 
$$
\begin{split}
\text{hard}(\text{move}) 
& = \text{centrality}(\text{move}) + 2\cdot \text{openness}(\text{move})\\
& \quad + \big[ \Delta \text{score}_2(\text{move}) + \Delta \text{score}_1(\text{move}) \big]\\
&\quad - \big[ \text{overlap}_2(\text{move}) + \text{overlap}_1(\text{move}) \big]
.
\end{split}
$$
The idea is to find a tradeoff between exploration and exploitation.  To see this, consider the following formula for the increase in the total overlap of a board when playing $\text{move}$
$$
\Delta\text{total_overlap}_p(\text{move}) = \text{openness}_p(\text{move}) - \text{overlap}_p(\text{move}).
$$
The hard AI's value approximation can now be rewritten as
$$
\begin{split}
\text{hard}(\text{move}) 
& = \text{centrality}(\text{move}) \\
& \quad + \big[ \Delta \text{score}_2(\text{move}) + \Delta \text{score}_1(\text{move}) \big]\\
& \quad + \big[ \Delta\text{total_overlap}_2(\text{move}) + \Delta\text{total_overlap}_1(\text{move}) \big]
.
\end{split}
$$
The two first two terms after $\text{centrality}$ encourage exploitation of the current game state while the last two terms encourage exploration of the board.  
The Medium AI's value is the average of the easy and hard opponent's values; i.e., 
$$
\text{medium}(\text{move}) =
0.5\cdot \text{hard}(\text{move})  + 
0.5\cdot \text{easy}(\text{move}) .
$$


# Prototype


<h1 style="text-align: center; letter-spacing: 1px; font-size: 20px;"> <a href="https://mmotoki.shinyapps.io/cell_division/"> Play the Prototype <span class="glyphicon glyphicon-play"></span> </a> </h1>

## Adaptive AI

The prototype implementation has an adaptive opponent that plays whose difficulty is affected by the win/lose rate. The adaptive AI has a skill level which determines the overall strategy in a game.  The Adaptive AI adapts to your play in two ways: 

1. It adapts to your play within a game.
2. It adapts its entire strategy after a game.


The adaptive AI uses a convex combination of the easy and hard AI's value approximation.  
$$
\text{adaptive}(\text{move}) 
= \text{skill}' \cdot \text{hard}(\text{move})
+ (1 - \text{skill}') \cdot  \text{easy}(\text{move}),
$$
where $\text{skill}'$ is modified (within-game) skill parameter

$$
\text{skill}' = \text{skill} + 0.01\cdot ( \text{your_score} - \text{AI_score} ).
$$
Notice that if you are winning, then the effective skill of the AI goes up.  Moreover, if you are winning by a lot then the effective skill will go up by a lot.  

At the end of the game, the AI's skill level is updated according to the following formula:
$$
\text{skill} \leftarrow \text{skill} + 0.01\cdot  \frac{ \text{your_score} - \text{AI_score}  }{1 + \mathrm{I} \{ \text{your_score} < \text{AI_score} \}  }.
$$
Hence, if you beat the AI, then its skill goes up by the score difference; if you lose, then its skill goes down in proportion to half the absolute score difference.  If the game is a draw, then the skill level stays the same.

Ignoring within-game adaptivity, when $\text{skill}=0$ you are essentially playing agAInst the easy AI, when $\text{skill}=1$ you are playing agAInst the hard AI, and when $\text{skill}=0.5$ you are playing agAInst the medium AI.



## Alternative Game Boards and Mechanics

 The prototype implementation has different layouts and game mechanics. In the break and flask layouts, gravity applies to moves played (cells fall to the lowest open row).





# Future Add-Ons
There are many variations on this game that can be played.  What follows is an unordered list of possible improvements/variants of the game.

* **Stem Cells**: Undifferentiated cell that can become partially colored once fully surrounded.  If fully surrounded, the center of the stem cells can also be colored, resulting in a cell with a total of nine divisions.  

* **Time Limit**: Getting the first move can be an advantage, especially on the medium board configuration.  To mitigate this, the game can stop a few rounds early.  For example, in the medium board configuration, if the game stops one round early then both players will get have an equal number o moves.  

* **Attack/Defense Moves**: Give players access to the strong acid HCl and the strong base NaOH.  Each acid/base will destroy the other player's cells while leaving their cells intact.  Similarly, isopropyl alcohol can be played to destroy any cell.  Let players enforce their cells with cell walls (or membranes) to guard agAInst HCl/NaOH/Alcohol attacks. 


* **Triangular and Hexagonal Grids**: Storing a board defined over these grids can be done by modifying what it means to be adjacent to another cell.  Thus, boards can be stored and analyzed in a similar way to the rectangular grid.  The approximations that the AI opponents use will most likely generalize well to these types of grids. 
