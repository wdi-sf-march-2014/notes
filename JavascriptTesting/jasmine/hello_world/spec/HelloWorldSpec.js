describe("HelloWorld", function() {
  it("should be able to say hello to Mary", function() {
    var response = HelloWorld('Mary');
    expect(response).toEqual('Hello Mary!');
  });
});
