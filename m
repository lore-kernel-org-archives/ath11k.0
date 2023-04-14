Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FA3C77B6E
	for <ath11k@archiver.kernel.org>; Fri, 14 Apr 2023 05:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+w/EVg60hz2lh0jfwzGei1ZCGhlRrDYxJle0Ughsm3A=; b=TZ/X9sfNUVZQOa
	Tx+9aKvisUPwroCZC7OdF+e1OlICv7/KfMPMStIAY1LnU8GRwjGtu9616k2puHBCCfCbkkh6ChZTF
	zYKgfMWb3tuWDEASYlqnGxdyfU1U6WpFAs3iaEyfebiM2D3xTR2IXCGCeO0iX5b4nHIyOvBfnONjs
	1uQ9RiTuZR/nD5XVzunDhI7aH4EisAZfB8/fyEe2S5d/w9M/CAm3suWg42T0taYBfEG+BM9vXPn2G
	UwJZJdpqI/BbCJl2tzPlaZDpZkdWYrRgI63PDixH1TxWqORFM3TroqvwBCABa+Q/8a2vAMzeFMm2k
	KFSJPelUe7MN1NKlT6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnBpR-008LXK-0J;
	Fri, 14 Apr 2023 05:18:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnBpL-008LVs-0X
	for ath11k@lists.infradead.org;
	Fri, 14 Apr 2023 05:18:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26C22643F8;
	Fri, 14 Apr 2023 05:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC1DC433D2;
	Fri, 14 Apr 2023 05:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681449505;
	bh=0jfh+3jf1drwBWCy/08jc6sPYtyF0xx9YjsPtAEc8ys=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pgKaaAkvsJ0h++J7SoVft7yIFdVtqbR5H+O0bWh58dEUmNJyrQSMOlged5bDMwKcY
	 xiVzkoXQm71mQ+VMAans1M9F82dq8HtyRruWVln1cApGkgcheKWUpqt6x1GggqxGG3
	 vlUmrBEcEskACPyEoa76sl9ftY5orTVz2UCgHAry1k5ywhBLas68j/z+KaOBScIas0
	 5doXbTge5cjztzkGq1wXoy9fXwh3ilH5r5WwgiDkPKLbpN30TGBjuTNzAUYkbL/fYA
	 TrlZY+NpFD8B98UFNMoU6ZMDYWgyeNBKPRhemcrftAannf0rF72tzHQLYRFS2UHIL+
	 MoLrB368XutNA==
From: Kalle Valo <kvalo@kernel.org>
To: "Muna Sinada \(QUIC\)" <quic_msinada@quicinc.com>
Cc: Robert Marko <robert.marko@sartura.hr>,  "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "Anilkumar Kolli \(QUIC\)" <quic_akolli@quicinc.com>
Subject: Re: [PATCH v2 2/4] wifi: ath11k: push MU-MIMO params from hostapd to hardware
References: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
	<1666128501-12364-3-git-send-email-quic_msinada@quicinc.com>
	<CA+HBbNHw-0+Ty_-masxGKwT6ju_EBxT3n5B0Ygcn3XzQi_CzWg@mail.gmail.com>
	<87fs9ndh6s.fsf@kernel.org>
	<CA+HBbNEaNTkUv_UPgQievxaLya0XC6=AVj0=GWiH+qB9=vRZHg@mail.gmail.com>
	<87bkkbdcfu.fsf@kernel.org> <87pm8iaggt.fsf@kernel.org>
	<BY5PR02MB6164BAC2A418B3C5462C2C348F9B9@BY5PR02MB6164.namprd02.prod.outlook.com>
Date: Fri, 14 Apr 2023 08:18:21 +0300
In-Reply-To: <BY5PR02MB6164BAC2A418B3C5462C2C348F9B9@BY5PR02MB6164.namprd02.prod.outlook.com>
	(Muna Sinada's message of "Wed, 12 Apr 2023 23:19:49 +0000")
Message-ID: <87mt3b6nz6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_221827_294489_D460D4B5 
X-CRM114-Status: GOOD (  17.88  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Ik11bmEgU2luYWRhIChRVUlDKSIgPHF1aWNfbXNpbmFkYUBxdWljaW5jLmNvbT4gd3JpdGVzOgoK
PiBNdW5hIFNpbmFkYSA8cXVpY19tc2luYWRhQHF1aWNpbmMuY29tPiB3cml0ZXM6Cj4+IEthbGxl
IFZhbG8gPGt2YWxvQGtlcm5lbC5vcmc+IHdyaXRlczoKPj4+IFJvYmVydCBNYXJrbyA8cm9iZXJ0
Lm1hcmtvQHNhcnR1cmEuaHI+IHdyaXRlczoKPj4+Cj4+Pj4gT24gV2VkLCBNYXIgMjksIDIwMjMg
YXQgMTE6NDXigK9BTSBLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPiB3cm90ZToKPj4+Pgo+
Pj4+PiA+PiBAQCAtNTM2OSw2ICs1NDkxLDEwIEBAIHN0YXRpYyBpbnQgYXRoMTFrX21hY19jb3B5
X2hlX2NhcChzdHJ1Y3QgCj4+Pj4+ID4+IGF0aDExayAqYXIsCj4+Pj4+ID4+Cj4+Pj4+ID4+ICAg
ICAgICAgICAgICAgICBoZV9jYXBfZWxlbS0+bWFjX2NhcF9pbmZvWzFdICY9Cj4+Pj4+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAgIAo+Pj4+PiA+PiBJRUVFODAyMTFfSEVfTUFDX0NBUDFfVEZf
TUFDX1BBRF9EVVJfTUFTSzsKPj4+Pj4gPj4gKyAgICAgICAgICAgICAgIGhlX2NhcF9lbGVtLT5w
aHlfY2FwX2luZm9bMF0gJj0KPj4+Pj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgfklFRUU4
MDIxMV9IRV9QSFlfQ0FQMF9DSEFOTkVMX1dJRFRIX1NFVF8xNjBNSFpfSU5fNUc7Cj4+Pj4+ID4+
ICsgICAgICAgICAgICAgICBoZV9jYXBfZWxlbS0+cGh5X2NhcF9pbmZvWzBdICY9Cj4+Pj4+ID4+
ICsgICAgICAgICAgICAgICAgICAgICAgIAo+Pj4+PiA+PiArIH5JRUVFODAyMTFfSEVfUEhZX0NB
UDBfQ0hBTk5FTF9XSURUSF9TRVRfODBQTFVTODBfTUhaX0lOXzVHOwo+Pj4+PiA+Cj4+Pj4+ID4g
VGhpcyBpcyBjYXVzaW5nIGEgcmVncmVzc2lvbiBmb3IgdXMgaW4gT3BlbldydCBhdCBsZWFzdCBv
biBJUFE4MDc0IAo+Pj4+PiA+IGJ1dCBwcm9iYWJseSBvbiBhbGwgYXRoMTFrLXN1cHBvcnRlZCBI
Vy4gQ2F1c2UgODArODAgYW5kIDE2ME1IeiAKPj4+Pj4gPiBzdXBwb3J0IGJpdHMgYXJlIGJlaW5n
IGNsZWFyZWQgaGVyZSBzbyAxNjBNSHogaXMgbm90IGJlaW5nIAo+Pj4+PiA+IGFkdmVydGlzZWQg
YWZ0ZXIgdGhpcyBwYXRjaC4KPj4+Pj4KPj4+Pj4gT2ggbWFuLCBub3QgZ29vZC4gUm9iZXJ0LCBz
aG91bGQgd2UgcmV2ZXJ0IHRoaXMgcGF0Y2hzZXQgZW50aXJlbHk/IAo+Pj4+PiBPZiBjb3Vyc2Ug
aXQgd291bGQgYmUgYmV0dGVyIGlmIE11bmEgY2FuIHN1Ym1pdCBxdWlja2x5IGEgZml4LCBidXQg
Cj4+Pj4+IEknbSBub3QgZ29pbmcgdG8gd2FpdCBmb3IgbG9uZy4KPj4+Pgo+Pj4+IEkgd291bGQg
cHJlZmVyIHRvIHNlZSBpdCBnZXQgZml4ZWQsIGNhdXNlIGp1c3QgcmVtb3ZpbmcgdGhlIGZsYWcg
Cj4+Pj4gcmVtb3ZhbCBnZXRzIDE2ME1IeiB3b3JraW5nLCBidXQgSSBhbSBub3Qgc3VyZSBhYm91
dCBvdGhlciBmbGFncyBhcyAKPj4+PiB3ZWxsLgo+Pj4KPj4+IE9rLCBsZXQncyB0cnkgdG8gZ2V0
IGl0IGZpeGVkIHRoZW4uIE11bmEsIGNhbiB5b3UgY29tbWVudCBhbmQgc2VuZCBhIAo+Pj4gZml4
IEFTQVA/Cj4+Cj4+Tm8gcmVwbHkgZnJvbSBNdW5hLiBJJ2xsIHRyeSB0aGUgbmV3IGJ1Z2JvdCB0
byBvcGVuIGEgYnVnIGZvciB0aGlzIHJlZ3Jlc3Npb246Cj4+Cj4+YnVnYm90IG9uCj4KPiBJIGhh
dmUgY3JlYXRlZCBmaXgsIHRlc3RlZCBpdCBhbmQgcHVzaGVkIGludGVybmFsbHkgZm9yIHJldmll
dy4KPgo+IEBLYWxsZSwgaG93IGRvIEkgZ28gYWJvdXQgY29udGludWluZyB0aGUgY29udmVyc2F0
aW9uIG9uIEJ1Z3ppbGxhPwoKQmV0dGVyIHRvIGNvbnRpbnVlIHRoZSBkaXNjdXNzaW9uIG9uIHRo
ZSBsaXN0LiBJIG9ubHkgY3JlYXRlZCB0aGUgYnVnIG9uCkJ1Z3ppbGxhIHNvIHRoYXQgSSBkb24n
dCBmb3JnZXQgdGhpcyBhcyBJIGRpZG4ndCBoZWFyIGFueXRoaW5nIGZyb20geW91LgoKLS0gCmh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoK
aHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0
aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDExawo=
