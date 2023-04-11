Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F93C7619A
	for <ath11k@archiver.kernel.org>; Tue, 11 Apr 2023 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oEY4nCSaU/sXbUocJXxP93wwHGRxWL0MiPGuYWoPFKA=; b=VM7GSCF77A+hX/
	Dgb3/lXPgNYIkWS8PxPPB81MDfqJ2B2PjD+/dPDwTCEOH6DH52ygSf9MYFt1a4acCWQCTW1nrfn4y
	p/JRrIeqisDpQ48aClTaHvNzl7xLTxBxrOzb9FJdZsunZ9Gcj4TNMAIulzrlHF9K85rrA5A2CY682
	0D1YpOb2O3DCySKDx7HdcuI3bXu2Jp84Cr/xU1rymRpEQDZMg4B+Rc1GjJLlr2KflYmerVEBUu689
	wO7dnNVR0y+SEqW4JOhNrI5bi35KzZfb5medBYGkKSj2NRYzOv/Sv+x2g9noluoH6lzCtPiG4PoSx
	25j5zVufpq/NGHMoujNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm8UY-00GjYL-2G;
	Tue, 11 Apr 2023 07:32:38 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm8UV-00GjWB-1x
	for ath11k@lists.infradead.org;
	Tue, 11 Apr 2023 07:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=A26bYEqubFAWpH0mnm5E/iESlPBoaj8MhF1NDhDI674=;
	t=1681198352; x=1682407952; b=mAnsKbXKW9kG14mfATVvMA/rOWFtWDnCojioJw2kPW+R6FH
	HQD+BnJPkmaTB2ZBjDvqQtgqn5x3kTxpvuGj8KBE+0jXasoPsHn9/NxMVlllmfBJ73TxX9b4KmAJr
	L5qv8RtLJy4Rxx6YpeOwugjR+13x3iITxBs4lecJockGEyWhCq9e1bPK9T5dpk1ylrU7c88znNm2S
	LH7cJiMe/HKRAeCktNAb11axDWHqo4ZkBX+tSgDsZnr8Z6FWk30EqFhatKuGbIaVBHfAUhNwliuEH
	gTP7hwxkCQamSvQerVvvgqZouHaiH4KdDh8DyBf96ObAawtAP/znbNpSPQJ801bg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pm8UL-00CdHm-2y;
	Tue, 11 Apr 2023 09:32:26 +0200
Message-ID: <91577d586475d290e08dee9e535cb6b4896e06d4.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Tue, 11 Apr 2023 09:32:25 +0200
In-Reply-To: <b9c6d022-12c3-a696-c4b9-cb14a6d30a45@quicinc.com>
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
	 <37958ca93039114b98909d730ff57dd1d10bb68d.camel@sipsolutions.net>
	 <b9c6d022-12c3-a696-c4b9-cb14a6d30a45@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_003236_144804_307E94AF 
X-CRM114-Status: GOOD (  14.21  )
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

T24gVHVlLCAyMDIzLTA0LTA0IGF0IDEwOjU0ICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiAx
MC8xMS8yMDIyIDM6MjYgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gPiBPbiBUdWUsIDIwMjIt
MTAtMTEgYXQgMTI6MDcgKzA4MDAsIFdlbiBHb25nIHdyb3RlOgo+ID4gPiBPbiA5LzI4LzIwMjIg
MTE6MjggUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gPiA+IC4uLgo+ID4gPiA+ID4gTWF5IEkg
a25vdyBzb21lIG1vcmUgaW5mby9zdGF0dXMgYWJvdXQgdGhlICJpbmNvbWluZ8KgIG5ldyBtZXRo
b2QgdG8gbGV0Cj4gPiA+ID4gPiBkcml2ZXJzIHNldCB0aGUgbGluayBhZGRyZXNzIj8KPiA+ID4g
PiA+IAo+ID4gPiA+IEkgd2Fzbid0IGFjdHVhbGx5IHBsYW5uaW5nIHRvIHdvcmsgb24gdGhhdCBt
eXNlbGYsIEZXSVcuCj4gPiA+ID4gCj4gPiA+ID4gam9oYW5uZXMKPiA+ID4gT0suIFNvIGhhcyBz
b21lIGJvZHkgd2lsbCB3b3JrIGZvciB0aGF0IG5vdz/wn5iBCj4gPiA+IAo+ID4gWWVzLCBJIGRv
bid0IHBlcnNvbmFsbHkgaGF2ZSBhIG5lZWQgZm9yIGFueXRoaW5nIG90aGVyIHRoYW4gd2hhdCB3
ZSBoYXZlCj4gPiByaWdodCBub3cuCj4gCj4gTWF5IEkgYWRkIG1ldGhvZCB0byBsZXQgbG93LWRy
aXZlcnMgc2V0IHRoZSBwcmltYXkgbGluayBhZGRyZXNzIGxpa2UgYmVsb3c/Cgo+IEkgYWRkIGEg
ZmllbGQgaW4gc3RydWN0IHdpcGh5X2lmdHlwZV9leHRfY2FwYWIsIGlmIGl0IGlzIHZhbGlkLCB0
aGVuIGl0IAo+IHdpbGwgYmUgdXNlZCBhcwo+IAo+IGxvY2FsIHByaW1hcnkvYXNzb2MgbGluayBh
ZGRyIGluIGZ1bmN0aW9uIGllZWU4MDIxMV9tZ2Rfc2V0dXBfbGluaygpIGZvciAKPiBzdGF0aW9u
Lgo+IAoKSSBkb24ndCByZWFsbHkgdGhpbmsgdGhhdCBpdCBtYWtlcyBzZW5zZSB0byBwdXNoIHRo
aXMgdG8gY2ZnODAyMTEgd2hlbgp3ZSBvbmx5IG5lZWQgaXQgaW4gbWFjODAyMTE/Cgpqb2hhbm5l
cwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
