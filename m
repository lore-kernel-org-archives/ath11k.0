Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAB9C433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 07:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHlkS6HZvFhgXu5DokH/+2KFTPsMEjWUoAeeKa1+Eig=; b=rd5obrU5C6nUQQ
	AsdzJsfpVEvhqzmaF8SLVJgK9udOTebO8uE5biL8UlnBTstvVM5J+zZPrC1gX+cI0yFB3r0vfrH15
	wboC7NYuZ1veGn0w1z9hZZVkcH10BxlcgArHXNpsV6tf1UYa1oVe7yunE/gSv5jjNl3URz6RjbrR9
	1yTXmauFlMl0sWApe1ofo8RvdfXIkz5xg8RDOjoRdJpa4nMTr68DJ5YvRNfd1B8PTECyeUyJQfvMs
	eK8JmkS0UqpSrtVXwk5in8zlgJotyzh6FewnPWKcVf11BgH589UFX04SKJDjejNdf+ZoHy4U0iQT6
	C2Rn72aTSy8uAEp0YAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9fO-003a9w-K4; Tue, 11 Oct 2022 07:27:06 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9fL-003a8q-OG
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 07:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=wXvmb5jXrcLN6sR1/eCh8edF92ghBU2PeyOgob5hdWY=;
	t=1665473220; x=1666682820; b=HUB0jCnw9XprcJ7hjMWuU3OB1U3FvvOxaokjmV7rCvqDRY/
	OE5TTaUM6VJlCbKlvPdqSLOBaqE88b4NDFvfb2aHWeq4kqf6912Wfngsx82eabm1Sui3P6+FNosgp
	V+HiypT/a+jPAsEIVe2vy0p52c1IaAyn9DgFndvsVeIpcx1cWDmri7dWJsojhz2wTyFAiFbuLn90I
	37TYVJO2r6hXLDS6j2L+JoUthDf8mDfs05nmH1CravZuWE6/BiIjMsslXl9ZP2MU6C+LLakQ2U+sz
	ngHPhY8u94R10LgxrQZykMiAZQxUT9iRehWXhSAQQNyjhGxxHkcYA4dR50Zy1+GQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oi9fC-003s4e-1e;
	Tue, 11 Oct 2022 09:26:55 +0200
Message-ID: <37958ca93039114b98909d730ff57dd1d10bb68d.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Tue, 11 Oct 2022 09:26:53 +0200
In-Reply-To: <5765e3c5-46d4-e92b-a93b-4a2649acff2a@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
	 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
	 <2de44394-cb93-7be4-481f-2d92788b8d28@quicinc.com>
	 <351f74e0e1cd6e9724f97dbd042bdc5e04c44842.camel@sipsolutions.net>
	 <c05780bc-864c-9323-499d-a8b1ba1c2ef2@quicinc.com>
	 <545227cf18baac94ea8aa24dc08b250c47949541.camel@sipsolutions.net>
	 <c7fd18fa-531f-a90d-a8fb-442a5aa66d7d@quicinc.com>
	 <d1fda46a-2481-8e05-e0a5-9f2bd3850ff4@quicinc.com>
	 <868131d13ed7c4c8b5d4938adcd71cf1ff8e9677.camel@sipsolutions.net>
	 <5765e3c5-46d4-e92b-a93b-4a2649acff2a@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_002703_803595_AC559723 
X-CRM114-Status: GOOD (  10.45  )
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

T24gVHVlLCAyMDIyLTEwLTExIGF0IDEyOjA3ICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiA5
LzI4LzIwMjIgMTE6MjggUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gLi4uCj4gPiAKPiA+ID4g
TWF5IEkga25vdyBzb21lIG1vcmUgaW5mby9zdGF0dXMgYWJvdXQgdGhlICJpbmNvbWluZ8KgIG5l
dyBtZXRob2QgdG8gbGV0Cj4gPiA+IGRyaXZlcnMgc2V0IHRoZSBsaW5rIGFkZHJlc3MiPwo+ID4g
PiAKPiA+IEkgd2Fzbid0IGFjdHVhbGx5IHBsYW5uaW5nIHRvIHdvcmsgb24gdGhhdCBteXNlbGYs
IEZXSVcuCj4gPiAKPiA+IGpvaGFubmVzCj4gCj4gT0suIFNvIGhhcyBzb21lIGJvZHkgd2lsbCB3
b3JrIGZvciB0aGF0IG5vdz/wn5iBCj4gCgpZZXMsIEkgZG9uJ3QgcGVyc29uYWxseSBoYXZlIGEg
bmVlZCBmb3IgYW55dGhpbmcgb3RoZXIgdGhhbiB3aGF0IHdlIGhhdmUKcmlnaHQgbm93LgoKQnR3
LCBJIGFsc28gbWVyZ2VkIHByZXR0eSBtdWNoIGFsbCB0aGUgdGhpbmdzIGludG8gd2lyZWxlc3Mt
bmV4dCBub3csIEkKdGhpbmsgb25seSBtYXliZSBzb21lIGRlYnVnZnMgdXBkYXRlcyBhcmUgc3Rp
bGwgbm90IHVwc3RyZWFtLCBhbmQgYSBmZXcKbWlub3IgYnVnZml4ZXMgcGVyaGFwcy4KCmpvaGFu
bmVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
