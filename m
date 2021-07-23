Return-Path: <SRS0=bbE0=MP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0BCC4338F
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:24:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A08A960EE6
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A08A960EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMWK+FVjG9C2GjPsz0WSbJVlcRkxYmZpFDF4cFYAX0E=; b=E8NBbWZbdRrUIZ
	5ILp53QD3TfkpiiT8FexSSKtLzPbdCXEYNDjP/Q6K+T9VYkzTiH9nvrlanCeqfeRmZCW36QDrSgS0
	fiVJOW+gfymnRt5VWX4RjuapF5/TOt0gg9KxyYbLXZ8ldMmahhGQZ1Ji5CC932p76pj5+0ZoUYvUu
	AXD7UBndPD04c9x5USw5uqwVtTiBAQIJeJTJItMXm8POTRXzx7HePgFJMW8MoCD0yVxc8GcGDylJr
	7fDO8ouKdiZYKU+3wNk0VF2w5xppvmVhn/WfjT9TyuxW2FFyyKSI3Hw9bUzNvuVmA3wQL6SacvHnu
	MO+5t49T0/rmYC9iQgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6rQH-0046RI-GI; Fri, 23 Jul 2021 09:24:49 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6rQF-0046QJ-E5
 for ath11k@lists.infradead.org; Fri, 23 Jul 2021 09:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=0JdWgOa929mZt9XW51/0loJNuPAWSfmYDepqm0N5wcM=; 
 t=1627032287; x=1628241887; b=og51oaE3WmH6RD4+ZCf5XsNmGsZUBwyp0EDNwRAE3Jxve59
 EVt2NDBGRmjA5qrErIV4PvlWpVdySoqwmpxhClxhaJkxk1Ildo7WaWV+JPdHOH5ylATPl8Q6BY3ss
 odu2Y3aV7bP5qEmrwh4+MwhmqfRK/fZp3w9QOWNxnQv4C6lozs6Vve7Zseyf/3CEuTmX/7eU0VYzu
 Uiw4dOBC2M9LPz012dW+zUb1HmS4XHnpkZPpizCYAKioIKrx4YkadQjxiFI6GGflEl5VYDDW8uCBV
 RD0PzTs7VA/BgnRG5fBMtmPOqjgZwgwTQCln1uuzRqKbRYhXWNYurcc4hDpL3dDA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1m6rNe-000U0O-EV; Fri, 23 Jul 2021 11:24:45 +0200
Message-ID: <1553c2923cc332acf3da00b49e2d2ac17cc12ba0.camel@sipsolutions.net>
Subject: Re: [PATCH 4/9] cfg80211: add definition for 6G power spectral
 density(psd)
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 23 Jul 2021 11:24:44 +0200
In-Reply-To: <20210517201932.8860-5-wgong@codeaurora.org>
 (sfid-20210517_222029_605505_DDB76CEE)
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-5-wgong@codeaurora.org>
 (sfid-20210517_222029_605505_DDB76CEE)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_022447_511411_E3FCF71E 
X-CRM114-Status: UNSURE (   7.64  )
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

T24gTW9uLCAyMDIxLTA1LTE3IGF0IDE2OjE5IC0wNDAwLCBXZW4gR29uZyB3cm90ZToKPiAKPiAr
ICogQElFRUU4MDIxMV9DSEFOX1BTRDogcG93ZXIgc3BlY3RyYWwgZGVuc2l0eSAoaW4gZEJtKQo+
ICsgKglvbiB0aGlzIGNoYW5uZWwuCgpEbyB3ZSBuZWVkIHRoYXQ/IFdoaWNoIHJlYWxseSBpcyBq
dXN0IGFub3RoZXIgd2F5IG9mIGFza2luZwoKPiArICogQHBzZDogcG93ZXIgc3BlY3RyYWwgZGVu
c2l0eSAoaW4gZEJtKQoKd2hldGhlciBvciBub3QgMCBpcyBhIHZhbGlkIHZhbHVlIGZvciB0aGlz
PwoKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvbmw4MDIxMS5oCj4gQEAgLTQwNDAsNiArNDA0
MCw3IEBAIGVudW0gbmw4MDIxMV9zY2hlZF9zY2FuX21hdGNoX2F0dHIgewo+IMKgwqAqIEBOTDgw
MjExX1JSRl9OT184ME1IWjogODBNSHogb3BlcmF0aW9uIG5vdCBhbGxvd2VkCj4gwqDCoCogQE5M
ODAyMTFfUlJGX05PXzE2ME1IWjogMTYwTUh6IG9wZXJhdGlvbiBub3QgYWxsb3dlZAo+IMKgwqAq
IEBOTDgwMjExX1JSRl9OT19IRTogSEUgb3BlcmF0aW9uIG5vdCBhbGxvd2VkCj4gKyAqIEBOTDgw
MjExX1JSRl9QU0Q6IGNoYW5uZWxzIGhhcyBwb3dlciBzcGVjdHJhbCBkZW5zaXR5IHZhbHVlCgpJ
dCBkb2Vzbid0IHNlZW0gbGlrZSB3ZSBuZWVkIHRoaXMsIGFmdGVyIGFsbCwgdGhlcmUgbXVzdCBi
ZSBzb21lIGtpbmQgb2YKYXR0cmlidXRlIGZvciB0aGUgUFNELCBhbmQgdGhlbiBpdHMgcHJlc2Vu
Y2UvYWJzZW5jZSBhbHJlYWR5IGluZGljYXRlcwp0aGlzPwoKam9oYW5uZXMKCgotLSAKYXRoMTFr
IG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
