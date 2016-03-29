import Castle from 'castle';
import Character from 'character'


// isCharacterInCastle : Character -> Castle -> Bool
function isCharacterInCastle (character) {
  return function (castle) {
    return Castle.hasCharacter(character, castle);
  };
}


// isPrincessInCastle : Castle -> Bool
function isPrincessInCastle (castle) {
  return isCharacterInCastle(Character.princess)(castle);
}


// castlesWithPrincess : List Castle
function castlesWithPrincess () {
  return Castle.allCastles
    .filter(isPrincessInCastle);
}


// main : Html
function main() {
    return (
      <div>
        ({ castlesWithPrincess.map(Castle.view) })
      </div>
    );
}
