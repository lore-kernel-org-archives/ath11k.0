Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF11EC432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:57:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9212F610A6
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9212F610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XCrRjHeBehsPbX16qFEhBGVcQYkyXgVp3pMUaQ1Wb0=; b=4DBjG2V6llhssLokb9r2wdVOmS
	diGu3LBTll8ff6ydmwbDHR9rG/3BKpcNqcaLbA4eyfBxf7rue4Ey1+2y5ByLGWAGH3my7dz4EoAJU
	fdYsl1y9/q8kEVpLw1v4jCjYBHCHUgDwUFtIssjAopTIY4QJoDHA/t7WkdSNlo22ZE/yul+JMtshL
	E6rGOyBgeIAwAfjIYdB5GhTkIdYCh5+OCX+yFu/C9SbkW0NDKSeq7BFjQ5YNt6X9Dhcn16Czy4SkS
	YtIYmzrHsgnd6HghAOqKsfrfc1W426KyytoI8nfcZD39ROG2NNVSERxLYX4RMZnVz/9yu8bUibWh2
	nhHLtWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJD4c-009qD2-HF; Thu, 26 Aug 2021 10:57:30 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJD4W-009qAv-8W
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 10:57:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629975445; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gxMTA0fwRG33Rk4J/3HwnKfgjAGL7e7W9ikb7mKuAUU=;
 b=kFN0Iye+/pjKI6sfPP+b38UD6yJ8RnzbBtJUzAHSivC3GYNm24VhkbJoEw4dT3why015dyeQ
 dVMfSzf/QWRlOPswrOBPg2M0+vHzbTJasMElDz4FrLSk4WvVAZRKxCi27CCRlsTJqMZsxTDV
 pPuzglgnt+V1vA7MYzJ0Z24ZcmI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6127737efc1f4cb692d3c612 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 10:57:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6F45FC4360C; Thu, 26 Aug 2021 10:57:02 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2960CC43460;
 Thu, 26 Aug 2021 10:57:02 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 26 Aug 2021 18:57:02 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 1/8] cfg80211: add power type definition for 6 GHz
In-Reply-To: <b6ba152ce1efde5863cae53a94728e8472ba53c0.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-2-wgong@codeaurora.org>
 <b6ba152ce1efde5863cae53a94728e8472ba53c0.camel@sipsolutions.net>
Message-ID: <e6006814059d085a1f57af24b9561dde@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_035725_623053_139A570D 
X-CRM114-Status: GOOD (  13.30  )
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

T24gMjAyMS0wOC0yNiAxNjoyMCwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPj4gwqBzdHJ1Y3QgY2Zn
ODAyMTFfY2hhbl9kZWYgewo+PiDCoAlzdHJ1Y3QgaWVlZTgwMjExX2NoYW5uZWwgKmNoYW47Cj4+
IEBAIC02ODQsNiArNjg1LDcgQEAgc3RydWN0IGNmZzgwMjExX2NoYW5fZGVmIHsKPj4gwqAJdTMy
IGNlbnRlcl9mcmVxMjsKPj4gwqAJc3RydWN0IGllZWU4MDIxMV9lZG1nIGVkbWc7Cj4+IMKgCXUx
NiBmcmVxMV9vZmZzZXQ7Cj4+ICsJZW51bSBubDgwMjExX2FwX3JlZ19wb3dlciBwb3dlcl90eXBl
Owo+IAo+IEknbSBub3Qgc3VyZSB3aHkgdGhpcyBzaG91bGQgYmUgaW4gdGhlIGNoYW5kZWYsIHRo
ZXJlJ3Mgbm8gd2F5IHRoYXQKPiBhbnl0aGluZyBpbiBjZmc4MDIxMSBpcyBldmVyIHVzaW5nIGl0
IHRoZXJlLCBhdCBsZWFzdCBpbiB5b3VyIHBhdGNoZXMuCj4gCkl0IGlzIHVzZWQgaW4gbWFjODAy
MTEgb2YgW1BBVENIIHYyIDMvOF0gbWFjODAyMTE6IGFkZCBwYXJzZSByZWd1bGF0b3J5IAppbmZv
IGluIDYgR0h6IG9wZXJhdGlvbiBpbmZvcm1hdGlvbi4Kc2hvdWxkIGkgbW92ZSBpdCB0byBtYWM4
MDIxMSdzIC5oIGZpbGU/Cj4+ICsvKioKPj4gKyAqIGVudW0gbmw4MDIxMV9hcF9yZWdfcG93ZXIg
LSByZWd1bGF0b3J5IHBvd2VyIGZvciBhIEFjY2VzcyBQb2ludAo+PiArICoKPj4gKyAqIEBOTDgw
MjExX1JFR19VTlNFVF9BUDogQWNjZXNzIFBvaW50IGhhcyBubyByZWd1bGF0b3J5IHBvd2VyIG1v
ZGUKPj4gKyAqIEBOTDgwMjExX1JFR19MUEk6IEluZG9vciBBY2Nlc3MgUG9pbnQKPj4gKyAqIEBO
TDgwMjExX1JFR19TUDogU3RhbmRhcmQgcG93ZXIgQWNjZXNzIFBvaW50Cj4+ICsgKiBATkw4MDIx
MV9SRUdfVkxQOiBWZXJ5IGxvdyBwb3dlciBBY2Nlc3MgUG9pbnQKPj4gKyAqLwo+PiArZW51bSBu
bDgwMjExX2FwX3JlZ19wb3dlciB7Cj4+ICsJTkw4MDIxMV9SRUdfVU5TRVRfQVAsCj4+ICsJTkw4
MDIxMV9SRUdfTFBJX0FQLAo+PiArCU5MODAyMTFfUkVHX1NQX0FQLAo+PiArCU5MODAyMTFfUkVH
X1ZMUF9BUCwKPj4gKwlOTDgwMjExX1JFR19BUF9QT1dFUl9BRlRFUl9MQVNULAo+PiArCU5MODAy
MTFfUkVHX0FQX1BPV0VSX01BWCA9Cj4+ICsJCU5MODAyMTFfUkVHX0FQX1BPV0VSX0FGVEVSX0xB
U1QgLSAxLAo+PiArfTsKPiAKPiBTaW1pbGFybHkgaGVyZSAoYW5kIHRoZSBvdGhlciBlbnVtKSwg
d2h5IGlzIHRoaXMgaW4gbmw4MDIxMSBpZiBpdCdzCj4gbmV2ZXIgdXNlZCBpbiBubDgwMjExPwo+
IApJdCBpcyB1c2VkIGluIG1hYzgwMjExIG9mIFtQQVRDSCB2MiAzLzhdIG1hYzgwMjExOiBhZGQg
cGFyc2UgcmVndWxhdG9yeSAKaW5mbyBpbiA2IEdIeiBvcGVyYXRpb24gaW5mb3JtYXRpb24uCnNo
b3VsZCBpIG1vdmUgaXQgdG8gbWFjODAyMTEncyAuaCBmaWxlPwo+IGpvaGFubmVzCgotLSAKYXRo
MTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
