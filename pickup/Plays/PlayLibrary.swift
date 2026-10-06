import Foundation

enum PlayLibrary {
    static let allPlays: [Play] = [
            doubleDrag,
            pistolChicago
    ]
    static let doubleDrag = Play(
        id: "double-drag",
        name: "Double Drag",
        altNames: ["77"],
        tags: [.ballScreen],
        description: "A double drag is a 3-man screen action. Because three (or more) defenders must move in sync, it’s tough to guard. From the defense’s point of view, the corner help defender (x4) is in a tough spot. He has to decide whether to stay with his matchup or help on the roll. If x4 helps on the roll, there's usually no natural rotation behind him unless the defense communicates early and perfectly. Because of that, the corner shooter is often left wide open.",
        diagrams: [
            PlayDiagram(id: 1, imageName: "Double Drag - Phase 1", playerInstructions: [
                .one: "1 receives screens from 2 and 5. After the first screen, read the court. A split might be available immediately.",
                .two: "2 pops.",
                .three: "Be ready for a quick catch and shoot.",
                .four: "Be ready for a quick catch and shoot.",
                .five: "5 rolls. If nothing is open right away, 5 can re-screen for 1, or set an off-ball screen for 2 for a quick catch-and-shoot 3."
            ])
        ]
    )
    
    static let pistolChicago = Play(
        id: "pistol-chicago",
        name: "Pistol Chicago",
        altNames: [],
        tags: [.backdoor, .handoff],
        description: "This play is a Chicago action disguised with an early Pistol setup. There are several backdoor opportunities built into the play, and because there are so many moving parts, it's tough for the defense to help or switch cleanly. Timing is very important for this play to work.",
        diagrams: [
            PlayDiagram(id: 1, imageName: "Pistol Chicago - Phase 1", playerInstructions: [
                .one: "1 passes to 3 and cuts to the opposite corner.",
                .two: "...",
                .three: "...",
                .four: "...",
                .five: "..."
            ]),
            PlayDiagram(id: 2, imageName: "Pistol Chicago - Phase 2", playerInstructions: [
                .one: "At the same time as 2 backdoor cuts, 1 sprints up to the top of the key and receives a handoff from 5.",
                .two: "As soon as the pass is made, 2 backdoor cuts and becomes a scoring option. If the backdoor isn’t there, 2 immediately sets a back screen for 4. 2 must always be a backdoor threat first.",
                .three: "3 passes to 5 at the top of the key.",
                .four: "Be ready for a back screen from 2.",
                .five: "Hand off ball to 1."
            ]),
            PlayDiagram(id: 3, imageName: "Pistol Chicago - Phase 3", playerInstructions: [
                .one: "Because of the off-ball action, the defense will struggle to help the handoff, so it will be difficult for anyone to become the low man on 1’s drive.",
                .two: "2 pops out to the perimeter.",
                .three: "...",
                .four: "4 uses the backscreen and rolls hard to the rim.",
                .five: "..."
            ])
        ]
    )
}
