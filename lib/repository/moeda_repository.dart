import '../models/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
        icone: "images/bitcoin.png",
        nome: "Bitcoin",
        sigla: "BTC",
        preco: 1234567),
    Moeda(
        icone: "images/cardano.png",
        nome: "Cardano",
        sigla: "CDN",
        preco: 8293764),
    Moeda(
        icone: "images/ethereum.png",
        nome: "Ethereum",
        sigla: "ETH",
        preco: 9823561),
    Moeda(icone: "images/xrp.png", nome: "XRP", sigla: "XRP", preco: 2381763),
    Moeda(
        icone: "images/usdcoin.png",
        nome: "UsdCoin",
        sigla: "USD",
        preco: 1243212),
    Moeda(
        icone: "images/litecoin.png",
        nome: "LiteCoin",
        sigla: "LTC",
        preco: 8732146),
  ];
}
