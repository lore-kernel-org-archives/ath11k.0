Return-Path: <SRS0=5A3f=PK=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03641C433F5
	for <ath11k@archiver.kernel.org>; Fri, 22 Oct 2021 08:14:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC43B61056
	for <ath11k@archiver.kernel.org>; Fri, 22 Oct 2021 08:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC43B61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujyRBn610mNbTVjd8wArmudtNVn+hxF5d9Avg+TzDjM=; b=Y3dxMLTyq0UWUL
	ZwG/U/ELuJ/+AYLD81I+BUA2sOjmEaVEZAbr7EumbTbRLX9H3iY7U7VaWSPSvSAUgN0zUBnrPF+2T
	iFYEtpZmbfsQOX8DWY5z2YYf1bD2gOapmv+u8K6ZLp1slRngYGLTJ5T41Q/iWhFtaQwiXVM+jNf8i
	saxxQvS2sBdqqzlRusdv4qyoNhTOpPPcvdAr5jLcrLUE43Bp5Gv2PR8X0pAyIY3rcDvuRh7PZKi6G
	tV5l7WMsF6aFER3HhFsvNBACLSkO8dLRaAJQnRilgcBgLsxpVj01IreRnn1zI6hi5Jbs8dDrHsYPR
	Kt/vleQU5f3mC2r6TWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdphB-00AA3y-5O; Fri, 22 Oct 2021 08:14:33 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdpXv-00A6Zz-5b
 for ath11k@lists.infradead.org; Fri, 22 Oct 2021 08:05:00 +0000
Received: by mail-lf1-x131.google.com with SMTP id bq11so1089620lfb.10
 for <ath11k@lists.infradead.org>; Fri, 22 Oct 2021 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J7oRwF5ruTykuTdKEmW48jFK5feApA/qAili2vpUmyI=;
 b=TSqHD752YHVW2pf926w27u2nU3GApZpMtErj93posI7K+me0unUQkec5W5VLwKl8Pt
 IhJciX5qHJ1t4oU+dOyMilFN/CwLJV5nsa41GmLKQ3yBCDtvnHDxlX9ZBG3sA03RnyZb
 OLHf8QYcXNjj1tAglae3EG+m3fIXwvgJePWS9tdKvO/YbJxdawrY3R9LG5W0L0zkbTh+
 rd7/e06uZ4SAblOwo0OuC5ZkguPy7UT3Wwg+byUkNDU8deI+KRSpSJaRxBJ0D3ygH/EC
 u4h7AJJq7X5Nm3uwq7m+F6dI6ZenkBZnPeZDIN8xcDSg6cqfM/Tt9EKyoE5gLI+m0TMa
 Wfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J7oRwF5ruTykuTdKEmW48jFK5feApA/qAili2vpUmyI=;
 b=Xm49XRupPNaSR2sZlzFTQ7JQABD/kytb82opy8LzUt/DW84JO3LwalJFCCHFUL3yha
 bWzH84gVQ6gGXsPO/Y0r9nsJsaky7kZfhqx5gJvxQabT2YAfkKZm5MAOjsJQ4zudFxr7
 ITUDpo2GnLAymUNJ/LETM+jFB8QrtJs1YiAoNeQL3qglOcGc9R+t+Z26Gxnx1kjNcJwk
 G+01zPLH6cu3LcGzXi7e62+sThyygtVJS2ND/7a8l7+EbW0HqtrqMy3nUHN6VDT3C4CB
 h6KmveSaAKmRkBnF9lanff6/ZtjWexyY5cAQ3beM2YnoQ4jz4KIHWl217OuS8SwPCInS
 zyvA==
X-Gm-Message-State: AOAM530WWkakSzRaqIPPEvqpWbv8VR060SQfvnMJkPXlPdoxuh1F6PtA
 IJrBietQ06SGqf/Gl7X/CpCEqiKaszQpBgIrG50=
X-Google-Smtp-Source: ABdhPJxjr/cjSRuV2wHb2JgJAUevX0GYc7hIZ0wHDdgsLdju+LgfTC02GZaQRy/fJ+obTWHsiMhkgSm8uJrbi+sZMp4=
X-Received: by 2002:a05:6512:3f0:: with SMTP id
 n16mr8518158lfq.514.1634889897620; 
 Fri, 22 Oct 2021 01:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201223030225.2345-1-cjhuang@codeaurora.org>
 <87czx7t748.fsf@codeaurora.org>
In-Reply-To: <87czx7t748.fsf@codeaurora.org>
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Date: Fri, 22 Oct 2021 10:04:46 +0200
Message-ID: <CAFED-jnaYfXvz8S7d8orJmY+_=T-MRZ+v-c9OJFCg78HqS7=cw@mail.gmail.com>
Subject: Re: [PATCH 0/6] ath11k: support one MSI vector
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_010459_250131_D3D288D2 
X-CRM114-Status: GOOD (  12.53  )
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

Y3p3LiwgMTEgbHV0IDIwMjEgbyAwODoxMCBLYWxsZSBWYWxvIDxrdmFsb0Bjb2RlYXVyb3JhLm9y
Zz4gbmFwaXNhxYIoYSk6Cj4KPiBDYXJsIEh1YW5nIDxjamh1YW5nQGNvZGVhdXJvcmEub3JnPiB3
cml0ZXM6Cj4KPiA+IFRoaXMgcGF0Y2ggc2V0IGlzIHRvIHN1cHBvcnQgb25lIE1TSSB2ZWN0b3Ig
Zm9yIFFDQTYzOTAuCj4gPgo+ID4gQ2FybCBIdWFuZyAoNik6Cj4gPiAgIGF0aDExazogZ2V0IG1z
aV9kYXRhIGFnYWluIGFmdGVyIHJlcXVlc3RfaXJxIGlzIGNhbGxlZAo+ID4gICBhdGgxMWs6IGFk
ZCBjZSBhbmQgZXh0IGlycSBmbGFnIHRvIGluZGljYXRlIGlycV9oYW5kbGVyCj4gPiAgIGF0aDEx
azogdXNlIEFUSDExS19QQ0lfSVJRX0RQX09GRlNFVCBmb3IgZHAgaXJxeAo+ID4gICBhdGgxMWs6
IHJlZmFjdG9yIG11bGl0cGxlIG1zaSB2ZWN0b3IgaW1wbGVtZW50YXRpb24KPiA+ICAgYXRoMTFr
OiBzdXBwb3J0cyBvbmUgTVNJIHZlY3Rvcgo+ID4gICBhdGgxMWs6IGRvIG5vdCByZXN0b3JlIEFT
UE0gaW4gY2FzZSBvZiBzaW5nbGUgTVNJIHZlY3Rvcgo+Cj4gSSBkaWQgc29tZSBjbGVhbnVwIGFu
ZCBiZWZvcmUgc3VibWl0dGluZyB2MiBJIG5vdGljZWQgdGhlIHBhdGNoc2V0IChib3RoCj4gdjEg
YW5kIHYyKSBpcyBjcmFzaGluZyBkdXJpbmcgc3VzcGVuZCBvbiBteSBEZWxsIFhQUyAxMyA5MzEw
LiBXZSBhcmUKPiBpbnZlc3RpZ2F0aW5nIHRoZSByZWFzb24gZm9yIHRoYXQgYW5kIHdpbGwgc3Vi
bWl0IHYyIG9uY2UgdGhvc2UgYXJlCj4gZml4ZWQuCj4KSGVsbG8gS2FsbGUsCgpXaGF0IGlzIHN0
YXR1cyBmb3IgdGhpcyBzZXJpZXM/CkkgYW0gdXNpbmcgYXRoMTFrIGluIG15IGJhbmFuYS1waS1y
NjQgKGJhY2twb3J0cy01LjE1LXJjNikgYm9hcmQgYW5kIGhpdDoKWyAgMTYyLjM5MjA0M10gYXRo
MTFrX3BjaSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0byBnZXQgMzIgTVNJIHZlY3RvcnMsCm9ubHkg
LTI4IGF2YWlsYWJsZQpbICAxNjIuMzk5OTI3XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZmFp
bGVkIHRvIGVuYWJsZSBtc2k6IC0yOApbICAxNjIuNDA1Nzc4XSBhdGgxMWtfcGNpIDAwMDA6MDE6
MDAuMDogZGlzYWJsaW5nIGJ1cyBtYXN0ZXJpbmcKWyAgMTYyLjQxMTQ4MV0gYXRoMTFrX3BjaTog
cHJvYmUgb2YgMDAwMDowMTowMC4wIGZhaWxlZCB3aXRoIGVycm9yIC0yOAoKSSBzdXNwZWN0IHRo
aXMgc2VyaWVzIHNob3VsZCBmaXggbXkgaXNzdWU/CgpCUgpKYW51c3oKCj4gLS0KPiBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KPgo+IGh0
dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlv
bi9zdWJtaXR0aW5ncGF0Y2hlcwoKCgotLSAKSmFudXN6IER6aWVkemljCgotLSAKYXRoMTFrIG1h
aWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
