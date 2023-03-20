class WalletController < ApplicationController
  # curl http://localhost:3001/wallets
  def index
    render json: Wallet.all.to_json
  end

  # curl -X POST http://localhost:3001/wallets
  def create
    render json: Wallet.create(balance_cents: 0, user: current_user)
  end

  # curl -d '{"amount":150.25}' -H "Content-Type: application/json" -X PATCH http://localhost:3001/wallet/1/debit
  def debit
    wallet = Wallet.find(params[:id])
    wallet.balance_cents -= params[:amount]
    wallet.save
    render json: wallet.to_json
  end

  # curl -d '{"amount":150.25}' -H "Content-Type: application/json" -X POST http://localhost:3001/wallet/1/credit
  def credit
    wallet = Wallet.find(params[:id])
    wallet.balance_cents += params[:amount]
    wallet.save
    render json: wallet.to_json
  end
end
