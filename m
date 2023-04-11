Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD8CC7619A
	for <ath11k@archiver.kernel.org>; Tue, 11 Apr 2023 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7qnoZ4k3YALg2Gwi7EXPgid2ju0pw/Armr/+C1u3zA=; b=HQmjDclxqEaDYZ
	EoUvE4WWT065EvTSemcdnsXUSMOEtOdWQQI54ltuup8an31YGHp+s4qP+TzGazBcAyfK6wDnbHhhR
	V5LkEIDt0wen28NskXv+/O04mz6+k16j+QpJV8wHsM1GpCRQ626NaFguRtay/v0qvx1dI1N2FsOHN
	Jj6+6be5JRPSPdrHdc1tmYWfu+cEQ2JVyZ6W3IIlGGLAEdLxrOVjHx89a/TfYHas8S7NmnqOIQTYd
	n36mI05mPCyCxhz67t9wOfroi3ISOQ6rVNgw5uSIqQ8hS2Mwflf41n6Yz0iCaCdixktid00kRH3d7
	8JTzDcOXO2/4x0WNymMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm8ae-00Gkeu-2s;
	Tue, 11 Apr 2023 07:38:56 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm8ab-00Gkdy-1s
	for ath11k@lists.infradead.org;
	Tue, 11 Apr 2023 07:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=WwqqQpPTcJ4Oo+IPITxQIyJ74zb7uiwV/oXajxDHbyI=;
	t=1681198733; x=1682408333; b=fnUN/7ilwfvmnC7PCs6RSCmHxHinw5pFoN/C02EJ+w5r/Pq
	bkEGqubRmxhQ2l1K2unT8RUbQBmpvQlMbqiZU2CzSfSe33gRqqc4ISbHhVQCX7yLLyzFqPnCCne/S
	bb4grx7Sie2iyDjPyvjoX7ewhMu2SlvjdSz/ax7szot0uUeNwBpEhJoQDdCtdjy9IebT4Jzgq5sjl
	QB6iU7MrKDR0SDwRaEpLfIICcghyFGu0Xq+RalDG+j7F5SzoZeD9KA6jLsyouxapvPUzZZKSSSoyW
	Jw/pL8i2/0N69vYaSumMUDa93CoEJynHf7xxUIBsx5b1dbCKP3+XoEr9p9WhRQ4g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pm8aW-00CdQi-2u;
	Tue, 11 Apr 2023 09:38:48 +0200
Message-ID: <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Tue, 11 Apr 2023 09:38:48 +0200
In-Reply-To: <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
	 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
	 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_003853_617449_A5D684E1 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCAyMDIzLTA0LTA0IGF0IDExOjI4ICswODAwLCBXZW4gR29uZyB3cm90ZToKPiAKPiBN
YXkgSSBhbHNvIGFkZCBhIGZpZWxkIHN1Y2ggYXMgInUxNiBhY3RpdmVfbGlua3NfY291bnQiIGlu
IHN0cnVjdCAKPiB3aXBoeV9pZnR5cGVfZXh0X2NhcGFiLAo+IGFuZCBhZGQgbG9naWMgaW4gZnVu
Y3Rpb24gaWVlZTgwMjExX3NldF92aWZfbGlua3NfYml0bWFwcygpIGZvciBzdGF0aW9uIAo+IGxp
a2UgdGhpcyA/Ogo+IGlmIChhY3RpdmVfbGlua3NfY291bnQgJiYgaHdlaWdodDE2KGxpbmtzKSA8
PSBhY3RpdmVfbGlua3NfY291bnQpCj4gIMKgwqDCoCB0aGVuIHNkYXRhLT52aWYuYWN0aXZlX2xp
bmtzID0gbGlua3M7Cj4gCgpBbHNvIGhlcmUsIG5vdCBzdXJlIGl0IG1ha2VzIHNlbnNlIGluIGNm
ZzgwMjExIGxldmVsPwoKVGhvdWdoIEknbSBub3Qgc3VyZSB3aGF0IHRoZSBpZGVhIGhlcmUgaXMg
YXQgYWxsIC0geW91IGNhbiByZWZ1c2UgdG8KbGluayBzd2l0Y2ggZXRjLCB3aGF0IHdvdWxkIHlv
dSB1c2UgdGhpcyBmb3I/CgpUaGVuIGFnYWluLCB3ZSBoYXZlbid0IHJlYWxseSBkZXNpZ25lZCBv
dXQgYWxsIHRoZSBsaW5rIHNlbGVjdGlvbiBzdHVmZiwKZG8gd2Ugd2FudCB3cGFfcyB0byBkbyBp
dCwgZHJpdmVyIHRvIGRvIGl0LCBldGMuPyBIZW5jZSBkZWJ1Z2ZzLiBTbwpkZXBlbmRpbmcgb24g
d2hhdCBlbmQgdXAgZG9pbmcgdGhlcmUsIHdlIHdpbGwgb2J2aW91c2x5IG5lZWQgdG8KYWR2ZXJ0
aXNlIHNvbWUgbGV2ZWwgb2YgbGluay1jb25jdXJyZW5jeSB0byB1c2Vyc3BhY2UuCgpqb2hhbm5l
cwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
