import '../domain/entities/puzzle.dart';

/// Bundled tactical puzzles organized by theme and difficulty.
class BundledPuzzles {
  BundledPuzzles._();

  static List<ChessPuzzle> get all => [
        ...mateInOne,
        ...forks,
        ...pins,
        ...skewers,
        ...mateInTwo,
        ...discoveredAttacks,
        ...deflections,
        ...promotions,
        ...backRankThemes,
      ];

  static List<ChessPuzzle> byTheme(String theme) {
    return all.where((p) => p.theme == theme).toList();
  }

  static List<ChessPuzzle> byRatingRange(int min, int max) {
    return all.where((p) => p.rating >= min && p.rating <= max).toList();
  }

  // ── Mate in 1 (25 puzzles) ──────────────────────────────────

  static const mateInOne = [
    ChessPuzzle(id: 'm1_001', fen: '6k1/5ppp/8/8/8/8/8/R3K3 w - - 0 1', solution: ['a1a8'], theme: 'mate_in_1', rating: 400, description: 'Back rank mate with the rook.'),
    ChessPuzzle(id: 'm1_002', fen: 'k7/8/1K6/8/8/8/8/1Q6 w - - 0 1', solution: ['b1a2'], theme: 'mate_in_1', rating: 450, description: 'Queen delivers mate supported by king.'),
    ChessPuzzle(id: 'm1_003', fen: 'k7/2R5/1K6/8/8/8/8/8 w - - 0 1', solution: ['c7a7'], theme: 'mate_in_1', rating: 500, description: 'Rook slides along the 7th rank.'),
    ChessPuzzle(id: 'm1_004', fen: '5rk1/5ppp/8/8/8/8/5PPP/R5K1 w - - 0 1', solution: ['a1a8'], theme: 'mate_in_1', rating: 500, description: 'Back rank mate - king trapped by own pawns.'),
    ChessPuzzle(id: 'm1_005', fen: '6k1/4Qppp/8/8/8/8/8/6K1 w - - 0 1', solution: ['e7f8'], theme: 'mate_in_1', rating: 550, description: 'Queen mates on f8.'),
    ChessPuzzle(id: 'm1_006', fen: 'r1bqk2r/pppp1ppp/2n2n2/2b1p2Q/2B1P3/8/PPPP1PPP/RNB1K1NR w KQkq - 0 1', solution: ['h5f7'], theme: 'mate_in_1', rating: 550, description: "Scholar's mate! Qxf7#"),
    ChessPuzzle(id: 'm1_007', fen: '3qk3/3pp3/8/8/8/8/6Q1/4K3 w - - 0 1', solution: ['g2g8'], theme: 'mate_in_1', rating: 600, description: 'Queen delivers mate on the back rank.'),
    ChessPuzzle(id: 'm1_008', fen: 'rnb1kbnr/pppp1ppp/8/4p2q/4PP2/8/PPPP2PP/RNBQKBNR b KQkq - 0 1', solution: ['h5e2'], theme: 'mate_in_1', rating: 500, description: 'Queen checkmate on e2.'),
    ChessPuzzle(id: 'm1_009', fen: '6k1/pp3ppp/8/8/8/8/PP3rPP/R4RK1 b - - 0 1', solution: ['f2f1'], theme: 'mate_in_1', rating: 600, description: 'Rook delivers back rank mate.'),
    ChessPuzzle(id: 'm1_010', fen: '6k1/5p1p/6pQ/8/8/8/8/6K1 w - - 0 1', solution: ['h6g7'], theme: 'mate_in_1', rating: 500, description: 'Queen mates on g7.'),
    ChessPuzzle(id: 'm1_011', fen: 'r4rk1/5ppp/8/8/8/8/5PPP/4R1K1 w - - 0 1', solution: ['e1e8'], theme: 'mate_in_1', rating: 550, description: 'Rook invades the 8th rank.'),
    ChessPuzzle(id: 'm1_012', fen: '5r1k/6pp/8/8/8/8/6PP/4R2K w - - 0 1', solution: ['e1e8'], theme: 'mate_in_1', rating: 550, description: 'Back rank with h-file king.'),
    ChessPuzzle(id: 'm1_013', fen: '1k6/ppp5/8/8/8/8/8/1K1R4 w - - 0 1', solution: ['d1d8'], theme: 'mate_in_1', rating: 500, description: 'Rook mates on d8.'),
    ChessPuzzle(id: 'm1_014', fen: '6rk/5Npp/8/8/8/8/8/6K1 w - - 0 1', solution: ['f7g5'], theme: 'mate_in_1', rating: 700, description: 'Knight smothered mate pattern.'),
    ChessPuzzle(id: 'm1_015', fen: '4kb2/3r4/8/8/8/8/8/2R1K3 w - - 0 1', solution: ['c1c8'], theme: 'mate_in_1', rating: 550, description: 'Rook exploits the pinned bishop.'),
    ChessPuzzle(id: 'm1_016', fen: '2k5/1pR5/1K6/8/8/8/8/8 w - - 0 1', solution: ['c7a7'], theme: 'mate_in_1', rating: 600, description: 'Rook delivers checkmate on a7.'),
    ChessPuzzle(id: 'm1_017', fen: '5k2/5P2/5K2/8/8/8/8/8 w - - 0 1', solution: ['f7f8n'], theme: 'mate_in_1', rating: 750, description: 'Underpromotion to knight gives mate!'),
    ChessPuzzle(id: 'm1_018', fen: 'r6k/6pp/8/7Q/8/8/8/6K1 w - - 0 1', solution: ['h5f7'], theme: 'mate_in_1', rating: 550, description: 'Queen mates on f7 with no escape.'),
    ChessPuzzle(id: 'm1_019', fen: '6k1/5pBp/8/8/8/8/5P1P/6K1 w - - 0 1', solution: ['g7f8'], theme: 'mate_in_1', rating: 600, description: 'Bishop delivers mate from f8.'),
    ChessPuzzle(id: 'm1_020', fen: 'r4r1k/pppp2pp/8/8/8/8/PPPP2PP/R3QRK1 w - - 0 1', solution: ['e1e8'], theme: 'mate_in_1', rating: 600, description: 'Queen infiltrates the 8th rank.'),
    ChessPuzzle(id: 'm1_021', fen: '1rbq1rk1/pppp1Bpp/2n5/8/8/8/PPPP1PPP/RNBQR1K1 w - - 0 1', solution: ['e1e8'], theme: 'mate_in_1', rating: 650, description: 'Back rank after bishop sac distraction.'),
    ChessPuzzle(id: 'm1_022', fen: '6k1/5pp1/7p/8/8/7Q/8/6K1 w - - 0 1', solution: ['h3h6'], theme: 'mate_in_1', rating: 500, description: 'Queen takes pawn with mate.'),
    ChessPuzzle(id: 'm1_023', fen: 'r1bk3r/pppp1ppp/8/4Q3/8/8/PPPP1PPP/RNB1K2R w KQ - 0 1', solution: ['e5d6'], theme: 'mate_in_1', rating: 550, description: 'Queen to d6 mates the exposed king.'),
    ChessPuzzle(id: 'm1_024', fen: '2kr4/ppp5/8/8/8/8/5PPP/3R2K1 w - - 0 1', solution: ['d1d8'], theme: 'mate_in_1', rating: 500, description: 'Rook mates on d8.'),
    ChessPuzzle(id: 'm1_025', fen: 'r4b1k/5Qpp/8/8/8/8/5PPP/6K1 w - - 0 1', solution: ['f7g8'], theme: 'mate_in_1', rating: 550, description: 'Queen mates on g8 supported by nothing.'),
  ];

  // ── Forks (20 puzzles) ──────────────────────────────────────

  static const forks = [
    ChessPuzzle(id: 'fk_001', fen: '3qk3/8/8/8/8/5N2/8/4K3 w - - 0 1', solution: ['f3e5'], theme: 'fork', rating: 500, description: 'Knight forks king and queen.'),
    ChessPuzzle(id: 'fk_002', fen: 'r3k3/8/8/8/8/4N3/8/4K3 w - - 0 1', solution: ['e3d5'], theme: 'fork', rating: 550, description: 'Knight forks king and rook.'),
    ChessPuzzle(id: 'fk_003', fen: '2kr4/8/8/3N4/8/8/8/4K3 w - - 0 1', solution: ['d5b6'], theme: 'fork', rating: 600, description: 'Knight forks king and rook from b6.'),
    ChessPuzzle(id: 'fk_004', fen: 'r3k2r/8/8/8/4N3/8/8/4K3 w - - 0 1', solution: ['e4d6'], theme: 'fork', rating: 650, description: 'Knight forks king and both rooks.'),
    ChessPuzzle(id: 'fk_005', fen: '2k5/8/8/8/8/8/1q3r2/4K3 w - - 0 1', solution: ['e1f2'], theme: 'fork', rating: 450, description: 'King forks queen and rook.'),
    ChessPuzzle(id: 'fk_006', fen: 'q3k3/8/8/2N5/8/8/8/4K3 w - - 0 1', solution: ['c5b7'], theme: 'fork', rating: 550, description: 'Knight forks king and queen.'),
    ChessPuzzle(id: 'fk_007', fen: '4k3/8/2r3b1/8/3N4/8/8/4K3 w - - 0 1', solution: ['d4e6'], theme: 'fork', rating: 600, description: 'Knight forks rook and bishop.'),
    ChessPuzzle(id: 'fk_008', fen: '4k3/8/8/8/2n1b3/3P4/8/4K3 w - - 0 1', solution: ['d3d4'], theme: 'fork', rating: 500, description: 'Pawn forks knight and bishop.'),
    ChessPuzzle(id: 'fk_009', fen: 'r3k3/5q2/8/8/3N4/8/8/4K3 w - - 0 1', solution: ['d4c6'], theme: 'fork', rating: 600, description: 'Knight forks king, queen, and rook.'),
    ChessPuzzle(id: 'fk_010', fen: '4k3/r7/8/5q2/8/4N3/8/4K3 w - - 0 1', solution: ['e3d5'], theme: 'fork', rating: 550, description: 'Knight forks queen and rook.'),
    ChessPuzzle(id: 'fk_011', fen: '1k6/1b6/8/8/8/5Q2/8/4K3 w - - 0 1', solution: ['f3a8'], theme: 'fork', rating: 500, description: 'Queen forks king and bishop.'),
    ChessPuzzle(id: 'fk_012', fen: 'r3k3/8/8/4N3/8/8/8/4K3 w - - 0 1', solution: ['e5c6'], theme: 'fork', rating: 550, description: 'Knight forks king and rook.'),
    ChessPuzzle(id: 'fk_013', fen: '4k3/8/8/1q5r/8/3N4/8/4K3 w - - 0 1', solution: ['d3c5'], theme: 'fork', rating: 600, description: 'Knight forks queen and rook.'),
    ChessPuzzle(id: 'fk_014', fen: '2k2r2/8/8/8/8/2N5/8/4K3 w - - 0 1', solution: ['c3d5'], theme: 'fork', rating: 550, description: 'Knight forks king and rook.'),
    ChessPuzzle(id: 'fk_015', fen: '4k3/3r4/8/8/8/3N4/8/3QK3 w - - 0 1', solution: ['d3e5'], theme: 'fork', rating: 550, description: 'Knight attacks king and rook.'),
    ChessPuzzle(id: 'fk_016', fen: 'r6k/8/8/8/8/8/1Q6/4K3 w - - 0 1', solution: ['b2g7'], theme: 'fork', rating: 500, description: 'Queen forks king and rook.'),
    ChessPuzzle(id: 'fk_017', fen: '4k3/8/8/8/8/2b1r3/3P4/4K3 w - - 0 1', solution: ['d2d3'], theme: 'fork', rating: 450, description: 'Pawn forks bishop and rook.'),
    ChessPuzzle(id: 'fk_018', fen: '1k6/8/8/8/4n3/8/1Q6/4K3 w - - 0 1', solution: ['b2b8'], theme: 'fork', rating: 500, description: 'Queen check leads to winning the knight.'),
    ChessPuzzle(id: 'fk_019', fen: '3rk3/8/8/8/8/8/8/3NK3 w - - 0 1', solution: ['d1c3'], theme: 'fork', rating: 550, description: 'Knight forks king and rook.'),
    ChessPuzzle(id: 'fk_020', fen: 'q1k5/8/8/8/8/5N2/8/4K3 w - - 0 1', solution: ['f3d4'], theme: 'fork', rating: 600, description: 'Knight forks queen and king.'),
  ];

  // ── Pins (15 puzzles) ───────────────────────────────────────

  static const pins = [
    ChessPuzzle(id: 'pn_001', fen: 'r2qk3/ppp2ppp/3n4/8/8/3B4/PPP2PPP/R2QK3 w - - 0 1', solution: ['d3b5'], theme: 'pin', rating: 600, description: 'Bishop pins knight to king.'),
    ChessPuzzle(id: 'pn_002', fen: 'r1bqk2r/ppppnppp/8/8/4P3/8/PPP2PPP/RNBQKB1R w KQkq - 0 1', solution: ['f1b5'], theme: 'pin', rating: 650, description: 'Bishop pins knight to king on b5.'),
    ChessPuzzle(id: 'pn_003', fen: '4k3/4q3/8/8/4R3/8/8/4K3 w - - 0 1', solution: ['e4e5'], theme: 'pin', rating: 550, description: 'Rook pins queen to king on the e-file.'),
    ChessPuzzle(id: 'pn_004', fen: 'r1bqkb1r/pppp1ppp/2n5/4n3/2B1P3/5N2/PPPP1PPP/RNBQ1RK1 w kq - 0 1', solution: ['c4f7'], theme: 'pin', rating: 700, description: 'Bishop sacrifice on f7 exploiting pin.'),
    ChessPuzzle(id: 'pn_005', fen: '3rk3/8/8/8/4B3/8/8/4K3 w - - 0 1', solution: ['e4b7'], theme: 'pin', rating: 550, description: 'Bishop pins rook to king.'),
    ChessPuzzle(id: 'pn_006', fen: '4k3/4r3/8/4B3/8/8/8/4K3 w - - 0 1', solution: ['e5d6'], theme: 'pin', rating: 600, description: 'Bishop creates absolute pin.'),
    ChessPuzzle(id: 'pn_007', fen: '4k3/2q5/8/4R3/8/8/8/4K3 w - - 0 1', solution: ['e5e7'], theme: 'pin', rating: 550, description: 'Rook pins queen to king.'),
    ChessPuzzle(id: 'pn_008', fen: 'r2qk2r/ppp1bppp/2n2n2/3p4/3P4/2N1BN2/PPP2PPP/R2QKB1R w KQkq - 0 1', solution: ['f1b5'], theme: 'pin', rating: 650, description: 'Pin the knight on c6 to the king.'),
    ChessPuzzle(id: 'pn_009', fen: '4k3/8/4n3/8/8/8/4R3/4K3 w - - 0 1', solution: ['e2e5'], theme: 'pin', rating: 500, description: 'Rook pins knight.'),
    ChessPuzzle(id: 'pn_010', fen: 'r1bqk2r/ppp2ppp/2np1n2/2b1p3/2B1P3/2NP1N2/PPP2PPP/R1BQK2R w KQkq - 0 1', solution: ['c1g5'], theme: 'pin', rating: 600, description: 'Pin knight to queen with Bg5.'),
    ChessPuzzle(id: 'pn_011', fen: '3qk3/3b4/8/8/3R4/8/8/3K4 w - - 0 1', solution: ['d4d7'], theme: 'pin', rating: 600, description: 'Rook pins bishop to queen.'),
    ChessPuzzle(id: 'pn_012', fen: '4kb2/4r3/8/8/8/4Q3/8/4K3 w - - 0 1', solution: ['e3a7'], theme: 'pin', rating: 550, description: 'Queen creates diagonal pin.'),
    ChessPuzzle(id: 'pn_013', fen: 'rnbqk1nr/pppp1ppp/8/4p3/1b2P3/5N2/PPPP1PPP/RNBQKB1R w KQkq - 0 1', solution: ['c2c3'], theme: 'pin', rating: 550, description: 'Break the pin on the knight.'),
    ChessPuzzle(id: 'pn_014', fen: '4k3/3n4/8/1B6/8/8/8/4K3 w - - 0 1', solution: ['b5c6'], theme: 'pin', rating: 500, description: 'Bishop pins knight to king.'),
    ChessPuzzle(id: 'pn_015', fen: '4k3/8/8/3qn3/8/8/8/4RK2 w - - 0 1', solution: ['e1e5'], theme: 'pin', rating: 650, description: 'Rook pins knight, wins queen.'),
  ];

  // ── Skewers (10 puzzles) ────────────────────────────────────

  static const skewers = [
    ChessPuzzle(id: 'sk_001', fen: '4k3/8/8/8/4R3/8/8/4K2q w - - 0 1', solution: ['e4e8'], theme: 'skewer', rating: 600, description: 'Rook skewers king, wins queen.'),
    ChessPuzzle(id: 'sk_002', fen: '4k3/8/4B3/8/8/8/8/4K2q w - - 0 1', solution: ['e6h3'], theme: 'skewer', rating: 700, description: 'Bishop skewers king and queen.'),
    ChessPuzzle(id: 'sk_003', fen: '4k3/8/8/4R3/8/8/8/4K1q1 w - - 0 1', solution: ['e5e8'], theme: 'skewer', rating: 600, description: 'Rook checks, then wins queen.'),
    ChessPuzzle(id: 'sk_004', fen: 'r7/8/8/8/4k3/8/8/4R1K1 w - - 0 1', solution: ['e1e4'], theme: 'skewer', rating: 600, description: 'Rook skewers king to rook.'),
    ChessPuzzle(id: 'sk_005', fen: '8/8/8/1k6/8/8/8/1R2Kq2 w - - 0 1', solution: ['b1b5'], theme: 'skewer', rating: 550, description: 'Rook check skewers to queen.'),
    ChessPuzzle(id: 'sk_006', fen: 'q7/1k6/8/8/8/8/8/B3K3 w - - 0 1', solution: ['a1f6'], theme: 'skewer', rating: 650, description: 'Bishop skewers king and queen.'),
    ChessPuzzle(id: 'sk_007', fen: '8/k7/8/8/8/8/8/R3K1q1 w - - 0 1', solution: ['a1a7'], theme: 'skewer', rating: 550, description: 'Rook checks, wins queen behind.'),
    ChessPuzzle(id: 'sk_008', fen: '4k3/4q3/8/8/4R3/8/8/4K3 w - - 0 1', solution: ['e4e7'], theme: 'skewer', rating: 600, description: 'Rook skewers queen through king.'),
    ChessPuzzle(id: 'sk_009', fen: '1k1r4/8/8/8/8/8/8/1Q2K3 w - - 0 1', solution: ['b1b8'], theme: 'skewer', rating: 550, description: 'Queen checks, wins rook.'),
    ChessPuzzle(id: 'sk_010', fen: '8/8/8/1k4r1/8/8/8/1R2K3 w - - 0 1', solution: ['b1b5'], theme: 'skewer', rating: 550, description: 'Rook skewers king and rook.'),
  ];

  // ── Mate in 2 (15 puzzles) ──────────────────────────────────

  static const mateInTwo = [
    ChessPuzzle(id: 'm2_001', fen: '6k1/5ppp/8/8/8/8/1Q3PPP/6K1 w - - 0 1', solution: ['b2b8', 'g8h7', 'b8g8'], theme: 'mate_in_2', rating: 800, description: 'Queen sacrifice then back rank.'),
    ChessPuzzle(id: 'm2_002', fen: 'r1bqkbnr/pppp1Qpp/2n5/4p3/2B1P3/8/PPPP1PPP/RNB1K1NR b KQkq - 0 1', solution: ['e8d8', 'f7f8'], theme: 'mate_in_2', rating: 750, description: "Scholar's mate continuation."),
    ChessPuzzle(id: 'm2_003', fen: '1k5r/ppp5/8/8/8/8/PPP5/1K1R4 w - - 0 1', solution: ['d1d8', 'h8d8', 'd8a8'], theme: 'mate_in_2', rating: 800, description: 'Exchange rooks then mate.'),
    ChessPuzzle(id: 'm2_004', fen: '6k1/5ppp/4p3/8/8/8/5PPP/4Q1K1 w - - 0 1', solution: ['e1a5', 'g8h8', 'a5a8'], theme: 'mate_in_2', rating: 850, description: 'Queen maneuvers to the back rank.'),
    ChessPuzzle(id: 'm2_005', fen: 'r5k1/5ppp/8/1Q6/8/8/5PPP/6K1 w - - 0 1', solution: ['b5e8', 'a8e8', 'e8g8'], theme: 'mate_in_2', rating: 800, description: 'Queen sacrifice for back rank.'),
    ChessPuzzle(id: 'm2_006', fen: '5rk1/pp3ppp/8/3Q4/8/8/PP3PPP/6K1 w - - 0 1', solution: ['d5g8', 'f8g8', 'g8f8'], theme: 'mate_in_2', rating: 850, description: 'Queen sac on g8 then Rf1#.'),
    ChessPuzzle(id: 'm2_007', fen: '2k5/ppp5/8/8/8/8/1Q6/4K3 w - - 0 1', solution: ['b2b7', 'c8d8', 'b7d7'], theme: 'mate_in_2', rating: 750, description: 'Queen infiltrates the 7th rank.'),
    ChessPuzzle(id: 'm2_008', fen: '6k1/pp3pp1/8/8/3B4/8/5PPP/6K1 w - - 0 1', solution: ['d4g7', 'g8g7', 'g7h8'], theme: 'mate_in_2', rating: 900, description: 'Bishop sacrifice for mate.'),
    ChessPuzzle(id: 'm2_009', fen: '2kr4/ppp5/8/8/8/1Q6/8/4K3 w - - 0 1', solution: ['b3b7', 'c8d8', 'b7d7'], theme: 'mate_in_2', rating: 750, description: 'Queen on 7th rank forces mate.'),
    ChessPuzzle(id: 'm2_010', fen: '6k1/5ppp/8/8/8/8/5PPP/2R3K1 w - - 0 1', solution: ['c1c8', 'g8h7'], theme: 'mate_in_2', rating: 700, description: 'Back rank mate attempt.'),
    ChessPuzzle(id: 'm2_011', fen: '1k6/ppp5/8/8/3Q4/8/8/4K3 w - - 0 1', solution: ['d4d8', 'b8a7', 'd8a5'], theme: 'mate_in_2', rating: 800, description: 'Queen drives king to the corner.'),
    ChessPuzzle(id: 'm2_012', fen: '3rkr2/8/8/8/8/8/1Q6/4K3 w - - 0 1', solution: ['b2b8', 'e8e7', 'b8d8'], theme: 'mate_in_2', rating: 850, description: 'Queen penetrates back rank.'),
    ChessPuzzle(id: 'm2_013', fen: '5k2/5P2/4K3/8/8/8/8/4R3 w - - 0 1', solution: ['e1e8', 'f8g7', 'f7f8q'], theme: 'mate_in_2', rating: 900, description: 'Rook check then promotion.'),
    ChessPuzzle(id: 'm2_014', fen: '6k1/5p1p/6pB/8/8/8/5P1P/6K1 w - - 0 1', solution: ['h6g7', 'g8g7'], theme: 'mate_in_2', rating: 750, description: 'Bishop sacrifice pattern.'),
    ChessPuzzle(id: 'm2_015', fen: 'r4rk1/pppb1ppp/8/3Q4/8/8/PPP2PPP/R4RK1 w - - 0 1', solution: ['d5g8', 'f8g8', 'f1f8'], theme: 'mate_in_2', rating: 900, description: 'Classic queen sac then rook mate.'),
  ];

  // ── Discovered Attacks (10 puzzles) ─────────────────────────

  static const discoveredAttacks = [
    ChessPuzzle(id: 'da_001', fen: '4k3/8/4q3/8/4N3/8/8/4RK2 w - - 0 1', solution: ['e4d6'], theme: 'discovered_attack', rating: 600, description: 'Knight moves, rook discovers on queen.'),
    ChessPuzzle(id: 'da_002', fen: '2k1r3/8/8/3N4/8/8/8/3RK3 w - - 0 1', solution: ['d5e7'], theme: 'discovered_attack', rating: 650, description: 'Knight discovers rook attack.'),
    ChessPuzzle(id: 'da_003', fen: '4k3/4r3/4N3/8/8/8/8/4RK2 w - - 0 1', solution: ['e6d4'], theme: 'discovered_attack', rating: 550, description: 'Knight discovers rook on king.'),
    ChessPuzzle(id: 'da_004', fen: '2k1q3/8/3B4/8/8/8/8/3RK3 w - - 0 1', solution: ['d6e5'], theme: 'discovered_attack', rating: 600, description: 'Bishop discovers rook attack.'),
    ChessPuzzle(id: 'da_005', fen: '4k3/4q3/8/3N4/8/8/4B3/4K3 w - - 0 1', solution: ['d5f6'], theme: 'discovered_attack', rating: 650, description: 'Knight check + bishop discovers on queen.'),
    ChessPuzzle(id: 'da_006', fen: 'r3k3/8/8/2N5/8/8/4B3/4K3 w - - 0 1', solution: ['c5d7'], theme: 'discovered_attack', rating: 600, description: 'Knight forks + discovered bishop.'),
    ChessPuzzle(id: 'da_007', fen: '3qk3/3p4/3N4/8/8/8/4R3/4K3 w - - 0 1', solution: ['d6f5'], theme: 'discovered_attack', rating: 650, description: 'Knight moves, rook hits queen.'),
    ChessPuzzle(id: 'da_008', fen: '4k3/8/8/1q1N4/8/8/4B3/4K3 w - - 0 1', solution: ['d5c7'], theme: 'discovered_attack', rating: 700, description: 'Double attack: knight check + bishop hits queen.'),
    ChessPuzzle(id: 'da_009', fen: 'r3k3/8/4N3/8/4B3/8/8/4K3 w - - 0 1', solution: ['e6c5'], theme: 'discovered_attack', rating: 600, description: 'Knight uncovers bishop on king.'),
    ChessPuzzle(id: 'da_010', fen: '4k3/3qr3/4N3/8/8/8/4R3/4K3 w - - 0 1', solution: ['e6g5'], theme: 'discovered_attack', rating: 650, description: 'Knight moves, rook discovers on rook.'),
  ];

  // ── Deflections (10 puzzles) ────────────────────────────────

  static const deflections = [
    ChessPuzzle(id: 'df_001', fen: '3rk3/8/8/8/8/8/8/R1Q1K3 w - - 0 1', solution: ['a1a8'], theme: 'deflection', rating: 650, description: 'Rook deflects the defending rook.'),
    ChessPuzzle(id: 'df_002', fen: '2r1k3/8/8/8/8/8/8/R1Q1K3 w - - 0 1', solution: ['a1a8'], theme: 'deflection', rating: 700, description: 'Deflect the rook from defending.'),
    ChessPuzzle(id: 'df_003', fen: '5rk1/5ppp/8/8/8/8/5PPP/3R2K1 w - - 0 1', solution: ['d1d8'], theme: 'deflection', rating: 650, description: 'Deflect or mate on back rank.'),
    ChessPuzzle(id: 'df_004', fen: 'r4rk1/5ppp/8/8/8/8/5PPP/R4RK1 w - - 0 1', solution: ['a1a8'], theme: 'deflection', rating: 700, description: 'Trade rook, then back rank mate.'),
    ChessPuzzle(id: 'df_005', fen: '3r2k1/5ppp/8/1Q6/8/8/5PPP/6K1 w - - 0 1', solution: ['b5d3'], theme: 'deflection', rating: 750, description: 'Queen eyes both d8 and g8 area.'),
    ChessPuzzle(id: 'df_006', fen: '6k1/3r1ppp/8/8/8/3Q4/5PPP/6K1 w - - 0 1', solution: ['d3d7'], theme: 'deflection', rating: 600, description: 'Take the defending rook.'),
    ChessPuzzle(id: 'df_007', fen: '1r4k1/5ppp/8/8/8/1Q6/5PPP/6K1 w - - 0 1', solution: ['b3b8'], theme: 'deflection', rating: 650, description: 'Queen invades the 8th rank.'),
    ChessPuzzle(id: 'df_008', fen: '4rrk1/5ppp/8/8/8/8/Q4PPP/4R1K1 w - - 0 1', solution: ['e1e8'], theme: 'deflection', rating: 700, description: 'Trade one rook, exploit back rank.'),
    ChessPuzzle(id: 'df_009', fen: '3r1rk1/5ppp/8/1Q6/8/8/5PPP/6K1 w - - 0 1', solution: ['b5d3'], theme: 'deflection', rating: 750, description: 'Force a deflection of a rook.'),
    ChessPuzzle(id: 'df_010', fen: 'r5k1/5ppp/8/8/8/8/Q4PPP/4R1K1 w - - 0 1', solution: ['e1e8'], theme: 'deflection', rating: 700, description: 'Rook sacrifice deflects the defender.'),
  ];

  // ── Promotion (10 puzzles) ──────────────────────────────────

  static const promotions = [
    ChessPuzzle(id: 'pr_001', fen: '8/4P1k1/8/8/8/8/8/4K3 w - - 0 1', solution: ['e7e8q'], theme: 'promotion', rating: 400, description: 'Simple promotion to queen.'),
    ChessPuzzle(id: 'pr_002', fen: '8/P7/8/8/8/8/8/k1K5 w - - 0 1', solution: ['a7a8q'], theme: 'promotion', rating: 450, description: 'Promote and win.'),
    ChessPuzzle(id: 'pr_003', fen: '5k2/5P2/5K2/8/8/8/8/8 w - - 0 1', solution: ['f7f8q'], theme: 'promotion', rating: 500, description: 'Promote with check.'),
    ChessPuzzle(id: 'pr_004', fen: '6k1/3P4/8/8/8/8/8/4K3 w - - 0 1', solution: ['d7d8q'], theme: 'promotion', rating: 450, description: 'Promote the d-pawn.'),
    ChessPuzzle(id: 'pr_005', fen: '8/1k3P2/8/8/8/8/8/4K3 w - - 0 1', solution: ['f7f8q'], theme: 'promotion', rating: 450, description: 'Promote and win easily.'),
    ChessPuzzle(id: 'pr_006', fen: '5k2/5P2/5K2/8/8/8/8/8 w - - 0 1', solution: ['f7f8n'], theme: 'promotion', rating: 750, description: 'Underpromote to knight for mate!'),
    ChessPuzzle(id: 'pr_007', fen: '8/2P5/8/8/8/8/k7/1K6 w - - 0 1', solution: ['c7c8q'], theme: 'promotion', rating: 400, description: 'Promote the c-pawn.'),
    ChessPuzzle(id: 'pr_008', fen: '1r6/P7/8/8/8/8/8/K7 w - - 0 1', solution: ['a7b8q'], theme: 'promotion', rating: 600, description: 'Capture and promote.'),
    ChessPuzzle(id: 'pr_009', fen: '8/5Pk1/8/8/8/8/8/6K1 w - - 0 1', solution: ['f7f8q'], theme: 'promotion', rating: 500, description: 'Promote with check!'),
    ChessPuzzle(id: 'pr_010', fen: '7k/6P1/5K2/8/8/8/8/8 w - - 0 1', solution: ['g7g8q'], theme: 'promotion', rating: 500, description: 'Promote and deliver mate.'),
  ];

  // ── Back Rank Themes (10 puzzles) ───────────────────────────

  static const backRankThemes = [
    ChessPuzzle(id: 'br_001', fen: '6k1/5ppp/8/8/8/8/5PPP/2R3K1 w - - 0 1', solution: ['c1c8'], theme: 'back_rank', rating: 500, description: 'Classic back rank mate.'),
    ChessPuzzle(id: 'br_002', fen: '3r2k1/5ppp/8/8/8/8/5PPP/3R2K1 w - - 0 1', solution: ['d1d8'], theme: 'back_rank', rating: 550, description: 'Exchange then back rank.'),
    ChessPuzzle(id: 'br_003', fen: 'r5k1/5ppp/8/8/8/8/5PPP/R5K1 w - - 0 1', solution: ['a1a8'], theme: 'back_rank', rating: 500, description: 'Rook invades the back rank.'),
    ChessPuzzle(id: 'br_004', fen: '1r4k1/5ppp/8/8/8/5Q2/5PPP/6K1 w - - 0 1', solution: ['f3f8'], theme: 'back_rank', rating: 550, description: 'Queen back rank mate.'),
    ChessPuzzle(id: 'br_005', fen: '2r3k1/5ppp/8/8/8/8/5PPP/2R1Q1K1 w - - 0 1', solution: ['c1c8'], theme: 'back_rank', rating: 600, description: 'Sacrifice rook then queen mates.'),
    ChessPuzzle(id: 'br_006', fen: '5rk1/pp3ppp/8/8/8/8/PP3PPP/4R1K1 w - - 0 1', solution: ['e1e8'], theme: 'back_rank', rating: 550, description: 'Back rank despite defending rook.'),
    ChessPuzzle(id: 'br_007', fen: '3r1rk1/5ppp/8/3Q4/8/8/5PPP/6K1 w - - 0 1', solution: ['d5d8'], theme: 'back_rank', rating: 600, description: 'Queen takes rook, other rook mates.'),
    ChessPuzzle(id: 'br_008', fen: '6k1/pp3ppp/8/8/1Q6/8/PP3PPP/6K1 w - - 0 1', solution: ['b4e7'], theme: 'back_rank', rating: 550, description: 'Queen on 7th threatens back rank.'),
    ChessPuzzle(id: 'br_009', fen: '2rr2k1/5ppp/8/8/8/8/5PPP/1R1R2K1 w - - 0 1', solution: ['d1d8'], theme: 'back_rank', rating: 600, description: 'Double rook back rank attack.'),
    ChessPuzzle(id: 'br_010', fen: 'r4rk1/5ppp/8/8/8/8/5PPP/R3R1K1 w - - 0 1', solution: ['e1e8'], theme: 'back_rank', rating: 600, description: 'Exchange rooks for back rank.'),
  ];
}
