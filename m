Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532C8C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 11:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 195936109F
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 11:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 195936109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuPaoT5Bfw/aisHxudlFIfhgaP335xpwPlq0tAmbJEw=; b=n4NsnthZzdvFOC
	1BINspgsJkakBqG4WTg0lehxaXn2L+8vPa4RDdRQh2pySqMDUeQL5srB5ClT1j7H2AB7+vAX55ewq
	keFc0iW/aujfgoRN9WRL8JWeB93LPvvFQyTHJt2OKU9L7odiZO32HM/VG2xkhmT7arFpJaPZ0Jj7k
	wopKz3wMno349xlYh3N7ok4pvd+PmK+lCUS02rigcUkm0zAhT/zt6nv7wtUPrbFrQs19SDm97ugZw
	EY3cZXRu1qXGucxivfDeS71tPkV0Z3ZHMNkyK4BguS3fqS/+Ypl2ZQ21A+AQpJFErMvt+a0d1nzxL
	fWgOMJS+wtid4dNnxUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJDIF-009svL-73; Thu, 26 Aug 2021 11:11:35 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJDIA-009suG-Ea
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 11:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=AFPbCt38NXGTil1OJr1SDJKcyo5E5Oeu941r64ejGRQ=; 
 t=1629976290; x=1631185890; b=Ntvv6/W2pHB4Fw9DVqDLxfwawfwO/QS9OZnsnxF6xVmJCDZ
 RSwsjMCUXKiXVGN8v0EZxn5DVKmOOPQPA/DSWIA522ooJMxW6KHfj2Fd0+SaGLusBubbS3/WAREI0
 xf7TkYkaFKqIaV9HzpYl/xIUsiS8NTNzIk1pvzOAZBtDwlr2vOeRN0FDivKlaAuLxSM33h5i+FtRy
 3cGfLR1Om3UGqmPTWbR27wJJSpy+w5pqv5LM6eu5qBGmi3t9Dr0WKbiLUO34qQl1Hd8VgtrkMFIIQ
 IN4faJtkGIvK2aQb1H+Wp8QGNe4bW992UAmWS7IDdT2rKHFRsjVMyjpCVoj8MZNw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJDI8-00G7hg-SN; Thu, 26 Aug 2021 13:11:28 +0200
Message-ID: <be51d30eae34c20e3992e1a3b1f5212cefe288fb.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/8] cfg80211: add power type definition for 6 GHz
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 13:11:28 +0200
In-Reply-To: <3fea8f33ea9c341fbe0e4c1443a2c378@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-2-wgong@codeaurora.org>
 <b6ba152ce1efde5863cae53a94728e8472ba53c0.camel@sipsolutions.net>
 <4ab79bd421d021a2199c71471f60fefb97f317ad.camel@sipsolutions.net>
 <3fea8f33ea9c341fbe0e4c1443a2c378@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_041130_534670_8BE64583 
X-CRM114-Status: GOOD (  15.48  )
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

T24gVGh1LCAyMDIxLTA4LTI2IGF0IDE5OjAyICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiAy
MDIxLTA4LTI2IDE2OjIyLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+ID4gT24gVGh1LCAyMDIxLTA4
LTI2IGF0IDEwOjIwICswMjAwLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+ID4gPiA+IMKgc3RydWN0
IGNmZzgwMjExX2NoYW5fZGVmIHsKPiA+ID4gPiDCoAlzdHJ1Y3QgaWVlZTgwMjExX2NoYW5uZWwg
KmNoYW47Cj4gPiA+ID4gQEAgLTY4NCw2ICs2ODUsNyBAQCBzdHJ1Y3QgY2ZnODAyMTFfY2hhbl9k
ZWYgewo+ID4gPiA+IMKgCXUzMiBjZW50ZXJfZnJlcTI7Cj4gPiA+ID4gwqAJc3RydWN0IGllZWU4
MDIxMV9lZG1nIGVkbWc7Cj4gPiA+ID4gwqAJdTE2IGZyZXExX29mZnNldDsKPiA+ID4gPiArCWVu
dW0gbmw4MDIxMV9hcF9yZWdfcG93ZXIgcG93ZXJfdHlwZTsKPiA+ID4gCj4gPiA+IEknbSBub3Qg
c3VyZSB3aHkgdGhpcyBzaG91bGQgYmUgaW4gdGhlIGNoYW5kZWYsIHRoZXJlJ3Mgbm8gd2F5IHRo
YXQKPiA+ID4gYW55dGhpbmcgaW4gY2ZnODAyMTEgaXMgZXZlciB1c2luZyBpdCB0aGVyZSwgYXQg
bGVhc3QgaW4geW91ciBwYXRjaGVzLgo+ID4gCj4gPiBEb2VzIGl0IGV2ZW4gKmFwcGx5KiB0byBh
IGNoYW5uZWw/IFdoYXQgaWYgSSdtIGNvbm5lY3RpbmcgdG8gdHdvIEFQcyBvbgo+ID4gdGhlIHNh
bWUgY2hhbm5lbCAodHdvIGNsaWVudCBpbnRlcmZhY2VzKT8KPiA+IAo+IHRoaXMgaXMgb25lIGNv
cHkgZm9yIGVhY2ggY29ubmVjdGlvbiwgZWFjaCBjbGllbnQgaGFzIGl0cyBvd24gCj4gY2ZnODAy
MTFfY2hhbl9kZWYuCgpUaGF0IGRlcGVuZHMgb24gd2hlcmUgeW91IGNoZWNrIGl0IC0gYnV0IHlv
dSdyZSBiYXNpY2FsbHkgc2F5aW5nICJ1c2UKdGhpcyBvbmx5IGZyb20gdmlmLT5ic3NfY29uZi5j
aGFuZGVmIChvciBzb21ldGhpbmcsIGRpZG4ndCBjaGVjayBub3cpLApidXQgY2hhbmRlZiBzaG93
cyB1cCBpbiBtYW55IG90aGVyIHBsYWNlcyBhbmQgeW91IGRvbid0IG1haW50YWluIGl0CmFueXdo
ZXJlIGVsc2UuCgpqb2hhbm5lcwoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
