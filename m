Return-Path: <SRS0=tHTJ=O3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A81C433EF
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 07:35:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CCE46120C
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 07:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CCE46120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85+EgmKcAZ9UyI7a2MWQn1cpWEs+6bb0Je9B+it4Fzc=; b=n7vNUgEvwPRzptawUhiohY7Zhl
	zW5sH77MV/sXCDFjgLzQQF7nut41OZr2uEKjPn+NEecSdkdrwVEhGgmO8nbHNoIDs/is69MR9na6Z
	vvBh0D18evjydO6o6ylxmgCt/HnegvicxoIppjV2ZaIcL9yzKsLWCvmLDw8Zg05e4uOZN5/z5p3HJ
	ZewGhhWPaVx71bE6jWHPoiwShitSAg41x9e+J4906VmdrwUDET/rCtTXycET9gbAuZKTaZyVxr6ql
	NO9bklBc/B15ornP6crieS8x1GhI6M6VWVRgZp90+3DHJZdyZ8xeqOLXu+sFX9Lz4xp57qO1Fvmo1
	FO2eyP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNwA-00GRZO-W3; Thu, 07 Oct 2021 07:35:31 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNw8-00GRYc-05
 for ath11k@lists.infradead.org; Thu, 07 Oct 2021 07:35:29 +0000
Received: by mail-lf1-x135.google.com with SMTP id z11so12953992lfj.4
 for <ath11k@lists.infradead.org>; Thu, 07 Oct 2021 00:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=aw8myTSwVNPZ+vxcXFIs0m+byK8YHU67LRP6S9lZC3E=;
 b=LXamxOCYYGCZB8zYK53BXGGu6WMKw0QzMiHDOyzrecqiJpZM2Zq71VG2h5n/Fdln+s
 n8W6BfNOB9R4p33EIjtfr0zsFTC9T5ci2XotoCWpfmXpnBrFiR+JA0Ytxzrgz1h8ZL6N
 Swob8qI7JiRZd5CcZGyQOEHDZqzikyk/lXfDYAbJpJbTt0eiXHW0lt7cXaH/xda75Z3B
 1jMDsnyuS+/Os0ZpSGVeag95u2X9HtoaV5rpl1YNxAT4SOXEFsBaBN7y2GAALPk0muaR
 Ljh8bm/9fiIXU/5lE2H24DIqySCRT17KeEXdCk9GFXU79HATLpHdvrbHkYEZnVmgyMvT
 NhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=aw8myTSwVNPZ+vxcXFIs0m+byK8YHU67LRP6S9lZC3E=;
 b=sFfwm/oXIh2Z659rhbjHItaAH6JFV6AbBODR4YFrDQFxxAxG6iNX/gK5mnzT4tli5H
 jbbJCtmx/IFKiIcVJsk7b5/g6QCSbV6FOSa0O7AeMUEJQLbeSdab1DVj6PRUpg1fdKAC
 Fsm+fUY9DP9Zp8lGPHQwXPOy4a/WLUD8qP+/beHF/wpsMzb2JyqvUJAMAdhGRhlcb1kr
 RPQMm4UyyhVoh/zaBF6LJiCPhyWMU0Wzvq7H4PfS6m5dgpA2yNjKZIOZSCdhkVzd8v4M
 8QVqs5aL8JULU7/DChDuIKLnibvX9WXdAxUF7sez1Ie/zu/bcaur1gk6UQOW8IWFldUq
 tM5w==
X-Gm-Message-State: AOAM530bpioRGHEeP7dv7DWgUzoEgBaDx6Mhg5EQydpIg0XrBh71Q7wT
 loe+ci4V3ozTvOD0sEdXCpjLeBuhCzKN6vWg
X-Google-Smtp-Source: ABdhPJx90vPdaaLIb2qoEQBE3cDhb4htJJ5xNC7slc3r2UpZZCRhyLwkh/1HB/gEpcA13dcee0Cq0Q==
X-Received: by 2002:a2e:9b87:: with SMTP id z7mr2859101lji.253.1633592125238; 
 Thu, 07 Oct 2021 00:35:25 -0700 (PDT)
Received: from [192.168.2.114] ([109.106.141.149])
 by smtp.gmail.com with ESMTPSA id t22sm2431638ljj.61.2021.10.07.00.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 00:35:24 -0700 (PDT)
Subject: Re: Can not unload ath11k_pci and load it back
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org
References: <190a1b14-0a8c-f1fb-9f0d-e25cc57034a7@gmail.com>
 <875yu9e4li.fsf@codeaurora.org>
From: Mark Herbert <mark.herbert42@gmail.com>
Message-ID: <c42e48ca-0349-2bad-6259-03b021477795@gmail.com>
Date: Thu, 7 Oct 2021 10:35:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <875yu9e4li.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_003528_090098_79AA8A0B 
X-CRM114-Status: GOOD (  21.60  )
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

W8KgwqDCoCA1Ljc3NzQxOV0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IEJBUiAwOiBhc3NpZ25l
ZCBbbWVtIAoweGEyNTAwMDAwLTB4YTI1ZmZmZmYgNjRiaXRdClvCoMKgwqAgNS43Nzc0NDJdIGF0
aDExa19wY2kgMDAwMDo3MjowMC4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikKW8Kg
wqDCoCA1Ljc3Nzc4M10gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IHFjYTYzOTAgaHcyLjAKW8Kg
wqDCoCA1LjkzNDk1NV0gTG9hZGluZyBmaXJtd2FyZTogYXRoMTFrL1FDQTYzOTAvaHcyLjAvYW1z
cy5iaW4KW8KgwqDCoCA2LjM3NjA1OV0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGNoaXBfaWQg
MHgwIGNoaXBfZmFtaWx5IDB4YiAKYm9hcmRfaWQgMHhmZiBzb2NfaWQgMHhmZmZmZmZmZgpbwqDC
oMKgIDYuMzc3NDUwXSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZndfdmVyc2lvbiAweDEwMWMw
NmNjIApmd19idWlsZF90aW1lc3RhbXAgMjAyMC0wNi0yNCAxOTo1MCBmd19idWlsZF9pZApbwqDC
oMKgIDYuMzc4OTA5XSBMb2FkaW5nIGZpcm13YXJlOiBhdGgxMWsvUUNBNjM5MC9odzIuMC9ib2Fy
ZC0yLmJpbgpbwqDCoMKgIDYuMzk0NTIxXSBMb2FkaW5nIGZpcm13YXJlOiBhdGgxMWsvUUNBNjM5
MC9odzIuMC9tMy5iaW4Kcm1tb2QgYXRoMTFrX3BjaQpbwqAgMTAwLjMyMjMwMF0gYXRoMTFrX3Bj
aSAwMDAwOjcyOjAwLjA6IGxpbmsgZG93biBlcnJvciBkdXJpbmcgZ2xvYmFsIHJlc2V0ClvCoCAx
MDAuMzIyNDcyXSBETUFSOiBEUkhEOiBoYW5kbGluZyBmYXVsdCBzdGF0dXMgcmVnIDIKW8KgIDEw
MC4zMjI0OTFdIERNQVI6IFtJTlRSLVJFTUFQXSBSZXF1ZXN0IGRldmljZSBbMHg3MjoweDAwLjBd
IGZhdWx0IAppbmRleCAweDYwIFtmYXVsdCByZWFzb24gMHgyMl0gUHJlc2VudCBmaWVsZCBpbiB0
aGUgSVJURSBlbnRyeSBpcyBjbGVhcgptb2Rwcm9iZSBhdGgxMWtfcGNpClvCoCAyMzUuMjIyMjIz
XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogQkFSIDA6IGFzc2lnbmVkIFttZW0gCjB4YTI1MDAw
MDAtMHhhMjVmZmZmZiA2NGJpdF0KW8KgIDIzNS4yMjMxNjFdIGF0aDExa19wY2kgMDAwMDo3Mjow
MC4wOiBxY2E2MzkwIGh3Mi4wClvCoCAyMzUuMzc5OTg0XSBtaGkgbWhpMDogUmVxdWVzdGVkIHRv
IHBvd2VyIE9OClvCoCAyMzUuMzgwMjQ0XSBtaGkgbWhpMDogUG93ZXIgb24gc2V0dXAgc3VjY2Vz
cwpbwqAgMjM1LjM4MDMzMV0gTG9hZGluZyBmaXJtd2FyZTogYXRoMTFrL1FDQTYzOTAvaHcyLjAv
YW1zcy5iaW4KW8KgIDIzNS43MDE1NjddIG1oaSBtaGkwOiBXYWl0IGZvciBkZXZpY2UgdG8gZW50
ZXIgU0JMIG9yIE1pc3Npb24gbW9kZQoKT24gMDcuMTAuMjAyMSAwOToyMiwgS2FsbGUgVmFsbyB3
cm90ZToKPiBNYXJrIEhlcmJlcnQgPG1hcmsuaGVyYmVydDQyQGdtYWlsLmNvbT4gd3JpdGVzOgo+
Cj4+IERlYXIgYXRoMTFrIHRlYW0sCj4+Cj4+IFRoZSBtYWluIGlzc3VlIGlzIEkgY2FuIG5vdCBo
aWJlcm5hdGUgYW5kIHdha2UgdXAgbXkgWFBTIDEzIDkzMTAuwqAgSWYKPj4gSSBrZWVwIG1vZHVs
ZSBsb2FkZWQgaXQgaGliZXJuYXRlLiBCdSBoYW5ncyBvbiByZXN1bWUuCj4gSnVzdCB0byBhdm9p
ZCBjb25mdXNpb25zIHdpdGggdGVybWlub2xvZ3ksIHdpdGggaGliZXJuYXRlIHlvdSBtZWFuCj4g
c3RvcmluZyB0aGUgc3lzdGVtIHN0YXRlIHRvIGEgZGlzayBhbmQgY29tcGxldGVseSBwb3dlcmlu
ZyBvZmYgdGhlCj4gbGFwdG9wPwo+Cj4gSSBhc3N1bWUgaGliZXJuYXRpb24gZmFpbHMgYmVjYXVz
ZSBhdGgxMWsga2VlcHMgdGhlIGZpcm13YXJlIHJ1bm5pbmcKPiBkdXJpbmcgc3VzcGVuZCBhbmQg
YXRoMTFrIGlzIG5vdCBhYmxlIHRvIHJlY292ZXIgaWYgdGhlIGZpcm13YXJlIGlzIGRlYWQKPiBk
dXJpbmcgcmVzdW1lLgo+Cj4gQ2FuIHlvdSBmaWxlIGEgYnVnIGFib3V0IHRoaXMsIGluc3RydWN0
aW9ucyBoZXJlOgo+Cj4gaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vdXNlcnMv
ZHJpdmVycy9hdGgxMWsvYnVncmVwb3J0Cj4KPj4gSWYgSSB1bmxvYWQgbW9kdWxlIC0gaXQgcmVz
dW1lcyBPSyBidXQgdGhlcmUgaXMgbm8gY2hhbmNlIHRvIGhhdmUgV0lGSQo+PiBiYWNrIHdpdGhv
dXQgcmVib290Lgo+Pgo+PiBJZiBJIGRvIHJtbW9kIGF0aDExa19wY2kgLSBpdCBzaG93cyBlcnJv
cnMgaW4gZG1lc2c6Cj4+Cj4+IFvCoMKgIDQ4LjgwMTUwNF0gYXRoMTFrX3BjaSAwMDAwOjcyOjAw
LjA6IGxpbmsgZG93biBlcnJvciBkdXJpbmcgZ2xvYmFsIHJlc2V0Cj4+IFvCoMKgIDQ4LjgwMTcw
MF0gRE1BUjogRFJIRDogaGFuZGxpbmcgZmF1bHQgc3RhdHVzIHJlZyAyCj4+IFvCoMKgIDQ4Ljgw
MTcwOV0gRE1BUjogW0lOVFItUkVNQVBdIFJlcXVlc3QgZGV2aWNlIFsweDcyOjB4MDAuMF0gZmF1
bHQKPj4gaW5kZXggMHg2MCBbZmF1bHQgcmVhc29uIDB4MjJdIFByZXNlbnQgZmllbGQgaW4gdGhl
IElSVEUgZW50cnkgaXMKPj4gY2xlYXIKPj4KPj4gSWYgSSBkbyBtb2Rwcm9iZSBpbW1lZGlhdGVs
eSBpdCBkb2VzIGxvYWQgbW9kdWxlIGJ1dCBjYXJkIHdpbGwgbm90Cj4+IGNvbWUgYmFjayBhZ2Fp
bi4KPj4KPj4gSW4gQXJjaCB3aWtpIHJlbG9hZGluZyBtb2R1bGVzIHdhcyBleHBsYWluZWQgYXMg
YSB3b3JrYXJvdW5kIHRvCj4+IHN1c3BlbmQtcmVzdW1lIDkzMTAsIGJ1dCBsb29rcyBsaWtlIGl0
IGRvZXMgbm90IHdvcmsgYW55bW9yZS4gU3VzcGVuZAo+PiB0byBpZGxlIHdvcmtzIGZpbmUgLSBu
byBtb2R1bGUgdW5sb2FkaW5nIG5lZWRlZC4KPiBJIGhhdmUgYW4gWFBTIDEzIDkzMTAgYXMgd2Vs
bCBidXQgSSBjYW4ndCB0ZXN0IHRoaXMgcmlnaHQgbm93LiBDYW4geW91Cj4gcHJvdmlkZSBtb3Jl
IGluZm9ybWF0aW9uIGFib3V0IHRoZSBjYXJkIG5vdCBnZXR0aW5nIGJhY2sgYWZ0ZXIgbW9kcHJv
YmU/Cj4gV2hhdCBleGFjdCBrZXJuZWwgYW5kIEJJT1MgdmVyc2lvbnMgYXJlIHlvdSB1c2luZz8g
V2hhdCBsb2cgbWVzc2FnZXMgeW91Cj4gZ2V0IGZyb20gYXRoMTFrPyBQcmVmZXJhYmx5IHRoZSBl
eGFjdCBjb21tYW5kcyB5b3UgdXNlIGFuZCB0aGUgb3V0cHV0Cj4geW91IGdldCBmcm9tIGF0aDEx
ayB3b3VsZCBoZWxwIGEgbG90IHRvIHVuZGVyc3RhbmQgd2hhdCdzIGhhcHBlbmluZy4KPgoKLS0g
CmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
