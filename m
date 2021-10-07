Return-Path: <SRS0=tHTJ=O3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA69C433F5
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 07:48:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739666112D
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 07:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 739666112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CCiGyZbNeypk1piUpuRec8PMFy22yAGPWdDeOa+Dao=; b=RGGos0jq0n/v4x
	FD97aqY1tMDGXKOR0C75zIELaX8pPUt9ARtzNjicoe00W8Ps4j8zD86oXhMeM4EFKEYedu0qszJpg
	fks9KUqZo4YaUjxCfejbZ3MSrv2ThrOr+dTH+lvzFOLAu84jFyJnWzzXkv2gFLswhjIcfgVMIT9Ju
	IAzin+8LmSwT2udB2FYoo6PW51EIKE1KGQeQH5y5vGGL2ZzMn39X37c7eoS0uW5HQC8eek9jsLxMl
	ku4ab9EEhsNTxaHXf7VV6GUq9NlZpQxKxagezKujh5ixIgPN7bIxxWfCC9OsJ9hlQgFzUA4w4EogR
	xZzBiiwaJu/sVhIz3m4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYO8d-00GSws-DM; Thu, 07 Oct 2021 07:48:23 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYO8a-00GSwB-UG
 for ath11k@lists.infradead.org; Thu, 07 Oct 2021 07:48:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633592897; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=4rAjAJSqtdm70hhcdlYdNUpFKz97Ksfccg01mTPaPIc=;
 b=i5pE2SKy2qYsTzUa8CMCaZSNRBcw1yOPzWV6fpA34GuAdqpqoj1I1lfx6QFFUwRBgSdHiBWd
 WCd4L6AOh//iFvt8OQ+iMbCoMX7xbLNzDSlA5A5hEnGckyTZ77q8fKq/5dUzZpnsPOoYqtoV
 NZgaNTDMVrR9DKU/TuWeAeidYmY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 615ea63e7ae92c7fc932134e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 07:48:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4F6B7C4338F; Thu,  7 Oct 2021 07:48:13 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B144C4338F;
 Thu,  7 Oct 2021 07:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2B144C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Mark Herbert <mark.herbert42@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: Can not unload ath11k_pci and load it back
References: <190a1b14-0a8c-f1fb-9f0d-e25cc57034a7@gmail.com>
 <875yu9e4li.fsf@codeaurora.org>
 <8324ec52-303d-ea04-b635-a550e83ad47c@gmail.com>
Date: Thu, 07 Oct 2021 10:48:06 +0300
In-Reply-To: <8324ec52-303d-ea04-b635-a550e83ad47c@gmail.com> (Mark Herbert's
 message of "Thu, 7 Oct 2021 10:31:47 +0300")
Message-ID: <87y275cm2x.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_004821_067957_0CF8BCB1 
X-CRM114-Status: GOOD (  20.91  )
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

TWFyayBIZXJiZXJ0IDxtYXJrLmhlcmJlcnQ0MkBnbWFpbC5jb20+IHdyaXRlczoKCj4gSSd2ZSBm
b3VuZCBzaW1pbGFyIGJ1ZyBmaWxlcyBhbHJlYWR5IC0gc28gbm90IHRvIGNyZWF0ZSBkdXBsaWNh
dGVzCj4gc2ltcGx5IGNvbW1lbnRlZCB0aGVyZQo+Cj4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwu
b3JnL3Nob3dfYnVnLmNnaT9pZD0yMTQ1NDEKPgo+IEV4YWN0bHkgLSBoaWJlcm5hdGlvbiBtZWFu
cyBzYXZpbmcgc3RhdGUgb24gZGlzayBhbmQgcmVzdW1pbmcgbGF0ZXIsCj4gaXQgaXMgYSB2ZXJ5
IHVzZWZ1bGwgZmVhdHVyZSB3aGVuIHlvdSBhcmUgcnVubmluZyBvdXQgb2YgYmF0dGVyeSBhbmQK
PiB3YW50IHRvIHNhdmUgeW91ciB3b3JrLgoKR290IGl0LCB0aGFua3MuIFNvIGl0IHNlZW1zIHdl
IGhhdmUgdHdvIGlzc3VlcyBoZXJlOiBhdGgxMWsgZG9lcyBub3QKc3VwcG9ydCBoaWJlcm5hdGlv
biBhbmQgYXRoMTFrIG1vZHVsZSByZWxvYWQgZmFpbGluZy4gTGV0J3MgaGFuZGxlIHRoZQptb2R1
bGUgcmVsb2FkIGZhaWxpbmcgaW4gYnVnICMyMTQ1NDEsIGJ1dCBjYW4geW91IGZpbGUgYW5vdGhl
ciBidWcgYWJvdXQKdGhlIG1pc3Npbmcgc3VwcG9ydCBmb3IgaGliZXJuYXRpb24/IExldCdzIGhh
dmUgb25lIGlzc3VlIHBlciBidWcKcmVwb3J0LCBpdCdzIGVhc2llciB0byBtYW5hZ2UgYnVnemls
bGEgdGhhdCB3YXkuCgo+IEFsc28gb25lIG1vcmUgcG9pbnQgSSd2ZSBmb3VuZCAtIGlmIE1ISSBp
cyBjb25maWd1cmVkIGluIHRoZSBrZXJuZWwgLSAKPiB0aGUgY2FyZCBpcyBzdGFydGluZyB1cCBv
biB0aHIgZmlyc3QgYm9vdCBhbmQgd29ya3MuIEJ1dCBpZiBpCj4gY29uZmlndXJlIE1ISSBhcyBh
IG1vZHVsZSAtIGl0IGRvZXMgbm90LiBNSEkgbW9kdWxlIGRvIGxvYWQuIFNvIGRvwqAKPiBhdGgx
MWsgYW5kIGF0aDExa19wY2kuwqAgQnV0IHRoZSBsYXN0IGF0aDExayBkbWVzZyBzYXlzIDoKPgo+
IG1oaSBtaGkwOiBXYWl0IGZvciBkZXZpY2UgdG8gZW50ZXIgU0JMIG9yIE1pc3Npb24gbW9kZQo+
Cj4gRXhhY3RseSBhcyBpZiBJwqAgZG8gcm1tb2QvbW9kcHJvYmUgc2VxdWVuY2UuCj4KPiBJIHVz
ZSBsYXRlc3QgQklPUyBmcm9tIERlbGwgKGluIGZhY3QgdXBncmFkaW5nIDMuMC40IHRvIDMuMS4w
IGRpZCBub3QKPiBjYW5nZSBhbnl0aG5nKSAswqAgYW5kIGhhdmUgdHJpZWQgbXVsdGlwbGUga2Vy
bmVscy4gU3RhYmxlIDUuMTQgc2VyaWVzCj4gYW5kIGF0aDExayBnaXQgdHJlZSAobmV4dCBhbmQg
bWFzdGVyLXBlbmRpbmcpLiBOb3RoaW5nIGhlbHBzLsKgCj4gU29tZXRpbWVzIGl0IHdva3Mgb3V0
IC0gSSBoYWQgY291cGxlIG9mIHRpbWVzIHN1Y2Nlc3NmdWxseQo+IHJtbW9kL21vZHByb2JlIGF0
aDExa19wY2kgYnV0IGl0IHMgYSBraW5kIG9mIHJhbmRvbSBhbmQgdmVyeSByYXJlCj4gZXZlbnQg
KCBJIGhhZCBpdCAyIHRpbWVzIG9ubHkpLgo+Cj4gU28gZm9yIG1lIGl0IGxvb2tzIGxpa2UgYW4g
aXNzdWUgYmV0d2VlbiBNSEkgYW5kIGF0aDExayAsIGJ1dAo+IHViZm9ydHVuYXRlbHkgbXkga25v
d2xlZGdlIGlzIG5vdCBlbm91Z2ggdG8gcHJvcG9zZSBhbnkgc29sdXRpb24gaGVyZS4KCk9uIG15
IE5VQyB4ODYgdGVzdCBib3ggSSByZWxvYWQgYXRoMTFrIG1vZHVsZXMgc2V2ZXJhbCB0aW1lcyBh
IGRheSB3aGlsZQpJIHRlc3QgYXRoMTFrIGJ1dCBJIGFsd2F5cyByZWxvYWQgdGhlIG1oaSBtb2R1
bGVzIGF0IHRoZSBzYW1lIHRpbWUsCm1heWJlIHRoYXQgbWFrZXMgdGhlIGRpZmZlcmVuY2U/IE9y
IFhQUyAxMyA5MzEwIHdvcmtzIGRpZmZlcmVudGx5IGZyb20KTlVDLCB0aGF0J3MgYWxzbyBwb3Nz
aWJsZS4KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2ly
ZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3Bl
cnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxp
c3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
