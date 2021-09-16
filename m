Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DF2C433F5
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 16:44:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B3EF6127B
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 16:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B3EF6127B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQDepZLp5Vw8GTM4GHOTBJlQx1BoFGT2KzBWJoW29NQ=; b=oX5Y0c9yKQdwk9
	f7biryM0Lmkvdoqmq9YOdfWXiWf+n6zBU10dkC7WvUQwPEeUkyhEeUtVC1COjm12wkLCukrglSDj3
	ivgW6WlfrUN8FAt3Gw19w1u3fOT2I3oK7H7HrZB8qV2y3qu8Eh8xLX4lOiSiLNYKJqk06o/2X52FO
	9CLPyXpYhBJJTx/ZTxkJ/i0iEudQtuF2zM5tFG62YU/kmurhmLhMuEsPp3RrTrtqOqj68THoJGJDC
	/Y802CUMjvPkk625TljgfwD4ZX6BvbqXUvvLqhvURJAUbOQOWstYUcVQlvnj3WeJy19UGzCB9POoC
	wu08E7TrUsNF+gYVuwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQuUu-00BjDj-Q8; Thu, 16 Sep 2021 16:44:28 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQuUp-00Bj0i-MC
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 16:44:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631810666; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=AD7/WOZbNVlUqmpqDXVRpA7Q47uAHSlcsJZ2CWxebRk=;
 b=bR46etjA9ulPWQ4mfWmjBisYvABV5SUJXHAiuygHlgk1nwQeUo+t7yMtUlJCJlbVgPanRVpt
 xyYcmhOauYs9jU6nubF7lk71OP9hhvslqVhM4lxo/U5sq82a/F0v+5A9Lrcqx7fYztVSbwn+
 aMKe6dmgfchD2LRqnd0io/WaxUw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61437452c1b30e2f02b8ecb8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 16:44:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D88F7C0090D; Thu, 16 Sep 2021 16:44:00 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F81DC43617;
 Thu, 16 Sep 2021 16:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8F81DC43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: Re: [PATCH 1/3] ieee80211: Add new A-MPDU factor macro for HE 6 GHz
 peer caps
References: <20210913175510.193005-1-jouni@codeaurora.org>
 <87wnngy2ro.fsf@codeaurora.org>
 <a3df1f072600e79bac0a247b905fec8b946f0729.camel@sipsolutions.net>
Date: Thu, 16 Sep 2021 19:43:55 +0300
In-Reply-To: <a3df1f072600e79bac0a247b905fec8b946f0729.camel@sipsolutions.net>
 (Johannes Berg's message of "Thu, 16 Sep 2021 18:02:14 +0200")
Message-ID: <87fsu4xygk.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_094426_603936_19E04724 
X-CRM114-Status: GOOD (  15.02  )
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

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBPbiBU
aHUsIDIwMjEtMDktMTYgYXQgMTg6MTAgKzAzMDAsIEthbGxlIFZhbG8gd3JvdGU6Cj4+IEpvdW5p
IE1hbGluZW4gPGpvdW5pQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4+IAo+PiA+IEZyb206IFBy
YWRlZXAgS3VtYXIgQ2hpdHJhcHUgPHByYWRlZXBjQGNvZGVhdXJvcmEub3JnPgo+PiA+IAo+PiA+
IEFkZCBJRUVFODAyMTFfSEVfNkdIWl9NQVhfQU1QRFVfRkFDVE9SIGFzIHBlciBJRUVFIFN0ZCA4
MDIuMTFheC0yMDIxLAo+PiA+IDkuNC4yLjI2MyB0byB1c2UgZm9yIHBlZXIgbWF4IEEtTVBEVSBm
YWN0b3IgaW4gNiBHSHogYmFuZC4KPj4gPiAKPj4gPiBTaWduZWQtb2ZmLWJ5OiBQcmFkZWVwIEt1
bWFyIENoaXRyYXB1IDxwcmFkZWVwY0Bjb2RlYXVyb3JhLm9yZz4KPj4gPiBTaWduZWQtb2ZmLWJ5
OiBKb3VuaSBNYWxpbmVuIDxqb3VuaUBjb2RlYXVyb3JhLm9yZz4KPj4gPiAtLS0KPj4gPiDCoGlu
Y2x1ZGUvbGludXgvaWVlZTgwMjExLmggfCAxICsKPj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+PiA+IAo+PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2llZWU4MDIx
MS5oIGIvaW5jbHVkZS9saW51eC9pZWVlODAyMTEuaAo+PiA+IGluZGV4IDY5NDI2NDUwMzExOS4u
YTFhN2VkYTM1Y2I1IDEwMDY0NAo+PiA+IC0tLSBhL2luY2x1ZGUvbGludXgvaWVlZTgwMjExLmgK
Pj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2llZWU4MDIxMS5oCj4+ID4gQEAgLTIwODQsNiArMjA4
NCw3IEBAIGludCBpZWVlODAyMTFfZ2V0X3ZodF9tYXhfbnNzKHN0cnVjdCBpZWVlODAyMTFfdmh0
X2NhcCAqY2FwLAo+PiA+IMKgCj4+ID4gCj4+ID4gCj4+ID4gCj4+ID4gwqAjZGVmaW5lIElFRUU4
MDIxMV9IRV9WSFRfTUFYX0FNUERVX0ZBQ1RPUgkyMAo+PiA+IMKgI2RlZmluZSBJRUVFODAyMTFf
SEVfSFRfTUFYX0FNUERVX0ZBQ1RPUgkxNgo+PiA+ICsjZGVmaW5lIElFRUU4MDIxMV9IRV82R0ha
X01BWF9BTVBEVV9GQUNUT1IJMTMKPj4gCj4+IEpvaGFubmVzLCBjYW4gSSB0YWtlIHRoaXMgdmlh
IG15IGF0aCB0cmVlPyBJIHRoaW5rIHRoYXQncyB0aGUgZWFzaWVzdCBhcwo+PiB0aGUgYXRoMTFr
IHBhdGNoZXMgZGVwZW5kIG9uIHRoaXMuCj4+IAo+IFN1cmUsIGxvb2tzIGZpbmUuCj4KPiBBY2tl
ZC1ieTogSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4KClRoYW5rcyEg
SSBhc3NpZ25lZCB0aGlzIHRvIG1lIG9uIHBhdGNod29yay4KCi0tIApodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxl
c3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5n
cGF0Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
