Return-Path: <SRS0=CdPh=PB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BEEC433F5
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 16:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EDC260E0C
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 16:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EDC260E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXSTTbFx58V5ryNExyJeHSu8PW2NIuyeYNENAuqJM7s=; b=CHRR0AZWccUVh6TlXaZMHNSqrG
	8TmiKXCFSbFMh8R0+BVXAFiTWtoJcX/xf0Hw5Fd168GB7vlnIjID7LNgSOENKpeFymew5VeesZokg
	GNPK0ODMfV31Dw3cLqT9WBXJfaRimDxsAHyzFAd/mlJdSu/W4RlRQRPF+JjSnuXLBSErBZaojZGBB
	MpjyOG6OA6E5rKpSzUxzHHOTT9+iZJX5RMMT9aIg2OEkPsI7wx091InZCbHg7Pj3x5Q+0wQ/Brt8+
	C6FLhdLUGVMJuhtCRrfRtj6up+Ja1XolgLP0JU1V/k5bNsn3KfI2KTGD1ZpQ2S7AYDIioQagUyu9U
	nXdfz9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mahGO-0003aL-EE; Wed, 13 Oct 2021 16:37:56 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mahGL-0003Zx-V2
 for ath11k@lists.infradead.org; Wed, 13 Oct 2021 16:37:55 +0000
Received: by mail-lf1-x130.google.com with SMTP id j21so14808788lfe.0
 for <ath11k@lists.infradead.org>; Wed, 13 Oct 2021 09:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=ILx2c9pkEuCb/owYMOZvbMaesSYJCNCGv7EyyP79nko=;
 b=pg/qt7nQYnhuYJPn4j1dbqSE578DvDf76pEd2T9h1FLxI/6KANkWXwumv13aTtxH4P
 YxpSW3YLDyKPnFizjWKnVuPxSUuy2J6VfilDHnGLs8lxOYwJyys/xIfZDaGu2ZYRHaBc
 nhhCXuyuWgsKDix1oXM57kviDLktRZwCGQY2Ct8mI8RnJB7t9jzZ9A2JPOgNoPDpj/Py
 LFKu346PRC+YtES94SJPMVaJVDkEEG8AouQby2klTY9W+CpppanSuEK5b7+Zas9mo7ki
 vgiBfHupLB2YGyrYYpRDYgpEsJkCB027EtAcoQsbEk4SJDjvyXjVMB/1RUp71UUEJyXU
 7gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ILx2c9pkEuCb/owYMOZvbMaesSYJCNCGv7EyyP79nko=;
 b=NqjW1dNGnwL3SWK0gnxossXc95XEDYtKYx1V5oecQYop/7wXsbzOTYlC4eqRf2/ocH
 KalGqhn+71Axj1TeoMu5qKNyZ76+17a7yiohJJ03SVk4z5VM//RocC7PP2oTU2LBh3CV
 InBGaywffjm2m89jLZgBJBtCHWX1q6tyCBO7762Ma0yjCF/9zShbniIEQuitKVoemdO9
 W/mrDX+7YEJCRmougVNPnwPZP/42P/7pPpiLkL1PqI7YiaDgA4dmsCFrb5TR5mUzHdK7
 JAmXw1JoQ+j9dPwpjMkxCfQvzTQ6IZAd//+ELOgYt07Kg4Dkrl/lk795Y/W3sW3f05fu
 a/ZA==
X-Gm-Message-State: AOAM530Q/x1Ki4qnjm+PjT4mJm5KJwWofgWUVViS5R0ahOPOSpwvge+j
 079yCJww0FKhm2WhONdEx+6bKnfitR66IQ==
X-Google-Smtp-Source: ABdhPJy+FxUtraYyiZBDeiWbA7EZ3C8gJW9yvIFXExG0Bq/32TfE8WOHlO6ApjVHqOTOp/NJ8+hthA==
X-Received: by 2002:a2e:611a:: with SMTP id v26mr427400ljb.122.1634143071995; 
 Wed, 13 Oct 2021 09:37:51 -0700 (PDT)
Received: from [192.168.8.100] ([176.59.73.223])
 by smtp.gmail.com with ESMTPSA id b9sm1129lfe.85.2021.10.13.09.37.51
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 09:37:51 -0700 (PDT)
Subject: Re: High battery usage with ath11k on Dell 9310
From: Mark Herbert <mark.herbert42@gmail.com>
To: ath11k@lists.infradead.org
References: <c2c790a6-b86a-6664-e147-bc642e00e325@gmail.com>
Message-ID: <e5da99ce-a8a0-24b9-9e05-5f575456fb94@gmail.com>
Date: Wed, 13 Oct 2021 19:37:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c2c790a6-b86a-6664-e147-bc642e00e325@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_093754_026201_89260E46 
X-CRM114-Status: GOOD (  17.00  )
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

SSd2ZSB0cmllZCB0byBhcHBseQpbUEFUQ0hdIGF0aDExazogZW5hYmxlIHBvd2VyIHNhdmUgaW4g
c3RhdGlvbiBtb2RlCgpJdCBkaWQgbm90IGFwcGx5IG92ZXIgdGhlIGF0aC1uZXh0IGJ1dCBiZWlu
ZyBhcHBsaWVkIG1hbnVhbGx5IGRyaXZlcnMgCmNvbXBpbGVkIGFuZCBJIGNhbiBub3cgcmVhY2gg
UEM4IHN0YXRlLiBBbmQgaXQgc3RheXMgcHJldHR5IG11Y2ggdGltZSAKdGhlcmUgLTg4JSBpZiBs
YXB0b3AgaXMgaWRsZS4gU28gSSBob3BlIGlmIHRoaXMgcGF0Y2ggd2lsbCBtYWtlIGl0IHRvIAp0
aGUgbWFpbiB0cmVlIGl0IHdpbGwgc29sdmUgb25lIG9mIHRoZSBidWdzLgoKT24gMTAuMTAuMjAy
MSAxNToyNCwgTWFyayBIZXJiZXJ0IHdyb3RlOgo+IFNpbXBseSBkaXNhYmxpbmcgd2lmacKgIGRy
b3BzIDAuOC0xIHdhdHRzIGZyb20gcG93ZXIgY29uc3VtcHRpb24uIAo+IENvbXBhcmluZyBhbG1v
c3Qgc2FtZSBtb2RlbCAoMTYgZ2IgUkFNIHZzIDMyKSBidXQgYmFzZWQgb24gSW50ZWwgY2FyZCAK
PiBzaG93cyB0aGUgc2FtZSBkaWZmZXJlbmNlIC0gSW50ZWwgYmFzZWQgbGFwdG9wIHdpdGggV2lG
aSBjb25uZWN0ZWQgCj4gY29uc3VtZXMgYWJvdXQgc2FtZSBhcyBhdGgxMWsgd2l0aCBXaWZpIGRp
c2NubmVjdGVkLgo+Cj4gUG93ZXJ0b3DCoCBuZXdlciBzaG93cyBQQyBzdGF0ZXMgYmVsb3cgUEM2
LiBEaXNhYmxpbmcgV2lGaSBhbGxvd3MgUEM4LCAKPiBkaXNhYmxpbmcgYXRoMTFrIGNvbXBsZXRl
bHkgKGJpb3MpIC0gUEMxMC4KPgo+IFdpZmkgZW5hYmxlZAo+Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgUGtnKEhXKQo+IEMyIChwYzIpwqDCoCAxOCw1JcKgwqDCoCB8Cj4gQzMgKHBjMynCoMKgIDE0
LDIlwqDCoMKgIHwKPiBDNiAocGM2KcKgwqAgNDcsNSXCoMKgwqAgfAo+IEM3IChwYzcpwqDCoMKg
IDAsMCXCoMKgwqAgfAo+IEM4IChwYzgpwqDCoMKgIDAsMCXCoMKgwqAgfAo+IEM5IChwYzkpwqDC
oMKgIDAsMCXCoMKgwqAgfAo+IEMxMCAocGMxMCnCoCAwLDAlwqDCoMKgIHwKPgo+IFdmaSBkaXNh
YmxlZCAoYnkgbmV0d29ya21hbmFnZXIvbm0tYXBwbGV0KQo+Cj4KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBQa2coSFcpCj4gQzIgKHBjMinCoMKgIDEwLDglwqDCoMKgIHwKPiBDMyAocGMzKcKgwqAg
MTgsNSXCoMKgwqAgfAo+IEM2IChwYzYpwqDCoMKgIDEsMSXCoMKgwqAgfAo+IEM3IChwYzcpwqDC
oMKgIDAsMyXCoMKgwqAgfAo+IEM4IChwYzgpwqDCoCAyOCwzJcKgwqDCoCB8Cj4gQzkgKHBjOSnC
oMKgwqAgMCwwJcKgwqDCoCB8Cj4gQzEwIChwYzEwKcKgIDAsMCXCoMKgwqAgfAo+Cj4gU2VlbXMg
dGhhdCBldmVuIG9uIG5vIG5ldHdvcmsgYWN0aXZpdHkgYXRoMTFrIGZvcmNlcyBDUFUgdG8gc3Rh
eSBhd2FrZSAKPiBhbmQgZWF0IGJhdHRlcnkuIFRoZXJlIGFyZSBzb21lIGJhY2tncm91bmQgdHJh
bnNmZXIgaGFwcGVuaW5nIGFzIEkgCj4gaGF2ZSBWaWJlciwgdGh1bmRlcmJpcmQgYW5kIGZpcmVm
b3ggb3BlbmVkIHNvIEkgYmV0IHRoZXkgZG8gc2VudCBzb21lIAo+IGJ1dCB0aGVyZSBpcyBubyBm
aWxlIHRyYW5zZmVycywgbWVkaWEgc3RyZWFtcyBldGMuIFVuZGVyIHRoZSBzYW1lIAo+IGNvbmRp
dGlvbnMgKHRha2luZyB0aGlzIGRpc2sgZnJvbSBvbmUgOTMxMCB0byBvdGhlciA5MzEwIC0gc2Ft
ZSAKPiBzb2Z0d2FyZSwgc2FtZSBrZXJuZWwgLSBqdXN0IHdpZmkncyBkaWZmZXJlbnQpIC0gaXds
d2lmaSBtYW5hZ2VzIHRvIAo+IHJlYWNoIFBDOC1QQzEwIGJlaW5nIGNvbm5lY3RlZC7CoCBXaXRo
IGF0aDEwayBvbiBkZWxsIFhQUy0xMyA5MzUwIGludGVsIAo+IGFsc28gd2FzIHNhdmluZyBiYXR0
ZXJ5IG11Y2ggYmV0dGVyIHRoYW4gYXRoMTBrLCBiaXQgdGhlcmUgd2FzIGxpa2UgCj4gODglIG9m
IFBDMTAgd2l0aCBpbnRlbCBhbmQgNjUlIFBDMTAgYW5kIDIwJSBQQzggd2l0aCBhdGgxMGsuIEJ1
dCBpdCAKPiB3YXMgbm90IHN1Y2ggdGVycmlibHkgYmFkIGFzIHdpdGggYXRoMTEuCj4KPiBUaGVy
ZSBpcyBhbHJlYWR5IGtlcm5lbCBidWcgZm9yIHRoaXMsIG5vdCBjcmVhdGluZyBkdXBsaWNhdGVz
Cj4KPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNDU0Mwo+
Cj4KPgo+Cj4KPgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
