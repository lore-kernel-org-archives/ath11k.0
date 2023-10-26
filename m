Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFEAC25B6B
	for <ath11k@archiver.kernel.org>; Thu, 26 Oct 2023 23:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/j30Eti4EwKf/HUGlhzEIGDWvDFBFq9vazp6o3I/Gc=; b=LpTADhNHt92hlV
	72F0X7oMlOUnyIG1JUMJ6AQ5Wa9/7IQKOIPNHCbt3zMQfpsioYT+3hLJM4zc3MIUCmkMZYUVzIK3U
	vz+3CvhqVbXrzowkbTnY9eq1iahT/LcUGlUf99VzrbBjifriLNQLQzsmTUf94FmdBFxvNqhgqCyt1
	0AGtUCNi3JCcJ4vy/k3eVFgzmto7AbP8ibcUtKq/rTtSlWEcYIvPRzpo/zA5pviHy/ZmoSIpU5W93
	6OBqqy5v7VKmYAPguUTo3y4sQe0eEjaHZKZEEUYd5YSqIZOf+2XGp5g0XtEoEbQpZqchROy4bP/9H
	vfalhb2w7f/Up6wyNHIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw9R9-00FIOx-1v;
	Thu, 26 Oct 2023 23:06:47 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw9R6-00FIOH-2c
	for ath11k@lists.infradead.org;
	Thu, 26 Oct 2023 23:06:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9c5b313b3ffso214591866b.0
        for <ath11k@lists.infradead.org>; Thu, 26 Oct 2023 16:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698361601; x=1698966401; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1lvafxgrPH4MslhVVJ8PWeokuJA7ysCGpjbxciD6xM=;
        b=cDTK6fmmUBaVkHOLG3dm6nvelEUfJEKYS1LgC54GihqZ1qj6k5jNfhJPY2TOuEwh0H
         McC1QpWG/DUS68ecusAGWa4sQ+rMcffDZpdlgX0pEnoOAWlBUo0MOJdWUY5Eu8AY/U4h
         xOTMXn9a/XW30eBV2l96aEALCFyS+YxtWj/Lo3LmX/lrRc4HAurdyg8QX3w9K3dJTnWC
         Gqr67ild31LXO1m/hAFPhH5bk76SJhAJBcXM95gxJBLpNL2nWZZwTAyqjMX5sG8RjsnH
         p9wUzDJfiu8A+Xy+Z46dyk73ceXIdJ8fqjL/d28cjft7fui3uVv3uYcHjl0kCzo9UgWO
         efKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698361601; x=1698966401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1lvafxgrPH4MslhVVJ8PWeokuJA7ysCGpjbxciD6xM=;
        b=VIiFte3KhAR1CAcuotYw614mD3OlZ7YrxeuEPEuJFnZ4gQmeTGmjLpbfJJGkCheaIr
         /vLKPta/DSZU6prbX1tnif9ZMXFk1IL1WjGOjtu+mq+itoryYtE81W4HTQT5KmZm4azH
         U20nf0s3oZFBVSBNGMKZaNFiN1+5o/Prq2hcH7HJbLkPqjtWat4Or7bRpAptH/l5eZMX
         Xt77EODUu1btL+pgxsigaVfmydQeGuIVg5eD5bLoo++F+941HWpNvohCDfYRN5ie8pWD
         OCk+XxNWMBToO0qhSDGlJLsHb/unzb3iVAyO0GRu3FpMiWdm+nWso4HGvuTiA0Ze1Iiz
         Ms8Q==
X-Gm-Message-State: AOJu0YwqpVf5aTcV2+lmxgeSu4sVXEIi4xdghpbgDP6QumSNeUPUrV1n
	r4XxLiwbXiF3e0hlt5ezFIWcAbnroizxV0fq1dSclyezOpSGLg==
X-Google-Smtp-Source: AGHT+IGxmHbbMVWBC/bICXPWqiak9mqMZ+cfACESgbJx35V7lt5rWdCzi2NT9XuSrO2RdKAwoa9UzoocTNcZXwV4X6s=
X-Received: by 2002:a17:906:fd8b:b0:9bf:30e8:5bfd with SMTP id
 xa11-20020a170906fd8b00b009bf30e85bfdmr892154ejb.48.1698361601374; Thu, 26
 Oct 2023 16:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <1326a6e4-758d-3344-d90c-8a126748b034@gmail.com>
 <6a0c3aa0-86a8-8c06-81df-2d7085946cf5@leemhuis.info> <16885654-09f0-c139-cc9b-c6c4d666932e@quicinc.com>
 <ae1ad814-5613-704e-b0b1-4f1fc4bead44@leemhuis.info> <1945f748-fb71-f1c1-83a2-ba0470daf817@quicinc.com>
 <ZPUXMx0H/8U9j15F@luigi.stachecki.net> <1ba68ccb-9faa-8f9f-64cb-cf74dc0a2184@quicinc.com>
In-Reply-To: <1ba68ccb-9faa-8f9f-64cb-cf74dc0a2184@quicinc.com>
From: Tyler Stachecki <stachecki.tyler@gmail.com>
Date: Thu, 26 Oct 2023 19:06:49 -0400
Message-ID: <CAC6wqPUFkXqT5t2jQxtDPfUtjUVLkKyzWawwDOxW7h_74PxhZQ@mail.gmail.com>
Subject: Re: Fwd: ath11k: QCN9074: ce desc not available for wmi command
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Kalle Valo <quic_kvalo@quicinc.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Jakub Kicinski <kuba@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Atheros 11K <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_160644_869064_FF3B23EB 
X-CRM114-Status: GOOD (  23.08  )
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

T24gTW9uLCBTZXAgNCwgMjAyMyBhdCA1OjQ34oCvQU0gTWFuaWthbnRhIFB1YmJpc2V0dHkKPHF1
aWNfbXB1YmJpc2VAcXVpY2luYy5jb20+IHdyb3RlOgo+ID4gSGkgTWFuaWthbnRhLAo+ID4KPiA+
IEkganVzdCB3YW50ZWQgdG8gcmVwb3J0IHRoYXQgdGhpcyBpcyBsaWtlbHkgcmVsYXRlZCB0byBR
Q045MDc0IHdoZW4gdGhlIGhvc3QKPiA+IHN5c3RlbSBvbmx5IGhhcyAxIE1TSS1YIHZlY3RvciBh
dmFpbGFibGUgZm9yIHRoZSBtb2RlbSBhbmQvb3IgcmVsYXRlZCB0byBhCj4gPiBwcm9kdWN0IG5h
bWVkICJXUEVRLTQwNUFYIi4KPiA+Cj4gPiBJIGhhdmUgdHdvIGRpZmZlcmVudCBob3N0cyBydW5u
aW5nIHRoZSBleGFjdCBzYW1lIGtlcm5lbCwgc2FtZSBRQ045MDc0Cj4gPiBmaXJtd2FyZSAoV0xB
Ti5ISy4yLjcuMC4xLTAxNzQ0LVFDQUhLU1dQTF9TSUxJQ09OWi0xKSwgZXRjLiBUaGUgb25seQo+
ID4gZGlmZmVyZW5jZXMgYXJlIHRoYXQgdGhlIG9uZSB3aGljaCBkb2VzIG5vdCB3b3JrIGlzIHJ1
bm5pbmcgb24gYSBzbGlnaHRseQo+ID4gb2xkZXIgSW50ZWwgU0JDLCB3aXRoIHRoZSBvbGRlciBv
bmUgbGV2ZXJhZ2luZyBtUENJZSBpbnN0ZWFkIG9mIFBDSWUgYW5kCj4gPiBvbmx5IGhhdmluZyBv
bmUgTVNJLVggdmVjdG9yLgo+Cj4gWWVzLCB5b3UgYXJlIHJpZ2h0LiBUaGlzIHNlZW1zIHRvIGJl
IGEgcHJvYmxlbSB3aXRoIHNvbWUgaGFyZHdhcmUgaGF2aW5nCj4gUUNOOTA3NC4gV2UgaGF2ZSB0
cmllZCB0byByZXByb2R1Y2UgdGhpcyBwcm9ibGVtIGluIFFDIG9uIGRpZmZlcmVudAo+IGhhcmR3
YXJlIGJ1dCBjb3VsZCBub3QgcmVwcm9kdWNlIGl0IGV2ZW4gb25jZS4gTm90IGV2ZW4gd2l0aCBv
bmUgTVNJIHZlY3Rvci4KCkp1c3QgYXMgYSBoZWFkcyB1cCwgdGhpcyAiU3BhcmtsYW4gV1BFUS00
MDVBWCIgdmVyc2lvbiBvZiBRQ045MDc0IG1heQpiZSBhZGRpbmcgdG8gc29tZSBvZiB0aGUgY29u
ZnVzaW9uIGhlcmUgYW5kIHNvIHRoZXJlIG1heSBiZSB0d28KcHJvYmxlbXMuIEFzIG1lbnRpb25l
ZCBwcmV2aW91c2x5LCBDRSBkZXNjIGVycm9ycyBzdG9wcGVkIGFmdGVyCnJldmVydGluZyB0aGUg
dGhyZWFkZWQgTkFQSSBwYXRjaC4gSG93ZXZlciwgdGhlcmUncyBzb21ldGhpbmcgb2RkCmFib3V0
IHRoaXMgbW9kZW0gLSBpdCBkb2VzIG5vdCB3b3JrIHdpdGggdGhlIGJvYXJkLTIuYmluIHRoYXQg
S2FsbGUKcHJvdmlkZXMgYXMgdGhlIE9QIG5vdGVkLgoKVXBvbiByZXF1ZXN0LCB0aGUgdmVuZG9y
IG9mIHRoaXMgbW9kZW0gcHJvdmlkZXMgYSBib2FyZC5iaW4gZm9yCldQRVEtNDA1QVggY29tcGF0
aWJsZSB3aXRoIGEgY29weSBvZiBhbXNzL20zIHdoaWNoIGFwcGVhcnMgdG8gYmUKV0xBTi5ISy4y
LjQuMC4xLTAxODM4LVFDQUhLU1dQTF9TSUxJQ09OWi0xIChiYXNlZCBvbiBjaGVja3N1bXMpLiBJ
CmZvdW5kIG91dCB0aGUgaGFyZCB3YXkgdGhhdCB0aGUgQUJJIG9mIHRoZSBCREZzIGNoYW5nZWQg
Zm9yCldMQU4uSEsuMi41LjAgZmlybXdhcmVzIGFuZCBiZXlvbmQsIG1ha2luZyB0aGluZ3Mgbm9u
LWJhY2t3YXJkcwpjb21wYXRpYmxlIHdpdGggdGhlIGJvYXJkLmJpbiB0aGF0IHRoZSB2ZW5kb3Ig
cHJvdmlkZXMuLiB3aGljaCBpcwp1bmZvcnR1bmF0ZSBhcyB0aGUgdmVuZG9yIHdvdWxkIG5vdCBz
dXBwbHkgYSBCREYgYnVpbHQgYWdhaW5zdCAyLjUuMCsKd2hlbiByZXF1ZXN0ZWQuCgpUaGUgYm9h
cmQtMi5iaW4gdGhhdCBLYWxsZSBhbGxvd3MgdGhlIG1vZGVtIHN0YXJ0LCBidXQgaXQgZmFpbHMg
dG8KYXNzb2NpYXRlIG9yIHJlYWxseSBkbyBhbnl0aGluZyB1c2VmdWwgYmV5b25kIGFubm91bmNp
bmcgYSBTU0lEIGluIEFQCm1vZGUuCgpBbnl3YXlzOiBJIHRoaW5rIGl0J3MgbW9zdGx5IGp1c3Qg
YW4gaXNzdWUgd2l0aCB0aGUgSVJRIGFmZmluaXR5IC0tCm1heWJlIHRoZSB0aHJlYWRlZCBOQVBJ
IHBhdGNoIGlzIGNoYW5naW5nIGl0IHNvbWVob3cuLi4KCkNoZWVycywKVHlsZXIKCi0tIAphdGgx
MWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
