defmodule Day3Test do
  use ExUnit.Case
  doctest Day3
  
  test "width" do
    assert Day3.getWidth("467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..") == 10
  end
  
  test "isAdjacent" do
    assert Day3.isAdjacent(3, 13, 10) == true
    assert Day3.isAdjacent(3, 16, 10) == false
  end
  
  test "getSymbolIdxList" do
    assert Day3.getSymbolIdxList("467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..") == [13, 36, 43, 55, 83, 85]
  end
  
  test "getPartNumbersIdx" do
    assert Day3.getPartNumbersIdx("467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..") == [{0, 3}, {5, 3}, {22, 2}, {26, 3}, {40, 3}, {57, 2}, {62, 3}, {76, 3}, {91, 3}, {95, 3}]
  end
  
  test "small isPartNumberAdjacent" do
    assert Day3.isPartNumberAdjacent("467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..") == [467, 35, 633, 617, 592, 755, 664, 598]
  end
  
  @tag :skip
  test "final" do
    assert Day3.isPartNumberAdjacent("..........................................389.314.................206......................449.523..................138.....................
    .........+.....954......723..........................................*.............687.....*..........692..........*........................
    121......992...............*.......%585....814............936.......102..#353.........*.....140.........*..434..301..................%..315.
    .../....................877................*...523............489.................*....380.......174..263.@..............824......710.......
    ...........$..733*758.......435...656...483.....................*..%855........154.779.....674...............320+....+........373...........
    ........707......................................503.422...591.551......676............306...*....................220..........@..410..639..
    ..................+....146.486.772..................*........*.....+848..*...863........-.....405........../..............636........*......
    ........190.....313.&.....*...../...+738..397.....@........#.840........167.../......#....508.......498..819..............*.........147.313.
    ....692*............177........................727..364..800.......................748..../........*...........%733......993.854........+...
    ...........*..............245..........128.............*.................322......................305....7*.......................152.......
    ........978.160..378.........*524.......*..905.343..+.681......615......-..........................................$..........@.............
    .251..................................417.....*....53...........*...........354*126........119$...942....424....863...518*....971..96.48....
    .................92.....441.681...532........................257.....932..............%...................*...............64.........*......
    ...........2.235*..........*..........*318.......317............................383.567..705.923..716.409.68.......................*........
    ...........*...................638..72...........+......367........802.........&..............=....*..*................-.../....401.773.....
    ........535...................*............4.29..........*.....784*....526........................141.342.189........630..958...............
    ...../.........745..+118....639....702.....%...#.*327...741............*......./324......531....................648/..............566.......
    ...+..172.........*.................................................910.....@.............*.....939................................*........
    .799......37.307..140........334....@..204.852......+.....104............914..553..........994.&........547.#539........588$.......436......
    .........*......*............*....12..../...&..914..223...$......+...........*....953+.......................................62........&....
    ........311.98.317...595..467................................#..142......*...620........$.......795.....363..135/..968...222.*....448...754.
    ...................../...............*702..881...............31.......630...............834........*.......-.........*.....*.527....*.......
    ..............614...........640+..888.......*....360........................%....764...............859.......586.....979.514.......30.......
    .........@538........=...................176......*..200.300..............708...=......460...503..............*...............385...........
    ....................896.......$...................14....*..../........404..........-..*.......*.............688.460....$......&.............
    ......677...................110......&..-.....549..........934....654...-....334..153.508.....556......913........*....199........513.......
    .........*....-...=204..342........515..85......./..955............../.......*..............-......18.*..........601..........+.......280...
    .........80..515.........*.......$.........259...............250.../.......3..337.......%83..972..*....586.5.651......594....484............
    ..........................126.121......935*......235.815.......*.887........*........34..........294........*............$..............@...
    45......$..651....$...............................*.........526.............41......*......302...................530..........@819.......463
    .....710......*....26................734.......791......565............625.......%.887........@.......381..741..*...........................
    ......................881...........*............................989......+....235..............491...*...-.....693.........16..............
    .............589*.....*.............610...318..#187..945@..774............................491.....*...867..................$...........679..
    ........957......614..553....345*56......#..................*...658.870........895......%........714......749...13..........................
    ...........$....................................127........775.....*......988..*.........254.276.................*..560.950.............*...
    ....761.................................825.........495..............496.....+.87.............*....*....689..26....*.....*...........131.745
    639...*.196.....993*.......................*.603......*.............%................637....951.720........*......167...28..................
    ........./....-.....503........$.........634....*476...887.....463....221....457.........................698....................413.539*....
    672..116...415................641....911...................774........*.......*.....................................926.674*693..&......103.
    ....*....%.....246.....................*...............290*.........59..542.253..$.....&......=.......320....196*...................586.....
    ...630..165....=...*.................690...360...........................*........42..584..650...153...*.........191........#218.....*......
    .............*......51....680....102........*.......112...-....190......499.889&.................-...28....*........................340.....
    ...*729...130.683...........*....*.......776...928.....*..351....*...............878....................681.889...564*55................/760
    839.................226...246...719..954.............428.........663.......341...+...357..................................../394............
    ......................*..............................................................*.....=910....821.........242......955......*569.......
    ......964.381.........923.....................491..906.....614........937....471..491....*........*....512....$...............574...........
    ........+..+.......................893..22.....*...........*............*.......@.........378......675./..........$103......................
    ...............525......$..=35....+.....*...301.......162.872......910.889.354............................871.679......894......731.........
    ...178........*.......543............865................*.....*857...........................630...........*....*.....@........&............
    ....#........954...............................433&..615...828............................*.....*745...+...556..321..................342....
    ..........................422...+..130.154.........................+..............225..235.501.........189..............609...............91
    .....%........192....264.....$.609....*.....6..........932=.....*...920...........+...............391..............934.....*..211...=.......
    .....805........*.......*975................$....159.........713....................&.850..$924.....-.....%..........*..212...*....176......
    .............&..381..........917.905................*...276.............352...524.878..-........#......867....769.152........484.......341..
    ..664..390..140.......&.......*.........566.........163...*.&....995.....*...*..................811..............................874*.......
    ....=....$............43......989..............239......917..131.......13.....806....................................................174....
    ...........184..72.................=......928.....................684.....118.............239.........................#.....$...............
    .609...116...*..*..........241...826.......*.......312......779=.....*...*......871.475...*...883.......717..538....-.581....424......259...
    ...*....*...33..574......&..%..................647*................378....803...*....#..260..*......543.-.......+.76..............464...*...
    ...611...42..............40...............375..........30......371............666...........185.....*.................161&........*.....968.
    ....................295.........-............-..................+......................*............789.........548................993......
    ..616....5.........*..........662.760............*670......272...........951........501.248....317......752.............616..739............
    ..........#..113..192..............$....267...761..........*...192.............456..............*.......*..........572....#....*............
    ............%...........606.............*...........628*.........*.342*503.....*...........409.......310........................516....316..
    ......622...................181.........454.............491....738...........214....#.........*..........937.....764#.......+...............
    .........*..391=.....836...%.......................183..............402.............825...*....921..843...*.............+..897......546.....
    .......264..............-..................$471........................*...174$.921........276.......*...513.......598.691............*.....
    ................$.64.......439......445..........701.......377...491%.422...........591........658...426.....*689..*.........687...=...175..
    ..171....429.260.............+........#...513.......*.....*...............477*..........375..&............641.....108..............444......
    .....#....*.....................779..........*......140.24....................22.........@..28..............................................
    .......682.....348+.153.168@......%.451.627.236.............92.141.....393........669.....................75.......557...585...826......559.
    ......................*.............*............881.........*....*776...*.105......*...=....#....&........&.526..+............#........%...
    ....955.....410......566..760....760........586....*....*...560........548.......335...951...749...256.........*......313....$...888........
    ...*....45.................*...................*..798.199....................77........................280&...347.207.@.....495.............
    .934....*...36....841......952......266*....997............840...$867.......*....179...........@...................*.....86.....759..33*....
    .......576...........*..........953....................722....%.............22..*...............952......965&.....777.....*....*........371.
    ..795................987....490..*..............................904.....4.......598....................................635..328.............
    ...............=563........#....270..........*.............=.......*..........+...............453.689.............=...................992...
    ...+......752..........................790...608.......914..69.....250.....200....996..892....=...*................472...@.............#....
    ..710......../.......604.................*.......401..=.............................*.#...........622...742..............685....&...........
    ......284..#............*.......401...802..........*...............65......166....901.....$..196*............65*................369.........
    ............815..................*........925....529........262....*........*...........234......729..37+.......95.......401................
    .704..499%..........775....%....475....................287........379.......597....=...............................527..*.......264$........
    ................728*.......766......619*.....#604........./.75....................834....*.................912....*.....715.................
    .......981.556..........................389........888.......*...............734......862.378...412........*......................556*......
    ..........*........................213........68..........696...............*.....................*.........726..678...@...931........991...
    .../........=..............349.......*.........*....477.%.........#...=....7..............313...27....896.........*...13....................
    ...61..386.357.....=......*.......471.........126..&....579.....772....828..........322..*...............#.....644................844.......
    .......*.......&.159...263............457...........................................@...772.....$...803..........................*....$158..
    ....202.....133......................*.................................362..................841.322...*..........730...868.....116..........
    ..........-.......................221..................41.................*...........=......*.........508.............=............465.....
    ...*667...979.983......................905..../......-.....321$.......731.690..........190.999....=.........*759....................*...515.
    905...........*...............58.........*..801.....199..........305.=...........168.............298......25......&...604..........434......
    ..........531.217..497-.......*.......744.........................*......791.......*.................633.........657....................952.
    ......241...&...............675.156................831.........800..859...$....484.894...294......@....................825.655..627.........
    .....*.............................*.586......790..*...178......................................716...*.......618.808-........*....*794.....
    ....401..+.....708.897.....655...351.../.426...*...148.....................798..........594............827...............166..784...........
    ........754.........&.......*...............+.............14....93..87.....@............*....205...-....................*..........224......
    ............784............88....................18.977..............*...................726...*....56.....575.........139..........*.......
    .652...........*......*304.....*574.714.397........*.......*920...376....*....................627..........*................208...504.609...
    .........535.......280......330.......=.*...............257...........+...738..@...271..453.................55....971......*..........@.....
    ..185.....%...931......%762.............902.........837..............922......34........*....915*.................*....%....158.............
    .............................107.............*92.......*770...991*...................130.........256...910.....550......783............675..
    ....993........../...........*.........516.......*87..............147......268............................*........492*................*....
    ............190...611.....450...$.......*.....828....840.......................514.........................24..361.....485.......*504...778.
    ...............................809.486.552.........&....$....................=....*....206......576..595..........*382......................
    ...288..................$625........*..............382........318...........869.344..............*...&.....=361...................298.......
    ..............171..=525.............912...593..........@407......=....%43....................193.................676....&160...../..........
    .................#.......262..............*.....259&............................724......35.....*879...............*........................
    ...........327..........-..........%...247...................381...................*32.......................183..735...............171.....
    ............$....................178.............925..70....*...............235................363......................97.764.792..*.......
    .250..................*471............#....975....$.....*..42...13*687.............934...181....*.....62....532..9............*.....678.....
    ....*.......714.53..........245.....598...*..........251.......................116*.....*........269...=................483...../.......%...
    ....387......*..........498*............519........=..........$.......................600....373..........746.497..........#.248.........512
    ...........42....647.............776.........9......601....560.....696....267..................%....102...........250............289.33*....
    ......................667....793*......=521../.....................+........*......#....81.............*996.........*.............*.....713.
    ...........92............#.........*..................708................799...736.369....*.................-...779................439......
    ......484...*....655.......555..471.707....-..441....*.....882$........$.........=.........797........374..196...*...................../....
    ......../...284.............*...........297../....378................660.......*.....694.......709...*............499.................300...
    ..931...........752.986.805...................................52.783........887.127.....*........*...221....................=....../........
    ...*.......105.&.........*....141........................186.............-...............134....408......*230../709..767.....446.413........
    ..619.......*.......444...903.*.......594............446*.......*.........151.........................108..............*...............876..
    ............204.490...........285..74*.....898..373..........243....269+......616.....242........682..................923..582.....508*.....
    486...=.........%.............................*..*...........................*......#.*............*.807..........*.......*....429..........
    .....28.&.............416......851..968.....29..327.782..............706.....529..269.379........939...*...#...902.243..703.................
    796......890.........*.........*....&...............*.......*...........*...................136.......944..52................@........451...
    ......................40..123...222..........52...408....995.......#149..708....$722....770*....*492.............714...%......99........%...
    .....759.............................138+...+................................................517.......$....874.-.......54..................
    .....*........................................=.......-......61...129.........517+...............264..130...*.....16........................
    ......769..176.........663..198...44.102...983......753..486...-.....*874.796.........-..........-...........941..../....973...........#....
    ...........@....74.......=.*........*..........$895.......=.......*......../........235....282.......243.......................337......69..
    ....................$.....................704..................283.328..........................218.............744............&...%82......
    ...........#.........252.......984............799.210..153..............699.29..........99............................*....648..............
    ............687..320.....518......*.............*.*.....#...........2...&...*...........*..19.356*......313.994.467..984...+................
    .......#40..........*.....#...@....473.......789................/...*.......902......987..........179......*.................382..519.......
    ......................*.......11...............................926..153.#.................725*................................*.....*.......
    ...358...527..345..746.978....................*.........................607..798..899.........86.........*478.......888....949..767..807....
    .....*...*.......%..............743*715..723...56................81.........*....=........345.........802.......776*...............$........
    ....26.743..........&943.................................................971.................%....527.................*....%...........@....
    ........................................782...............665......................532.......................998...991.702.542....406.779...") == [50]
  end
  
end
