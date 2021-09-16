Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216E9C433EF
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 16:42:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF8561462
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 16:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBF8561462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRO/A7yEya9fp6Og41H32FG/JwaX3k8m8amVXN55IYI=; b=FAYouse1I9QLtq
	brQ0rqhioNoQ1jZxQy/Fj54kBmH2MvzWVn8GjFRQDU9o688jwqvqlbRkYmYCBxpI7PBuPrTTMpFXE
	NTg7UrfZUTOF0gypvUkCRxdvXTn2npAviNZN9CDnorLo4fRjvzOm5CkpHkCiG35hUMNA52xdacVDM
	CfHYS3WKgKYmdcweT2XBmO1ItUByIcdbHrKFRk250vtvQhyCymMnwgymH3n9CDegpcsOF/HEYGXCt
	HVQ3x9LPWrNEt0nt0FOlQTeBZc3ujx1cRLvbOzZxP76u5nx3jk1mL6pWQL8VquedE/2K2DY/tAVCf
	0b5JL/021DpszmQMpzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQuT4-00Bj13-7r; Thu, 16 Sep 2021 16:42:34 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQuSz-00Bj0i-Qp
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 16:42:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631810551; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=GdMX3W4kB6jE1Dh1q7N+9phTK4EXeOSDz7/sYzwb3Mc=;
 b=qTH9xc1lNzAeQo/6ACVlK+fqO4tPrtCFZfebVlcTgAZdrkQuJrDFyFonw0ckFZ+EtJmzRgMX
 Oic2qTWtLUrH2rDfU2bNPlClVtyPvUVeN26f7ju5WFgO2XQuINmnFIDj0Y6etNfrPKrTenZR
 v0wXBXQOL0lYIgRxKRa5TrQOTsY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 614373e0648642cc1cc8edea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 16:42:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C7EC7C1491E; Thu, 16 Sep 2021 16:42:07 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 14883C43164;
 Thu, 16 Sep 2021 16:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 14883C43164
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
 <20210916163529.GA9027@thinkpad>
Date: Thu, 16 Sep 2021 19:42:02 +0300
In-Reply-To: <20210916163529.GA9027@thinkpad> (Manivannan Sadhasivam's message
 of "Thu, 16 Sep 2021 22:05:29 +0530")
Message-ID: <87k0jgxyjp.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_094231_915764_85C47D4E 
X-CRM114-Status: GOOD (  17.78  )
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

TWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4g
d3JpdGVzOgoKPiBPbiBUaHUsIFNlcCAxNiwgMjAyMSBhdCAwMToxODoyMlBNICswMjAwLCBMb2lj
IFBvdWxhaW4gd3JvdGU6Cj4+IExlIGpldS4gMTYgc2VwdC4gMjAyMSDDoCAxMzoxMiwgTWFuaXZh
bm5hbiBTYWRoYXNpdmFtIDwKPj4gbWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IGEg
w6ljcml0IDoKPj4gCj4KPiBbLi4uXQo+Cj4+ID4gSWYgdGhpbmdzIHNlZW1zIHRvIHdvcmsgZmlu
ZSB3aXRob3V0IHRoYXQgcGF0Y2gsIHRoZW4gaXQgaW1wbGllcyB0aGF0Cj4+ID4gc2V0dGluZyBN
MAo+PiA+IHN0YXRlIHdvcmtzIGR1cmluZyByZXN1bWUuIEkgdGhpbmsgd2Ugc2hvdWxkIGp1c3Qg
cmV2ZXJ0IHRoYXQgcGF0Y2guCj4+ID4KPj4gPiBMb2ljLCBkaWQgdGhhdCBwYXRjaCBmaXggYW55
IGlzc3VlIGZvciB5b3Ugb3IgaXQgd2FzIGEgY29zbWV0aWMgZml4IG9ubHk/Cj4+IAo+PiAKPj4g
SXQgZml4ZXMgc2R4IG1vZGVtIHJlc3VtaW5nIGlzc3VlLCB3aXRob3V0IHRoYXQgd2UgZG9u4oCZ
dCBrbm93IG1vZGVtIG5lZWRzCj4+IHRvIGJlIHJlaW5pdGlhbGl6ZWQuCj4+IAo+Cj4gT2theS4g
VGhlbiBpbiB0aGF0IGNhc2UsIHRoZSByZWNvdmVyeSBtZWNoYW5pc20gaGFzIHRvIGJlIGFkZGVk
IHRvIHRoZSBhdGgxMWsKPiBNSEkgY29udHJvbGxlci4KCldoYXQgZG9lcyB0aGF0IG1lYW4gaW4g
cHJhY3Rpc2UsIGRvIHlvdSBoYXZlIGFueSBwb2ludGVycyBvciBleGFtcGxlcz8gSQpoYXZlIG5v
IGNsdWUgd2hhdCB5b3UgYXJlIHByb3Bvc2luZyA6KQoKPiBJZiB0aGF0J3MgdG9vIG11Y2ggb2Yg
d29yayBmb3IgS2FsbGUsIHRoZW4gSSdsbCBsb29rIGludG8gaXQuIEJ1dCBJIG1pZ2h0IGdldAo+
IHRpbWUgb25seSBhZnRlciBQbHVtYmVycy4KCkknbSBidXN5LCBhcyBhbHdheXMsIHNvIG5vdCBz
dXJlIHdoZW4gSSdtIGFibGUgdG8gZG8gaXQgZWl0aGVyLiBJIHRoaW5rCndlIHNob3VsZCBzZXJp
b3VzbHkgY29uc2lkZXIgcmV2ZXJ0aW5nIDAyMGQzYjI2YzA3YSBhbmQgYWRkaW5nIGl0IGJhY2sK
YWZ0ZXIgYXRoMTFrIGlzIGFibGUgdG8gaGFuZGxlIHRoaXMgbmV3IHNpdHVhdGlvbi4KCi0tIApo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8K
Cmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRh
dGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMWsK
