Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1633C433F5
	for <ath11k@archiver.kernel.org>; Thu, 12 May 2022 19:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PI4unb2P2eoBbmIOjHolPvh1t804xUcPd77a3jpJlsw=; b=Rw1EjsLcvxpti8
	QXiQtWIU00ramzruNaVi77qZ3OVwJl85tvlnB8fbcFzXo+UUu1PGqXSsDUzVAOuNstuL7O4EgDLZI
	g/QdmDKyoQ4EtNz+7ozeXagcZbEDGjB13BxU2jUkMScx/I4UwnjLvLfHH88Hof+51TtX93t7rYIV+
	LpR5KIlBD4lFo4n1yR+3s0J7SmhHYvnGUZ3NK2oUpJgxlr6MedZIHZDw7tv0WaxSorWKd5axr7lhL
	Zm1fKFxuyaYd10mI0qdCRawL3W/mIxWI5kSkCpHcpB+ISPY2w+BeNwNYRltkFiN946PnCRuF3+Dd4
	ZBG03JXs8YGmiavIKtAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npEnG-00DKEk-Mv; Thu, 12 May 2022 19:48:14 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npEnD-00DKDq-76
 for ath11k@lists.infradead.org; Thu, 12 May 2022 19:48:13 +0000
Received: by mail-lj1-x229.google.com with SMTP id 16so7765320lju.13
 for <ath11k@lists.infradead.org>; Thu, 12 May 2022 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qZ8dAdZbgSv12dDjJRPR/GhZFLurwGOMDFl32cckAg8=;
 b=sDiVy9AXRrX3SjBrAXYDy2jEPoSAR7EbWvtrg9Mp1XLZgwnUCXHANuSOrQrTTLApkj
 OASaSLCNbekgz74ADC42xKQQlWRfhmiRcLwAijJ8vz2IEDiZ8hwSWIIb3NNlrcrGdL1W
 oQ6TVIiOAWHHVTfYOSda9vv75n4stI2+3svYsmYQ75KVrFKXEqiDpIjYhwH+imN6GjxI
 psmKAdBZaJZqA4QHdYex3ySxnThwlcfwsakUNh3yNnrkT1O7YihcOJfNFnSqjq9Tm/8u
 EOMHwpM2zw2zzTJoGbya5200vGzsrkt7JHftdAbQWSJJCt41C94gwaMYhG0PMQ9kCir+
 EwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qZ8dAdZbgSv12dDjJRPR/GhZFLurwGOMDFl32cckAg8=;
 b=DX0Yb7mwIS7QhYQmK0MdGMSvmmPq64KLMumUe/o2drOqUY+P8/lK1wyCQzA4td2vQS
 DD8gfwfhnEVLswxDJcQ61vpTYng4WpPfsDyzyl7MPRzh6m1OPeixOtn/NQ8VF7BDsy+k
 Ez6Hg+1nhJ4stetIo6QWLf0OyijRhcUmX+tvpqbu3c4CjGg2a5EZG906Vy7kFqeTnnmt
 W5wnAZDYkquSlz81cjK2fcKpZqmN0/JpUoG+2mAWCc+Cz0MoKuGQwfj+9NUJqLyORcdA
 K/G+3QHlQaM511+/kxNfHZZ4NFcRQI6yhZE45akMO0EvD95Qu/+jPPMkv+0fs/jUyzmf
 u99g==
X-Gm-Message-State: AOAM532sY6SiwlFYB+rk67Hu8tdheDFCcqYZ4Xwq5WVnAUkYMpYgm2Gx
 YlIgqz5CcFsIh4z1hMLeRlOm8PvWJjg+eg==
X-Google-Smtp-Source: ABdhPJzahAECZYVyfFrsL6xsK4OX+OTM34BMclmv/ohYmNZ4ai8XKcBWqdGw4+jSj7DcxgCUGCCqBw==
X-Received: by 2002:a2e:902:0:b0:250:814f:fc1b with SMTP id
 2-20020a2e0902000000b00250814ffc1bmr989688ljj.72.1652384887197; 
 Thu, 12 May 2022 12:48:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 l5-20020ac25545000000b0047255d2111esm71411lfk.77.2022.05.12.12.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 12:48:06 -0700 (PDT)
Message-ID: <08d0ec20-f9ae-c546-becb-a77404e91a9a@linaro.org>
Date: Thu, 12 May 2022 22:48:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: WCN6855 issues with latest linux-firmware
Content-Language: en-GB
To: Kalle Valo <kvalo@kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
 <87v8ua624n.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87v8ua624n.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_124811_322741_967D05AA 
X-CRM114-Status: GOOD (  13.60  )
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

T24gMTIvMDUvMjAyMiAyMToyMywgS2FsbGUgVmFsbyB3cm90ZToKPiBEbWl0cnkgQmFyeXNoa292
IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IHdyaXRlczoKPiAKPj4gVGhlIHdjbjY4NTUg
V2lGaSBjaGlwIHN0b3BwZWQgd29ya2luZyBmb3IgbWUgYWZ0ZXIgYW4gdXBkYXRlIHRvIHRoZQo+
PiBsYXRlc3QgbGludXgtZmlybXdhcmUgKExpbnV4IDUuMTgtcmMyKS4gSSBjYW4gcmVwcm9kdWNl
IGl0IHdpdGggYm90aAo+PiBodzIuMCBhbmQgaHcyLjEgY2hpcHMuCj4+Cj4+IEhlcmUgaXMgdGhl
IHNldCBvZiBrZXJuZWwgbWVzc2FnZXMgSSdtIGdldHRpbmcgZnJvbSBhdGgxMWtfcGNpIGRyaXZl
cjoKPj4KPj4gWyAgICA0LjQyMjM5MV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IEFkZGluZyB0
byBpb21tdSBncm91cCAzCj4+IFsgICAgNC40Mjk1NzFdIGF0aDExa19wY2kgMDAwMDowMTowMC4w
OiBCQVIgMDogYXNzaWduZWQgW21lbQo+PiAweDYwNDAwMDAwLTB4NjA1ZmZmZmYgNjRiaXRdCj4+
IFsgICAgNC40Mzc4NTddIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBlbmFibGluZyBkZXZpY2Ug
KDAwMDAgLT4gMDAwMikKPj4gWyAgICA0LjQ0NTMyM10gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6
IE1TSSB2ZWN0b3JzOiAxCj4+IFsgICAgNC40NTAzNzVdIGF0aDExa19wY2kgMDAwMDowMTowMC4w
OiB3Y242ODU1IGh3Mi4wCj4+IFsgICAgNS4zNzg0ODhdIGF0aDExa19wY2kgMDAwMDowMTowMC4w
OiBjaGlwX2lkIDB4MiBjaGlwX2ZhbWlseSAweGIKPj4gYm9hcmRfaWQgMHg4YyBzb2NfaWQgMHg0
MDBjMDIwMAo+PiBbICAgIDUuMzkyODk4XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZndfdmVy
c2lvbiAweDExMGYwYzM1Cj4+IGZ3X2J1aWxkX3RpbWVzdGFtcCAyMDIyLTAzLTMwIDA5OjA1IGZ3
X2J1aWxkX2lkCj4+IFFDX0lNQUdFX1ZFUlNJT05fU1RSSU5HPVdMQU4uSFNQLjEuMS0wMzEyNS1R
Q0FIU1BTV1BMX1YxX1YyX1NJTElDT05aX0xJVEUtMy42NTEwLjcKPj4gWyAgICA1LjQyMDY0OF0g
YXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0byBmZXRjaCBib2FyZCBkYXRhIGZvcgo+
PiBidXM9cGNpLHZlbmRvcj0xN2NiLGRldmljZT0xMTAzLHN1YnN5c3RlbS12ZW5kb3I9MTdjYixz
dWJzeXN0ZW0tZGV2aWNlPTAxMDgscW1pLWNoaXAtaWQ9MixxbWktYm9hcmQtaWQ9MTQwCj4+IGZy
b20gYXRoMTFrL1dDTjY4NTUvaHcyLjAvYm9hcmQtMi5iaW4KPj4gWyAgIDE1LjY4NjM5OF0gYXRo
MTFrX3BjaSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0byB3YWl0IGJvYXJkIGZpbGUKPj4gZG93bmxv
YWQgcmVxdWVzdDogLTExMAo+PiBbICAgMTUuNjk0NTMwXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAu
MDogcW1pIGZhaWxlZCB0byBsb2FkIGJkZiBmaWxlCj4+IFsgICAxNS43MDA3ODRdIGF0aDExa19w
Y2kgMDAwMDowMTowMC4wOiBmYWlsZWQgdG8gbG9hZCBib2FyZCBkYXRhIGZpbGU6IC0xMTAKPiAK
PiBXaGF0IFdDTjY4NTUgaGFyZHdhcmUgYXJlIHlvdSBleGFjdGx5IHVzaW5nPyAobWFrZSwgbW9k
ZWwgZXRjKQoKSSBoYXZlIGFza2VkIGZvciB0aGUgaHcgZGV0YWlscy4gVGhlIHVzZXIgZ3VpZGUg
Zm9yIHRoZSBIREs4NDUwIGxpc3RzIApXQ042ODU2IGNoaXAgYW5kIGFsc28gbWVudGlvbnMgJ1F1
YWxjb21twq4gRmFzdENvbm5lY3TihKIgNjkwMCBTeXN0ZW1zJy4KCgo+IEFuZCB3aGF0Cj4gYm9h
cmQgZmlsZSBhcmUgeW91IHVzaW5nPyBtZDVzdW1zIG9mIGFsbCBmaXJtd2FyZSBmaWxlcyBpcyB0
aGUgYmVzdC4KCiMgbWQ1c3VtIC9saWIvZmlybXdhcmUvYXRoMTFrL1dDTjY4NTUvaHcyLjEvKgo0
NjBmYmQ1ZGRjNTdiM2QyZWZiZjFjYTk3NmY3OGI5MCAKL2xpYi9maXJtd2FyZS9hdGgxMWsvV0NO
Njg1NS9odzIuMS9hbXNzLmJpbgo4OGIzYTRmYmRlOGNhYjQ0OTNmMDA2MGFlM2I1ZGVlMyAKL2xp
Yi9maXJtd2FyZS9hdGgxMWsvV0NONjg1NS9odzIuMS9ib2FyZC0yLmJpbgo3ZmQxYzIzMzdiMGI2
NTAyNTg4ZDMxNDFlMjA1ZTczNSAKL2xpYi9maXJtd2FyZS9hdGgxMWsvV0NONjg1NS9odzIuMS9i
b2FyZC5iaW4KZDE0NjBmYzFjNDU5NWQwZDIyZjgyZDViYWVhYWJiZDggIC9saWIvZmlybXdhcmUv
YXRoMTFrL1dDTjY4NTUvaHcyLjEvbTMuYmluCmY2N2JlODM2NTljNzkwZmUxNWQxZTQyYWY1MDFl
OWZhIAovbGliL2Zpcm13YXJlL2F0aDExay9XQ042ODU1L2h3Mi4xL3JlZ2RiLmJpbgoKCj4gCj4+
IFdpdGggdGhlIGVhcmxpZXIgZmlybXdhcmUgZnJvbSBbMV0gSSdtIGdldHRpbmcgdGhlIGZvbGxv
d2luZyB0cmFjZQo+PiAoYW5kIFdpRmkgZGV2aWNlIHByb2JlcykuIEludGVyZXN0aW5nbHkgZW5v
dWdoIHRoZSBjaGlwX2lkIGRpZmZlcnMKPj4gYmV0d2VlbiB0aGVzZSBmaXJtd2FyZSB2ZXJzaW9u
cy4KPj4KPj4gWyAgICA0LjM1MjY2MV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IEFkZGluZyB0
byBpb21tdSBncm91cCAzCj4+IFsgICAgNC4zNTkxOTJdIGF0aDExa19wY2kgMDAwMDowMTowMC4w
OiBCQVIgMDogYXNzaWduZWQgW21lbQo+PiAweDYwNDAwMDAwLTB4NjA1ZmZmZmYgNjRiaXRdCj4+
IFsgICAgNC4zNjc0NjZdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBlbmFibGluZyBkZXZpY2Ug
KDAwMDAgLT4gMDAwMikKPj4gWyAgICA0LjM3NDkxNl0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6
IE1TSSB2ZWN0b3JzOiAxCj4+IFsgICAgNC4zNzk5NjNdIGF0aDExa19wY2kgMDAwMDowMTowMC4w
OiB3Y242ODU1IGh3Mi4wCj4+IFsgICAgNS4yNzM5MzBdIGF0aDExa19wY2kgMDAwMDowMTowMC4w
OiBjaGlwX2lkIDB4MCBjaGlwX2ZhbWlseSAweGIKPj4gYm9hcmRfaWQgMHg4YyBzb2NfaWQgMHg0
MDBjMDIwMAo+PiBbICAgIDUuMjg2MDIwXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZndfdmVy
c2lvbiAweDExMDQwNmI4Cj4+IGZ3X2J1aWxkX3RpbWVzdGFtcCAyMDIxLTAxLTA4IDA2OjE0IGZ3
X2J1aWxkX2lkCj4+IFFDX0lNQUdFX1ZFUlNJT05fU1RSSU5HPVdMQU4uSFNQLjEuMS0wMTcyMC4x
LVFDQUhTUFNXUExfVjFfVjJfU0lMSUNPTlpfTElURS0xCj4+IFsgICAgNS4zMTI0NjRdIGF0aDEx
a19wY2kgMDAwMDowMTowMC4wOiBmYWlsZWQgdG8gZmV0Y2ggYm9hcmQgZGF0YSBmb3IKPj4gYnVz
PXBjaSx2ZW5kb3I9MTdjYixkZXZpY2U9MTEwMyxzdWJzeXN0ZW0tdmVuZG9yPTE3Y2Isc3Vic3lz
dGVtLWRldmljZT0wMTA4LHFtaS1jaGlwLWlkPTAscW1pLWJvYXJkLWlkPTE0MAo+PiBmcm9tIGF0
aDExay9XQ042ODU1L2h3Mi4wL2JvYXJkLTIuYmluCj4+IFsgICAgNS4zODQzMTVdIGF0aDExa19w
Y2kgMDAwMDowMTowMC4wOiBsZWF2aW5nIFBDSSBBU1BNIGRpc2FibGVkIHRvCj4+IGF2b2lkIE1I
SSBNMiBwcm9ibGVtcwo+Pgo+Pgo+Pgo+PiBbMV0KPj4gaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVz
b3VyY2UuY29tL2Nocm9taXVtb3MvdGhpcmRfcGFydHkvbGludXgtZmlybXdhcmUvKy9kMjMzZGRk
ODlhYmUwNjQ0ODA3MDQ3MTk2M2E1OGMwYTdkYTgxZDc5L2F0aDExay9XQ042ODU1L2h3Mi4wCj4g
Cj4gVGhhdCBsb29rcyBsaWtlIGFuIHVuc3VwcG9ydGVkIGZpcm13YXJlIHZlcnNpb24uIEkgcmVj
b21tZW5kIHVzaW5nCj4gX2JvdGhfIGZpcm13YXJlcyBhbmQgYm9hcmQgZmlsZXMgb25seSBmcm9t
IGF0aDExay1maXJtd2FyZS5naXRbMV0gb3IKPiB1cHN0cmVhbSBsaW51eC1maXJtd2FyZVsyXS4K
PiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDExay1maXJtd2FyZQo+IAo+IFsy
XSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtd2Fy
ZS9saW51eC1maXJtd2FyZS5naXQvCgpBcyBJIHdyb3RlLCBsaW51eC1maXJtd2FyZSB2ZXJzaW9u
IGRvZXNuJ3Qgd29yay4gSSB3aWxsIHJldHJ5IG15IHRlc3RzIAp1c2luZyBvdGhlciB2ZXJzaW9u
cyBmcm9tIGF0aDExay1maXJtd2FyZS4KCgotLSAKV2l0aCBiZXN0IHdpc2hlcwpEbWl0cnkKCi0t
IAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
