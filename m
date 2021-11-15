Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97663C433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62EE561BD3
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62EE561BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3bRsn6+M+dCcexqyZxDAWOBMTMFvkAXKDPv35kt6ds=; b=hm6+2mIMIjQDpi
	TM3Y79QN6IJvPY01wQAKsQj40BIOfq4fb8mc9+4SmbrF3hfvRGUWRaRgsQ14+EiKV9EvcaxuojBcH
	CsWzEmETXFwWs5dnr6ZYiozhq252rKwkLIPosmjAIp4aqZ01LVZJH4dIvWbT0Njopd0nBGm/K/w4Z
	myV3eOHk7htAwC8Xpsf4X0ImhRL2JQF2WtD1qDUPKfxX9FWvsfxVOw0Dxss+JWeGX09MBl5IyMRFF
	AJCe37aYHnCczyKKKv4FgcMfVAx7gMMhgkbWAjpI1fpEVxa9+A3z/4DXriXXALfoVJGcES942bBYH
	8HHWoz1lAUpT/Gdw5oog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYdD-00F0bi-K0; Mon, 15 Nov 2021 09:50:31 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYCq-00Eu63-H1
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:23:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636968196; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=s6J+gg4yoOyaJ5pPnJXVPKyqEH49tEu59umKQrzFlxc=;
 b=S8tY7hROIf1Fn1KHD7xsrSS9Jgt3wTkqHaTX3vokTYs52UN3CSxk0UhYbTlENbLC3y2GsLH8
 I/yu/8rQm+T7o753IBQ/H5IDHfI2zVl0Uk9BOsz9QtIhq9PSHT5pzxGQvoTi4aCl4yakpipA
 ByeataScuTPn23ky07eY9PL/ikA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 61922703bb7027b8e18bd338 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:23:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3C80DC43616; Mon, 15 Nov 2021 09:23:15 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C277CC4338F;
 Mon, 15 Nov 2021 09:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C277CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: enable IEEE80211_VHT_EXT_NSS_BW_CAPABLE if NSS
 ratio enabled
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211013073704.15888-1-wgong@codeaurora.org>
References: <20211013073704.15888-1-wgong@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 wgong@codeaurora.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696819170.13305.1691462288223846501.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:23:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012316_668916_7182E8D0 
X-CRM114-Status: UNSURE (   9.99  )
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

V2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKCj4gV2hlbiBOU1MgcmF0aW8g
ZW5hYmxlZCByZXBvcnRlZCBieSBmaXJtd2FyZSwgU1VQUE9SVFNfVkhUX0VYVF9OU1NfQlcKPiBp
cyBzZXQgaW4gYXRoMTFrLCBtZWFud2hpbGUgSUVFRTgwMjExX1ZIVF9FWFRfTlNTX0JXX0NBUEFC
TEUgYWxzbwo+IG5lZWQgdG8gYmUgc2V0LCBvdGhlcndpc2UgaXQgaXMgaW52YWxpZCBiZWNhdXNl
IHNwZWMgaW4gSUVFRSBTdGQKPiA4MDIuMTHihKLigJAyMDIwIGFzIGJlbG93Lgo+IAo+IFRhYmxl
IDktMjczLVN1cHBvcnRlZCBWSFQtTUNTIGFuZCBOU1MgU2V0IHN1YmZpZWxkcywgaXQgaGFzIHN1
YmZpZWxkCj4gVkhUIEV4dGVuZGVkIE5TUyBCVyBDYXBhYmxlLCBpdHMgZGVmaW5pdGlvbiBpczoK
PiBJbmRpY2F0ZXMgd2hldGhlciB0aGUgU1RBIGlzIGNhcGFibGUgb2YgaW50ZXJwcmV0aW5nIHRo
ZSBFeHRlbmRlZCBOU1MKPiBCVyBTdXBwb3J0IHN1YmZpZWxkIG9mIHRoZSBWSFQgQ2FwYWJpbGl0
aWVzIEluZm9ybWF0aW9uIGZpZWxkLgo+IAo+IGRtZXNnIGhhdmUgYSBtZXNzYWdlIHdpdGhvdXQg
dGhpcyBwYXRjaDoKPiAKPiBpZWVlODAyMTEgcGh5MDogY29weWluZyBzYmFuZCAoYmFuZCAxKSBk
dWUgdG8gVkhUIEVYVCBOU1MgQlcgZmxhZwo+IAo+IEl0IG1lYW5zIG1hYzgwMjExIHdpbGwgc2V0
IElFRUU4MDIxMV9WSFRfRVhUX05TU19CV19DQVBBQkxFIGlmIGF0aDExayBub3QKPiBzZXQgaXQg
aW4gaWVlZTgwMjExX3JlZ2lzdGVyX2h3KCkuIFNvIGl0IGlzIGJldHRlciB0byBzZXQgaXQgaW4g
YXRoMTFrLgo+IAo+IFRlc3RlZC1vbjogV0NONjg1NSBodzIuMCBQQ0kgV0xBTi5IU1AuMS4xLTAx
NzIwLjEtUUNBSFNQU1dQTF9WMV9WMl9TSUxJQ09OWl9MSVRFLTEKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogS2FsbGUg
VmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+CgpQYXRjaCBhcHBsaWVkIHRvIGF0aC1uZXh0IGJy
YW5jaCBvZiBhdGguZ2l0LCB0aGFua3MuCgo3ODQwNjA0NGJkZDAgYXRoMTFrOiBlbmFibGUgSUVF
RTgwMjExX1ZIVF9FWFRfTlNTX0JXX0NBUEFCTEUgaWYgTlNTIHJhdGlvIGVuYWJsZWQKCi0tIApo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvcGF0Y2gv
MjAyMTEwMTMwNzM3MDQuMTU4ODgtMS13Z29uZ0Bjb2RlYXVyb3JhLm9yZy8KCmh0dHBzOi8vd2ly
ZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0
aW5ncGF0Y2hlcwoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFr
Cg==
