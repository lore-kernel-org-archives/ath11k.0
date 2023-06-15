Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142F1EB64D9
	for <ath11k@archiver.kernel.org>; Thu, 15 Jun 2023 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFFI1prnHePKQAPdQDs7Gi7uFMH/40rKsj9aLIh4eJE=; b=c/ertSgfBN3LOv
	Vn+SWjZ9ccx5SAfh121y18e5M0j4etEsB9TvybeopkaQsObmE0kTqlUBexPaxMPIndmxc4CJWhX6z
	MWMDtOHXy/BNvMlxcQ6YtTYx95EsUseueiGdT+TVlLKwqapc9hi00ISeEQ6kB28IkGm0oGQcpfVLR
	NUrA/jDFlA4n3Qsxp7LS+3Z+hv1vZD7ucUjCILpSFVGCVCEVoJGuALM0OqF7AuluuCj7EMmdRS0lx
	CfNVq8P324wYUk78zmOm4yki+umV3pPfsmqdc/acw1U7VfpW/4+OcYSA9akY6vh4ygIcUWiMUk4fg
	13O8kkKHJHQQtuoT+4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hqr-00E5se-1s;
	Thu, 15 Jun 2023 07:57:05 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hqp-00E5rn-0C
	for ath11k@lists.infradead.org;
	Thu, 15 Jun 2023 07:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+Hu0ck9XCxIY2n8/byR+TEcnYCe2b0gqlzoS7QzsYf4=;
	t=1686815821; x=1688025421; b=NRXfrBlaX0i00VSBxxCFnKmDoKXksrVJf7JOO+Vz1H97DLH
	1iRvnWi8U04UGnBAOeK9XiZUJ+6ThWExuSc655fGKsoW5Y+SK2F7pYYj4a63SF2O1Eka1y1CcqetD
	SewnlVd/cL3Wvf2ZFJ7G8KHF3mrehlvJilrIIK7Ot4SyYAR32uRpiu+6xMOfinYAoK8KeHBl9hoVW
	wv2dHCeK5op7iHaGlZuw/I0Ug6KvLCLskF2d0rV9CRfcskN5m1HZfFQ0NXv1OooqHdohO2Aii3i36
	mFwyTVHj/nAQIQKtdslNZEJQ9gP8ntCsqKkqZIGoyZvr3JbCW9AgJVZjWTWckNXg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1q9hqi-0075q8-0G;
	Thu, 15 Jun 2023 09:56:56 +0200
Message-ID: <c60af4eb116ed330e8035503fb7944f8853bcfa4.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Thu, 15 Jun 2023 09:56:55 +0200
In-Reply-To: <a7093d7a-0179-7b5f-cc61-a501331d35c6@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
	 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
	 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
	 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
	 <c15e368e-2fea-a1d8-9c0d-db9278ded5e5@quicinc.com>
	 <113761966918b2f390d3c9304307b42a0b4a829b.camel@sipsolutions.net>
	 <76863dec-1b2f-b933-7c5e-21c732de4bc6@quicinc.com>
	 <2cc79101249548f2a92c14af6aff6121143907d6.camel@sipsolutions.net>
	 <1c26c205-0240-7670-117d-02a7af068724@quicinc.com>
	 <6f8db032286923845202c7d658f1d39db79a758c.camel@sipsolutions.net>
	 <a7093d7a-0179-7b5f-cc61-a501331d35c6@quicinc.com>
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_005703_370750_89D8CFC7 
X-CRM114-Status: GOOD (  26.22  )
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

T24gVGh1LCAyMDIzLTA2LTE1IGF0IDEwOjI2ICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiA2
LzE1LzIwMjMgMjozMiBBTSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiA+IE9uIFdlZCwgMjAyMy0w
NS0yNCBhdCAxNTo0MSArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4gPiA+IE1heSBJIGFkZCBhIG5l
dyBvcHMgaW4gc3RydWN0IGllZWU4MDIxMV9vcHM/IGxpa2UgdGhpczoKPiA+ID4gCj4gPiA+IHUx
NiBhY3RpdmVfbGlua3Moc3RydWN0IGllZWU4MDIxMV9odyAqaHcsIHN0cnVjdCBpZWVlODAyMTFf
dmlmIHZpZiwgdTE2Cj4gPiA+IG5ld19saW5rcykiCj4gPiA+IAo+ID4gPiB0aGVuIGllZWU4MDIx
MV9zZXRfdmlmX2xpbmtzX2JpdG1hcHMoKSBjYWxsIHRoZSBvcHMgdG8gZ2V0IHRoZSBsaW5rcyBm
b3IKPiA+ID4gc3RhdGlvbiBhbmQgc2V0IHRoZSBzZGF0YS0+dmlmLmFjdGl2ZV9saW5rcyB3aXRo
IHRoZSByZXR1cm4gdmFsdWUgZnJvbQo+ID4gPiBsb3dlciBkcml2ZXIsCj4gPiA+IGl0IG1lYW5z
IGxvd2VyIGRyaXZlciB3aWxsIGR5bmFtaWMgc2VsZWN0IHRoZSBsaW5rcyBjb3VudCBhdCB0aGlz
IG1vbWVudC4KPiA+ID4gCj4gPiA+IElmIGxvd2VyIGRyaXZlciBub3QgcmVnaXN0ZXIgb3BzIGFj
dGl2ZV9saW5rcywgdGhlbiBrZWVwIGN1cnJlbnQgbG9naWMuCj4gPiA+IAo+ID4gSSBndWVzcyB5
b3UgY2FuIGNhbiBzZW5kIHBhdGNoZXMgZm9yIHdoYXRldmVyIHlvdSB3YW50IDopCj4gPiAKPiA+
IEJ1dCBJIGhhdmUgbm8gaWRlYSB3aGF0IHlvdSdyZSB0cnlpbmcgdG8gZG8/IFdoeSB3b3VsZCB5
b3UgbmVlZCB0byBoYXZlCj4gPiBhIGNhbGxiYWNrPwo+IAo+IEN1cnJlbnRseSBkcml2ZXIgY291
bGQgdXNlIGllZWU4MDIxMV9zZXRfYWN0aXZlX2xpbmtzX2FzeW5jKCkgdG8gYWN0aXZlIAo+IGxp
bmtzIGFmdGVyIGNvbm5lY3Rpb24gY29tcGxldGVkLgoKUmlnaHQuCgo+IEJ1dCBJIHdvdWxkIGxp
a2UgdG8gYWxsb3cgZHJpdmVyIHRvIHNlbGVjdCBhY3RpdmUgbGlua3MgaW4gYSBlYXJseSB0aW1l
LCAKPiBpdCB3aWxsIGJlIG1vcmUgY29udmVuaWVudCBmb3IgZHJpdmVyLgoKSG93IHNvPyBBbGwg
eW91IGhhdmUgdG8gZG8gaXMgbG9vayBmb3IgdGhlIGNvbm5lY3Rpb24gYmVjb21pbmcKYXV0aG9y
aXplZCAoZS5nLiBzdGEgc3RhdGUgZm9yIHRoZSBBUCBtb3ZpbmcgdG8gYXV0aG9yaXplZCkgYW5k
IHRoZW4Kc2VsZWN0aW5nIHRoZSBsaW5rcyB5b3Ugd2FudC4gV2UndmUgYWxyZWFkeSBiZWVuIHdv
cmtpbmcgb24gdGhhdCwgaXQncwpyZWFsbHkgZWFzeT8KCk9uIHRoZSBmbGlwLXNpZGUsIGl0IHdv
dWxkIGJlIGhpZ2hseSBpbmNvbnZlbmllbnQgZm9yIG1hYzgwMjExIHRvIHRyeSB0bwplbmFibGUg
bW9yZSBsaW5rcyAqZHVyaW5nKiB0aGUgYXNzb2NpYXRpb24gcHJvY2VzcywgYW5kIGFjdHVhbGx5
IGl0J3MKbm90IGV2ZW4gYWxsb3dlZCBieSBzcGVjIHVudGlsIHRoZSA0LXdheS1IUyBmaW5pc2hl
cy4gU28gdGhlIGVhcmxpZXN0CnBvc3NpYmxlIHRpbWUgaXMgcHJldHR5IG11Y2ggd2hlbiB5b3Ug
Y2FuIGp1c3QgZG8gaXQgaW4gdGhlIGRyaXZlciBhcyBJCmp1c3QgZGVzY3JpYmVkLgoKPiA+IFdh
cyB0aGlzIGZvciBsaW5rIHNlbGVjdGlvbiBpbiB0aGUgZHJpdmVyPyBXZSBzaG91bGQgaGF2ZSBh
IHBhdGNoCj4gPiBzb21ld2hlcmUgdGhhdCBhZGRzIGEgQlNTX0NIQU5HRSBmbGFnIGZvciB3aGVu
IHRoZSB2YWxpZCBsaW5rcyBjaGFuZ2UsCj4gPiBzbyB0aGUgZHJpdmVyIGNhbiBzZWxlY3Qgb3Ro
ZXJzLgo+ID4gCj4gPiBqb2hhbm5lcwo+IAo+IFllcywgaXQgaXMgZm9yIGxpbmsgc2VsZWN0aW9u
IGluIGRyaXZlciBhdCBhIGVhcmx5IHRpbWUgYmVmb3JlIAo+IGNvbm5lY3Rpb24gY29tcGxldGVk
LgoKVGhpcyBpcyBub3QgcmVhbGx5IGFsbG93ZWQgLi4uIEF0IGxlYXN0IG5vdCB3aXRob3V0IGFs
c28gZmluZGluZyB3YXlzIHRvCnJlYWxseSB0cmFuc21pdCB0aGUgODAyLjFYIGFuZCA0LXdheS1I
UyBvbmx5IG9uIHRoZSByaWdodCBsaW5rLCBldGMuCgo+IENvdWxkIHlvdSB0ZWxsIGRldGFpbCBh
Ym91dCBob3cgdGhlIEJTU19DSEFOR0UgZmxhZyB3b3Jrcz/wn5iBCgpUaGUgd29yayBpc24ndCBj
b21wbGV0ZSB5ZXQsIGJ1dCBiYXNpY2FsbHkgaXQganVzdCBjYWxscyB0aGUgY2FsbGJhY2sKd2hl
bmV2ZXIgdGhlIHZhbGlkX2xpbmtzIGNoYW5nZWQsIHNheSBieSBsaW5rLXJlY29uZmlndXJhdGlv
bi4KCmpvaGFubmVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEx
awo=
