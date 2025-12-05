import Testing
@testable import Junios

struct JuniosTests {

    @Test func 플러스원테스트() async throws {
        // Given
        let sut = HelloModel()
        
        // When
        let result = sut.plusOne(to: 1)
        
        // Then
        #expect(result == 2)
    }

}
