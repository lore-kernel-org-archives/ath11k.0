Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5570DC432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 11:03:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C40360F44
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 11:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C40360F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcatro9LFX0ZMbPxkBEo14qC+p3zRzZUw7nysmra6oc=; b=HWfs7zjRelde8fsSL6RnoDfQfN
	I/Kz5hIvbeWDWUlONIcEgBaX2YmuECPH73zaf6oHOHpQAXjprRCAU3o9Mnz9rElEIrKjhiWrSKa4Y
	NzSME/GgqZ6z2om7OF0WLsD8twuD+SYxQXRZTAFKWDSN9yhl0PdcZgRfqMWgs9MOBApqRBv6XLiWc
	fYbDJMY4rVKTd19jZ+XTXrggXGtpX7h8l+PKEemT6PHwcpa+WjiUvnC4Ij7kl/8E2nZKnUV+j8LvQ
	oE54+x+zOnkiqFppcwtOmJJTF1+JUUVozKgzF13a5zObygaQdrre/YEhBeHA0TqIS8zYdvaD0LyrA
	1GJqE+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJDA7-009rEa-5E; Thu, 26 Aug 2021 11:03:11 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJD9w-009qzQ-Vc
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 11:03:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629975785; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ze1gvytwG+YzCSkkrIuM/rcE4EjC+1fQocjTQr5++38=;
 b=gkUaKtzio6PQSt+NQaKaee7usdD0sVyZtvwQo8Zw8kroAY7kKXQ+DqDfun54qEQl3/xbX44+
 CYn++fIiZZGZLiV3C8kcQa4B3UQ0e0F6djTTKogfKocS7Ak269kBpjPuuxPKlJ/LRTt3fsKk
 cFLgm1XGkCAyNwpppedGbYEgLNI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 612774e04d644b7d1c700729 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 11:02:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6439FC4360D; Thu, 26 Aug 2021 11:02:56 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0EF8CC43460;
 Thu, 26 Aug 2021 11:02:55 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 26 Aug 2021 19:02:55 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 1/8] cfg80211: add power type definition for 6 GHz
In-Reply-To: <4ab79bd421d021a2199c71471f60fefb97f317ad.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-2-wgong@codeaurora.org>
 <b6ba152ce1efde5863cae53a94728e8472ba53c0.camel@sipsolutions.net>
 <4ab79bd421d021a2199c71471f60fefb97f317ad.camel@sipsolutions.net>
Message-ID: <3fea8f33ea9c341fbe0e4c1443a2c378@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_040306_033522_54809BEE 
X-CRM114-Status: GOOD (  12.78  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wOC0yNiAxNjoyMiwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBPbiBUaHUsIDIwMjEt
MDgtMjYgYXQgMTA6MjAgKzAyMDAsIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4+ID4gwqBzdHJ1Y3Qg
Y2ZnODAyMTFfY2hhbl9kZWYgewo+PiA+IMKgCXN0cnVjdCBpZWVlODAyMTFfY2hhbm5lbCAqY2hh
bjsKPj4gPiBAQCAtNjg0LDYgKzY4NSw3IEBAIHN0cnVjdCBjZmc4MDIxMV9jaGFuX2RlZiB7Cj4+
ID4gwqAJdTMyIGNlbnRlcl9mcmVxMjsKPj4gPiDCoAlzdHJ1Y3QgaWVlZTgwMjExX2VkbWcgZWRt
ZzsKPj4gPiDCoAl1MTYgZnJlcTFfb2Zmc2V0Owo+PiA+ICsJZW51bSBubDgwMjExX2FwX3JlZ19w
b3dlciBwb3dlcl90eXBlOwo+PiAKPj4gSSdtIG5vdCBzdXJlIHdoeSB0aGlzIHNob3VsZCBiZSBp
biB0aGUgY2hhbmRlZiwgdGhlcmUncyBubyB3YXkgdGhhdAo+PiBhbnl0aGluZyBpbiBjZmc4MDIx
MSBpcyBldmVyIHVzaW5nIGl0IHRoZXJlLCBhdCBsZWFzdCBpbiB5b3VyIHBhdGNoZXMuCj4gCj4g
RG9lcyBpdCBldmVuICphcHBseSogdG8gYSBjaGFubmVsPyBXaGF0IGlmIEknbSBjb25uZWN0aW5n
IHRvIHR3byBBUHMgb24KPiB0aGUgc2FtZSBjaGFubmVsICh0d28gY2xpZW50IGludGVyZmFjZXMp
Pwo+IAp0aGlzIGlzIG9uZSBjb3B5IGZvciBlYWNoIGNvbm5lY3Rpb24sIGVhY2ggY2xpZW50IGhh
cyBpdHMgb3duIApjZmc4MDIxMV9jaGFuX2RlZi4KYWxzbyBpdCBjYW4gYmUgbW92ZWQgdG8gc3Ry
dWN0IGllZWU4MDIxMV9ic3NfY29uZi4KPiBqb2hhbm5lcwoKLS0gCmF0aDExayBtYWlsaW5nIGxp
c3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
