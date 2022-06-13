class HubAppSvgAssets {
  static final HubAppSvgAssets _instance = HubAppSvgAssets._internal();

  factory HubAppSvgAssets() {
    return _instance;
  }

  HubAppSvgAssets._internal();

  Map<AssetName, String> assets = {
    AssetName.search: "assets/icons/search.svg",
    AssetName.vectorBottom: "assets/pics/Vector.svg",
    AssetName.vectorTop: "assets/pics/Vector-1.svg",
    AssetName.headphone: "assets/icons/headphone.svg",
    AssetName.tape: "assets/icons/tape.svg",
    AssetName.vectorSmallBottom: "assets/pics/VectorSmallBottom.svg",
    AssetName.vectorSmallTop: "assets/pics/VectorSmallTop.svg",
    AssetName.back: "assets/icons/back.svg",
    AssetName.heart: "assets/icons/heart.svg",
    AssetName.chart: "assets/icons/chart.svg",
    AssetName.discover: "assets/icons/discover.svg",
    AssetName.profile: "assets/icons/profile.svg",
  };
}

enum AssetName {
  search,
  vectorBottom,
  vectorTop,
  headphone,
  tape,
  vectorSmallBottom,
  vectorSmallTop,
  back,
  heart,
  chart,
  discover,
  profile
}
