Return-Path: <SRS0=2oQt=IO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF30C433DB
	for <ath11k@archiver.kernel.org>; Tue, 16 Mar 2021 17:45:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63D276511D
	for <ath11k@archiver.kernel.org>; Tue, 16 Mar 2021 17:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63D276511D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UAzrATcerMLKYaDGi6CJ48WodR2qETbW3KwhCnBjeQI=; b=IxK9DhDkH7bS0V0s/9qFBLSjs
	6CsMEx5Ul6FNFzLcdKwcGBE+gtILLUD3Es7zUib8OTG5USO9d2RV0sbUhpAsANUzFw+Zy6gIHsM7K
	wb8OiWXji73FiNabg56+qwhUcFzW3eNs7tMqYKP7/5q1ciJ2CiXwnhLIvXSrR7SyHTJ9jqALOV6h/
	+POSfXL0dOJtH3NRFql2AbgVdWrc8YU4OFX9F2r4r5JSIBYCnkqdXSao8+Tx8auXATO+r9N+WLuZH
	erMh8Y7I7mN2m1Br7wTU63NqF3EtD35aZ1UbqyuEulplVNNHfTMVE52uNnHGGG6SdEgrBSsOQls+u
	07ZF3bL+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMDl6-001Qlc-Hy; Tue, 16 Mar 2021 17:45:34 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMDl2-001QkP-DY
 for ath11k@lists.infradead.org; Tue, 16 Mar 2021 17:45:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615916727; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cG9vldJJ1LkzKM/FgVY+2KK5neliGdtcrk5p6nSslQU=;
 b=q+9DvnGHLLY2eJj0ipuQL0yF432jGznBmc0eF/lCDSiwFqJD0rQEsN3wsXd8h1guCwyqPbqc
 oycftw7z5nw/EJmz0O4JdlIKrfgNFMEvh1AHNvSFQ2dIs4yTQUYdeBZifFBBgWFQN2eZkKis
 Sqf3vO/jroDXvtB8mgFMT54XfEg=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6050eeb03f267701a4ca1f86 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Mar 2021 17:45:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4BF6CC43461; Tue, 16 Mar 2021 17:45:20 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: gsamin)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D5C7C433C6;
 Tue, 16 Mar 2021 17:45:19 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 16 Mar 2021 23:15:19 +0530
From: Govindaraj Saminathan <gsamin@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH] mac80211: fix low throughput due to invalid addba
 extension
In-Reply-To: <e38a1ff5efbe5532a97310c053b50c6ce5ef027e.camel@sipsolutions.net>
References: <1615909674-13412-1-git-send-email-gsamin@codeaurora.org>
 <e38a1ff5efbe5532a97310c053b50c6ce5ef027e.camel@sipsolutions.net>
Message-ID: <631e58cbfc146db2a6ca70ffc8b90648@codeaurora.org>
X-Sender: gsamin@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_174528_631851_ED4CB062 
X-CRM114-Status: GOOD (  13.43  )
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

T24gMjAyMS0wMy0xNiAyMToyMSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBPbiBUdWUsIDIwMjEt
MDMtMTYgYXQgMjE6MTcgKzA1MzAsIEdvdmluZGFyYWogd3JvdGU6Cj4+IEFkZGJhIHJlcXVlc3Qg
YWN0aW9uIGZyYW1lIHJlY2VpdmVkIHdpdGggdGhlIGV4dGVuc2lvbiBlbGVtZW50IGZyb20KPj4g
Y2VydGFpbiAxMWFjIHN0YXRpb25zLAo+PiAKPiAKPiBQbGVhc2UgaW5kaWNhdGUgd2hpY2ggc28g
d2UgaGF2ZSBhIHJlY29yZCBvZiB3aG8ncyBzaGlwcGluZyBicm9rZW4gCj4ganVuay4KPiAKPj4g
YnV0IHRoZSBjbWQgaWQgYW5kIGxlbmd0aCBub3QgbWF0Y2hpbmcgdG8gYWRkYmEKPj4gZXh0ZW5z
aW9uIGFuZCBpdCBmYWlsaW5nIGluIGVsZW1lbnQgcGFyc2luZy4KPiAKPj4gRHVlIHRvIHRoaXMs
IGFkZGJhIHJlcXVlc3QKPj4gbm90IGFja25vd2xlZGdlZCBhbmQgYWdncmVnYXRpb24gbm90IHN0
YXJ0ZWQgd2hpY2ggaXMgY2F1c2luZyBsb3cKPj4gdGhyb3VnaHB1dC4gSGVuY2UgdmFsaWRhdGlu
ZyB0aGUgY21kIGlkIGJlZm9yZSBwcm9jZXNzaW5nIGFkZGJhIAo+PiBleHRlbnNpb24uCj4gCj4+
IMKgCWllc19sZW4gPSBsZW4gLSBvZmZzZXRvZihzdHJ1Y3QgaWVlZTgwMjExX21nbXQsCj4+IMKg
CQkJCSB1LmFjdGlvbi51LmFkZGJhX3JlcS52YXJpYWJsZSk7Cj4+IC0JaWYgKGllc19sZW4pIHsK
Pj4gKwlpZiAoaWVzX2xlbiAmJgo+PiArCSAgICBtZ210LT51LmFjdGlvbi51LmFkZGJhX3JlcS52
YXJpYWJsZVswXSA9PSBXTEFOX0VJRF9BRERCQV9FWFQpIHsKPj4gwqAJCWllZWU4MDJfMTFfcGFy
c2VfZWxlbXMobWdtdC0+dS5hY3Rpb24udS5hZGRiYV9yZXEudmFyaWFibGUsCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGllc19sZW4sIHRydWUsICZlbGVtcywgbWdtdC0+YnNzaWQsIAo+PiBOVUxMKTsKPj4gwqAJCWlm
IChlbGVtcy5wYXJzZV9lcnJvcikKPiAKPiBTbyB3ZSBnZXQgaW50byBwYXJzZV9lcnJvciB3aXRo
b3V0IHRoaXM/Cnllcywgd2UgZ2V0dGluZyBwYXJzZSBlcnJvci4KPiAKPiBXaGF0IGFyZSB0aGV5
IHB1dHRpbmcgdGhlcmUgaW5zdGVhZD8KZmlyc3QgOSBieXRlcyBhcmUgYWRkYmEgcmVxdWVzdCBh
Y3Rpb24gZnJhbWUgYW5kIHJlbWFpbmluZyA3IGJ5dGVzIApleHRlbnNpb24gY2F1c2luZyBmb3Ig
cGFyc2UgZXJyb3IuCjAzIDAwIDAxIDAyIDEwIDAwIDAwIGUwIDBhIGNmIDA4IDA2IDExYSA0NiAw
OSBmZQo+IAo+IGpvaGFubmVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDExawo=
