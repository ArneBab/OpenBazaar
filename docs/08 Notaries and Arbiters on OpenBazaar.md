# Notaries, Third Party Abitration, and Polycentric Law in *OpenBazaar*

<img src="http://s29.postimg.org/82z3qgz87/Open_Bazaar_Banner.png" width="800px"/>

## Introduction

Thus far the proposals for various market implementations within *OpenBazaar* have assumed that the third party in a transaction (signer #3 in a 2-of-3 multisignature escrow address) performs two roles: a notary, and an arbiter. The notary aspect of their service includes digitally signing contracts and transactions, the latter in the event of a dispute between the buyer seller. The arbitration aspect of their role is to decide who the winning side is in a dispute between the buyer and seller. However, this overlapping notary-arbiter model is prone to several weakenesses:

- There is a conflict of interest between the arbiter and disputing parties
- There is a practical burden on a single agent to perform all of these tasks simultaneously for potentially dozens/hundreds of transactions
- Finding the best arbiter is potentially diluted while considering notary services from the same agent 

A possible solution to these weaknesses is to introduce a new agent, a notary, to focus exclusively on signing Ricardian contracts and creating/signing multisignature transactions, leaving dispute resolution as an independent service on *OpenBazaar*.

## Notaries: Contract and Transaction Signing

> The ideal third party will be professional, knowledgeable about the technology and security protocols, and independent of business operations. Why are these characteristics important? Professionalism is important because the third party will be your backup to access funds in the event a signer becomes unavailable. The third party should be reliable, available upon short notice, communicative, and responsive. The third party must be knowledgeable in the technology, have a thorough understanding of how to use multi-signature accounts, and best practices for security – such as offline key generation and storage. They should understand principles of conflict of interest and be able to maintain a distance from operations, so that they will not be subject to coercion or other undue influence. A disinterested third party also provides investors, employees, and the community with an increased level of protection thereby justifying an increased confidence in operations as evidence of good corporate governance.

*- Pamela Morgan: [Multi-signature accounts for corporate governance](http://empoweredlaw.wordpress.com/2014/05/25/multi-signature-accounts-for-corporate-governance/)*

The above quote is from an excellent article written by Pamela Morgan on the use of multisignature addresses for managing risk in corporate governance, which is applicable to the dyanmics between buyers and sellers on *OpenBazaar* that are further explored below.

### Responsibilities

A notary's responsiblities include:

1. *Digital signing* Ricardian contracts created by two parties
	- Triple-signing: the third signature in triple-entry accounting
2. Creation of the multisignature escrow address from the buyer, seller's and their own bitcoin pubkey
3. Releasing funds from a multisignature address as a result of a late-signing party (*lazy transactions*)
4. Releasing funds from a multisignature address based on the verdict of an arbiter's judgement from a dispute between the buyer and seller
	- These services may include facilitating the selection of an arbiter and presentation of the triple-signed contract

Given the role that notaries will play in exchanges in *OpenBazaar*, their services would need to be available essentially 24/7. Of the responsibilities listed above, the first two can be entirely automated and do not require any human interaction from the notary.

### Fees

It is unlikely that any human interaction from the notary will be necessary in most cases, where 2-of-3 multisignature transactions are handled by the buyer and seller directly. These automated services could theroetically be provided for free and subsidised by fees charged as a result of engaing the notary to fulfil responsibilties 3-4 above. We predict that the fee structure for these *paid services* will be somewhere between a bitcoin transaction free and a few dollars, which is a fraction of the cost found in legacy online commerce platforms.

### Advantages and Potential Challenges

There are several advantages to using a dedicated notary service for 3rd party contract and transaction signing. Firstly, and perhaps most importantly, there is an effective separation between the power to release funds from a multisignature escrow address, and dispute resolution between two parties. As a result, notary and arbitration services can be independently assessed and rated for their efficiency. Secondly, there is a market created for notary services for the timely fulfilment of their obligations in a trade, especially triple-signing Ricardian contracts and creation of a multisignature escrow address. In the event of a dispute, the final cost in fees and time is slightly higher than in a role where notary and arbitration services overaly within a single agent. However, the increase in dispute costs may incentivise greater care in arranging exchanges within *OpenBazaar* to specifically avoid these fees.

## Practical Implementation into *OpenBazaar*

How will the separation of notary and arbitration services into separate agents affect the end-user experience and overall mechanics of a transactions? Firstly, similar to the original model, the end-user will need to begin their *OpenBazaar* experience by selecting preferred notary service providers for all future transactions. Ideally, the client will select a notary service provider that is present on both the buyer and seller's list of preferred notaries. Failing this, the client can randomly select a notary agent based on their [reputation metrics](https://gist.github.com/dionyziz/e3b296861175e0ebea4b).

Secondly, the notary is involved once a Ricardian contract is double-signed (i.e. digitally signed by the buyer and seller) in order to have the contract *triple-signed* and create the multisignature escrow address. Therefore, the double-signed contract would simply be sent to a dedicated notary rather than an arbiter that also functions as a notary. In the absence of a dispute or delay in the signing the multisignature transaction, the notary is no longer required.

In the event of a dispute, the notary is informed by one or both of the parties that a dispute has arisen and that arbitration is required. The arbiter can be selected by:

1. The client: choosing from overlapping preferred arbiters from the buyer and seller, similar to the selection of notaries
2. Randomly: also by the client according to the arbiter's *reputation metrics*
3. The notary: this is possible but **not recommended** due to a potential conflict
4. Voting/jury pool: the buyer and seller submit an equal number of preferred arbiters for the creation of a voting/jury pool.

The verdict of the arbiter or voting/jury pool of arbiters may come in the form of the triple-signed contract appended with verdict and statement (formatted in JSON) appended and digitally signed. From here, the notary creates a transaction deducting the appropriate fees, signs it and sends it to the winning party for signing and broadcasting to the bitcoin network. 

Finally, for high value transactions, multiple notaries can be used following the voting pool model [described for arbiters](https://gist.github.com/drwasho/c04f16fcc7be9a666e90). 

## Market Freedom

It is important to emphasise that the use of notaries is completely optional to the end-user. The *OpenBazaar* platform will be one of the most open, flexible, and secure commerce platforms to date. The market will select the most efficient means to manage risk and arbitration for trades within *OpenBazaar*. There is nothing to prevent a hybrid approach being adopted where arbiters could fulfil both functions under certain or no conditions at all. Ultimately, it will be up to the exchanging parties as to where the double-signed Ricardian contract is sent to and the risk they are prepared to accept by selecting either: a dedicated notary, or a notary-arbiter hybrid.

## Conclusion

In summary, the function of the notary and arbiter can be assigned to two separate agents for transactions in *OpenBazaar* with minimally disruptive changes to the end-user experience and the client.
