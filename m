Return-Path: <SRS0=2oQt=IO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8768C433DB
	for <ath11k@archiver.kernel.org>; Tue, 16 Mar 2021 15:51:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78072650F4
	for <ath11k@archiver.kernel.org>; Tue, 16 Mar 2021 15:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78072650F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wlrHP7my/vJEa6YMz5+UhwPhz/Qsg+XenWOQAAN3/HE=; b=UfXba8eKp6OodddQYrUu2jcQS
	nu0uvdMdJPiGwCQ+o2K/vWX+JAxG/IaqGaf+fWiLc4YhbjCZizt+wfMbSbT7dyWvi+CF+aJWHgQOb
	T7a+Te+2IlyxEPU6/zT7LoHjUFDtNk+VJHnUuS6gAu87dq2E6qhKvsbNBjHF93uCiIsc8dwCSSClM
	KEFSho2LBfTPUaih9g/EveaNLssKgYbLgOnLKMWOnwgZ7eqhOartyH/9q5LBrFxk9YdipEw49Qasy
	gzXsig4woQdc5fnQF8mUqXzxvut5hO1w56FPAw3FWtF/Dnv6GOiJ8HySan6rCTrp/Dl8ZES8Z/LQ1
	rRQyyCDVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMByS-0018rm-Iy; Tue, 16 Mar 2021 15:51:13 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMByM-0018pE-IZ
 for ath11k@lists.infradead.org; Tue, 16 Mar 2021 15:51:08 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1lMByH-00GzXj-Rk; Tue, 16 Mar 2021 16:51:01 +0100
Message-ID: <e38a1ff5efbe5532a97310c053b50c6ce5ef027e.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: fix low throughput due to invalid addba
 extension
From: Johannes Berg <johannes@sipsolutions.net>
To: Govindaraj <gsamin@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Date: Tue, 16 Mar 2021 16:51:00 +0100
In-Reply-To: <1615909674-13412-1-git-send-email-gsamin@codeaurora.org>
References: <1615909674-13412-1-git-send-email-gsamin@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_155106_859268_83F2C96C 
X-CRM114-Status: UNSURE (   8.48  )
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

T24gVHVlLCAyMDIxLTAzLTE2IGF0IDIxOjE3ICswNTMwLCBHb3ZpbmRhcmFqIHdyb3RlOgo+IEFk
ZGJhIHJlcXVlc3QgYWN0aW9uIGZyYW1lIHJlY2VpdmVkIHdpdGggdGhlIGV4dGVuc2lvbiBlbGVt
ZW50IGZyb20KPiBjZXJ0YWluIDExYWMgc3RhdGlvbnMsCj4gCgpQbGVhc2UgaW5kaWNhdGUgd2hp
Y2ggc28gd2UgaGF2ZSBhIHJlY29yZCBvZiB3aG8ncyBzaGlwcGluZyBicm9rZW4ganVuay4KCj4g
YnV0IHRoZSBjbWQgaWQgYW5kIGxlbmd0aCBub3QgbWF0Y2hpbmcgdG8gYWRkYmEKPiBleHRlbnNp
b24gYW5kIGl0IGZhaWxpbmcgaW4gZWxlbWVudCBwYXJzaW5nLgoKPiBEdWUgdG8gdGhpcywgYWRk
YmEgcmVxdWVzdAo+IG5vdCBhY2tub3dsZWRnZWQgYW5kIGFnZ3JlZ2F0aW9uIG5vdCBzdGFydGVk
IHdoaWNoIGlzIGNhdXNpbmcgbG93Cj4gdGhyb3VnaHB1dC4gSGVuY2UgdmFsaWRhdGluZyB0aGUg
Y21kIGlkIGJlZm9yZSBwcm9jZXNzaW5nIGFkZGJhIGV4dGVuc2lvbi4KCj4gwqAJaWVzX2xlbiA9
IGxlbiAtIG9mZnNldG9mKHN0cnVjdCBpZWVlODAyMTFfbWdtdCwKPiDCoAkJCQkgdS5hY3Rpb24u
dS5hZGRiYV9yZXEudmFyaWFibGUpOwo+IC0JaWYgKGllc19sZW4pIHsKPiArCWlmIChpZXNfbGVu
ICYmCj4gKwkgICAgbWdtdC0+dS5hY3Rpb24udS5hZGRiYV9yZXEudmFyaWFibGVbMF0gPT0gV0xB
Tl9FSURfQUREQkFfRVhUKSB7Cj4gwqAJCWllZWU4MDJfMTFfcGFyc2VfZWxlbXMobWdtdC0+dS5h
Y3Rpb24udS5hZGRiYV9yZXEudmFyaWFibGUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWVzX2xlbiwgdHJ1ZSwgJmVs
ZW1zLCBtZ210LT5ic3NpZCwgTlVMTCk7Cj4gwqAJCWlmIChlbGVtcy5wYXJzZV9lcnJvcikKClNv
IHdlIGdldCBpbnRvIHBhcnNlX2Vycm9yIHdpdGhvdXQgdGhpcz8KCldoYXQgYXJlIHRoZXkgcHV0
dGluZyB0aGVyZSBpbnN0ZWFkPwoKam9oYW5uZXMKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAph
dGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDExawo=
