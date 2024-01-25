#define SKILL_UNSKILLED   1
#define SKILL_BASIC       2
#define SKILL_TRAINED     3
#define SKILL_EXPERIENCED 4
#define SKILL_MASTER      5
#define HAS_PERK          SKILL_UNSKILLED + 1

/// Min skill value selectable
#define SKILL_MIN      SKILL_UNSKILLED
/// Max skill value selectable
#define SKILL_MAX      SKILL_MASTER
/// Default skill value for mobs
#define SKILL_DEFAULT  SKILL_EXPERIENCED
/// Baseline skill level used for determining mechanical skill multipliers.
#define SKILL_BASELINE SKILL_TRAINED

#define SKILL_EASY     SKILL_UNSKILLED
#define SKILL_AVERAGE  SKILL_BASIC
#define SKILL_HARD     SKILL_EXPERIENCED

#define SKILL_BUREAUCRACY   /decl/hierarchy/skill/organizational/bureaucracy
#define SKILL_FINANCE       /decl/hierarchy/skill/organizational/finance
#define SKILL_EVA           /decl/hierarchy/skill/general/EVA
#define SKILL_PILOT         /decl/hierarchy/skill/general/pilot
#define SKILL_HAULING       /decl/hierarchy/skill/general/hauling
#define SKILL_COMPUTER      /decl/hierarchy/skill/general/computer
#define SKILL_BOTANY        /decl/hierarchy/skill/service/botany
#define SKILL_COOKING       /decl/hierarchy/skill/service/cooking
#define SKILL_COMBAT        /decl/hierarchy/skill/security/combat
#define SKILL_WEAPONS       /decl/hierarchy/skill/security/weapons
#define SKILL_FORENSICS     /decl/hierarchy/skill/security/forensics
#define SKILL_CONSTRUCTION  /decl/hierarchy/skill/engineering/construction
#define SKILL_ELECTRICAL    /decl/hierarchy/skill/engineering/electrical
#define SKILL_ATMOS         /decl/hierarchy/skill/engineering/atmos
#define SKILL_ENGINES       /decl/hierarchy/skill/engineering/engines

#define SKILL_DEVICES       /decl/hierarchy/skill/research/devices
#define SKILL_ARMAMENT      /decl/hierarchy/skill/security/armament
#define SKILL_MECH          /decl/hierarchy/skill/research/devices/mech

#define SKILL_SCIENCE       /decl/hierarchy/skill/research/science
#define SKILL_MEDICAL       /decl/hierarchy/skill/medical/medical
#define SKILL_ANATOMY       /decl/hierarchy/skill/medical/anatomy
#define SKILL_CHEMISTRY     /decl/hierarchy/skill/medical/chemistry