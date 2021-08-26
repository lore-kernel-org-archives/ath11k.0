Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611F8C4320A
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:20:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00EDD610A7
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00EDD610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlOGK3iAE6WuloKOGs0cUWKBhfsc1cGr3nICkZ+NWIs=; b=ELz9EqVtBiGgju
	P5UprGJjD8onTM5LLlmpA0DCfKBBQnPlWnSpW+G71mbH0O1Y86jPHGp+EtB5XbP1WRI8AgnIrIBcU
	SLXEZ1Hn2aSp1sFzbVpm1XQoGEr0cqOV41/Mv2XIUWnEfJTXFCyn6VbNFMn26qplTIndzUdhER2Tq
	Rfyr8nR3Y4kBsjGSB6SL9INqElAuF9DcQQUvH1KuNOokH9WKFGlJNxFXd4XV1mpdOeDlrnWN76Gwb
	8z08Rz4dQUnnqUXNFJfTWuC2aTLv2bvmrM5WjJSDJHPFXQW+e2wejesFxq2pVDflRCGI1slgIgJYw
	GT78zJEAQB9maA9z3O9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJAcU-009XMw-RF; Thu, 26 Aug 2021 08:20:18 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJAcP-009XMZ-IY
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 08:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=b8XUGoFPW6vRAEsN3iQ2xKUBOJTnFrxIvxTg5qvp850=; 
 t=1629966011; x=1631175611; b=huQq3pyeQyyEhPIzrnUNP9E4dNHaMfjDIq3MeB1M1E8ZrX1
 ND4noXfMjsOEaYmZzUVtwyFV51ZhFV5+ZsCHaA3W10rvZxCoQu0UaxIyrnEFoA2XAfz0ewyBO1cpF
 zv9COSqYzxrHVQVbBHZOyA5WNjQ9SdWShxonb22g7FkLnkiCkNo+R+wIIZlyKV1L67MIHCa6AEjgC
 Htc/kMzcewZi1LBTYzxXPE2oKvSp1IZQTHLfnzT70+kArSKdYLufpOj/SpHjFt406zLnHQ7yfdkXJ
 9EtFo1uhxnri46Up+KrD4rQ8YOfyXOuTmNFmyuIIln2laHRuX4FxHYxDtNisZgUw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJAcK-00G4bP-Ji; Thu, 26 Aug 2021 10:20:08 +0200
Message-ID: <b6ba152ce1efde5863cae53a94728e8472ba53c0.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/8] cfg80211: add power type definition for 6 GHz
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 10:20:07 +0200
In-Reply-To: <20210820122041.12157-2-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-2-wgong@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_012013_720484_8F59E40F 
X-CRM114-Status: GOOD (  10.08  )
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

Cj4gwqBzdHJ1Y3QgY2ZnODAyMTFfY2hhbl9kZWYgewo+IMKgCXN0cnVjdCBpZWVlODAyMTFfY2hh
bm5lbCAqY2hhbjsKPiBAQCAtNjg0LDYgKzY4NSw3IEBAIHN0cnVjdCBjZmc4MDIxMV9jaGFuX2Rl
ZiB7Cj4gwqAJdTMyIGNlbnRlcl9mcmVxMjsKPiDCoAlzdHJ1Y3QgaWVlZTgwMjExX2VkbWcgZWRt
ZzsKPiDCoAl1MTYgZnJlcTFfb2Zmc2V0Owo+ICsJZW51bSBubDgwMjExX2FwX3JlZ19wb3dlciBw
b3dlcl90eXBlOwoKSSdtIG5vdCBzdXJlIHdoeSB0aGlzIHNob3VsZCBiZSBpbiB0aGUgY2hhbmRl
ZiwgdGhlcmUncyBubyB3YXkgdGhhdAphbnl0aGluZyBpbiBjZmc4MDIxMSBpcyBldmVyIHVzaW5n
IGl0IHRoZXJlLCBhdCBsZWFzdCBpbiB5b3VyIHBhdGNoZXMuCgo+ICsvKioKPiArICogZW51bSBu
bDgwMjExX2FwX3JlZ19wb3dlciAtIHJlZ3VsYXRvcnkgcG93ZXIgZm9yIGEgQWNjZXNzIFBvaW50
Cj4gKyAqCj4gKyAqIEBOTDgwMjExX1JFR19VTlNFVF9BUDogQWNjZXNzIFBvaW50IGhhcyBubyBy
ZWd1bGF0b3J5IHBvd2VyIG1vZGUKPiArICogQE5MODAyMTFfUkVHX0xQSTogSW5kb29yIEFjY2Vz
cyBQb2ludAo+ICsgKiBATkw4MDIxMV9SRUdfU1A6IFN0YW5kYXJkIHBvd2VyIEFjY2VzcyBQb2lu
dAo+ICsgKiBATkw4MDIxMV9SRUdfVkxQOiBWZXJ5IGxvdyBwb3dlciBBY2Nlc3MgUG9pbnQKPiAr
ICovCj4gK2VudW0gbmw4MDIxMV9hcF9yZWdfcG93ZXIgewo+ICsJTkw4MDIxMV9SRUdfVU5TRVRf
QVAsCj4gKwlOTDgwMjExX1JFR19MUElfQVAsCj4gKwlOTDgwMjExX1JFR19TUF9BUCwKPiArCU5M
ODAyMTFfUkVHX1ZMUF9BUCwKPiArCU5MODAyMTFfUkVHX0FQX1BPV0VSX0FGVEVSX0xBU1QsCj4g
KwlOTDgwMjExX1JFR19BUF9QT1dFUl9NQVggPQo+ICsJCU5MODAyMTFfUkVHX0FQX1BPV0VSX0FG
VEVSX0xBU1QgLSAxLAo+ICt9OwoKU2ltaWxhcmx5IGhlcmUgKGFuZCB0aGUgb3RoZXIgZW51bSks
IHdoeSBpcyB0aGlzIGluIG5sODAyMTEgaWYgaXQncwpuZXZlciB1c2VkIGluIG5sODAyMTE/Cgpq
b2hhbm5lcwoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
