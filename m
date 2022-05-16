Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D28C433EF
	for <ath11k@archiver.kernel.org>; Mon, 16 May 2022 13:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkwum2V7uUZN0CSHRhjnhc+OLFgxXStfdHa76uPl+rw=; b=Vajro1vBJk6XZy
	Pkz1+nTa1RnnLM4Igd3LJF5h2c3ZlrMIckk0GBUBrMV+p25rpJr0wlIRve8wn5+U+R+DJ5/i9pNMu
	Evu/QJ90Fggg3fND6wYHODAUq0z+vFL3ZTW5cN+HKD/LA43gz/WyCybX2cEb21FfNtpir/vr4kzwt
	tqQ6splZnQp39koufP57Uipw6M+9oD/NdxyPmooJQm/oCXe4lhfCxNXzM7imwhbMfH48m46ydRjn+
	ggNH69sikDqg0VwgATXKy96SEs7fxPctCqvpnek9GKioHyV3tPM6EqiDnVB8OkCxNoHk72pGhoPwu
	EvEMINCcpE7NnKc/CDRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqaS7-007rHZ-II; Mon, 16 May 2022 13:07:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqaLT-007o36-BF
 for ath11k@lists.infradead.org; Mon, 16 May 2022 13:01:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DABF1611C1;
 Mon, 16 May 2022 13:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A11DC385B8;
 Mon, 16 May 2022 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652706065;
 bh=XWC3EjkrXJutZt+sVnjM+ns/Z5Q2Hf1nAxojCbFozzo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ZlfAwqzkhtPfCnREhNbhyZQaZV+j2inFkK1WxKW5MnAd+SDaxFUkQ9AYUE6TZ5/6z
 eD0oDWxVZbCXFJJEUgbrMr+vlvDkujoV4EkFzO3dmPtlUvqwGwLwz1OXB6VNx/bs0r
 DvN2ebePkY4/FNz/BET5K0igXy7ruQlpCy0gwZ2FPdHojKObwd3q3jo8TQ2g1cn1FK
 4UqmCq99ZwxyxZ2Ld2KG3wg7x7eHfVr+3ECTU8q8vOAlT2YU/IYl8FfY/9IHqvT4WM
 r2t+8ysbJ8yxwYeO8rj0tAusF8DxU7CdN3UUG7ODnOotgGg2NbakQb6rD0mC8IDNtM
 YYw+dbqdLuWAw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6855 issues with latest linux-firmware
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
 <87v8ua624n.fsf@kernel.org>
 <08d0ec20-f9ae-c546-becb-a77404e91a9a@linaro.org>
Date: Mon, 16 May 2022 16:01:00 +0300
In-Reply-To: <08d0ec20-f9ae-c546-becb-a77404e91a9a@linaro.org> (Dmitry
 Baryshkov's message of "Thu, 12 May 2022 22:48:05 +0300")
Message-ID: <87sfp94ooj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_060107_512406_291DF22D 
X-CRM114-Status: GOOD (  14.85  )
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

RG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPiB3cml0ZXM6Cgo+
IE9uIDEyLzA1LzIwMjIgMjE6MjMsIEthbGxlIFZhbG8gd3JvdGU6Cj4+IERtaXRyeSBCYXJ5c2hr
b3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4gd3JpdGVzOgo+Pgo+Pj4gVGhlIHdjbjY4
NTUgV2lGaSBjaGlwIHN0b3BwZWQgd29ya2luZyBmb3IgbWUgYWZ0ZXIgYW4gdXBkYXRlIHRvIHRo
ZQo+Pj4gbGF0ZXN0IGxpbnV4LWZpcm13YXJlIChMaW51eCA1LjE4LXJjMikuIEkgY2FuIHJlcHJv
ZHVjZSBpdCB3aXRoIGJvdGgKPj4+IGh3Mi4wIGFuZCBodzIuMSBjaGlwcy4KPj4+Cj4+PiBIZXJl
IGlzIHRoZSBzZXQgb2Yga2VybmVsIG1lc3NhZ2VzIEknbSBnZXR0aW5nIGZyb20gYXRoMTFrX3Bj
aSBkcml2ZXI6Cj4+Pgo+Pj4gWyAgICA0LjQyMjM5MV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6
IEFkZGluZyB0byBpb21tdSBncm91cCAzCj4+PiBbICAgIDQuNDI5NTcxXSBhdGgxMWtfcGNpIDAw
MDA6MDE6MDAuMDogQkFSIDA6IGFzc2lnbmVkIFttZW0KPj4+IDB4NjA0MDAwMDAtMHg2MDVmZmZm
ZiA2NGJpdF0KPj4+IFsgICAgNC40Mzc4NTddIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBlbmFi
bGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikKPj4+IFsgICAgNC40NDUzMjNdIGF0aDExa19wY2kg
MDAwMDowMTowMC4wOiBNU0kgdmVjdG9yczogMQo+Pj4gWyAgICA0LjQ1MDM3NV0gYXRoMTFrX3Bj
aSAwMDAwOjAxOjAwLjA6IHdjbjY4NTUgaHcyLjAKPj4+IFsgICAgNS4zNzg0ODhdIGF0aDExa19w
Y2kgMDAwMDowMTowMC4wOiBjaGlwX2lkIDB4MiBjaGlwX2ZhbWlseSAweGIKPj4+IGJvYXJkX2lk
IDB4OGMgc29jX2lkIDB4NDAwYzAyMDAKPj4+IFsgICAgNS4zOTI4OThdIGF0aDExa19wY2kgMDAw
MDowMTowMC4wOiBmd192ZXJzaW9uIDB4MTEwZjBjMzUKPj4+IGZ3X2J1aWxkX3RpbWVzdGFtcCAy
MDIyLTAzLTMwIDA5OjA1IGZ3X2J1aWxkX2lkCj4+PiBRQ19JTUFHRV9WRVJTSU9OX1NUUklORz1X
TEFOLkhTUC4xLjEtMDMxMjUtUUNBSFNQU1dQTF9WMV9WMl9TSUxJQ09OWl9MSVRFLTMuNjUxMC43
Cj4+PiBbICAgIDUuNDIwNjQ4XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRvIGZl
dGNoIGJvYXJkIGRhdGEgZm9yCj4+PiBidXM9cGNpLHZlbmRvcj0xN2NiLGRldmljZT0xMTAzLHN1
YnN5c3RlbS12ZW5kb3I9MTdjYixzdWJzeXN0ZW0tZGV2aWNlPTAxMDgscW1pLWNoaXAtaWQ9Mixx
bWktYm9hcmQtaWQ9MTQwCj4+PiBmcm9tIGF0aDExay9XQ042ODU1L2h3Mi4wL2JvYXJkLTIuYmlu
Cj4+PiBbICAgMTUuNjg2Mzk4XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRvIHdh
aXQgYm9hcmQgZmlsZQo+Pj4gZG93bmxvYWQgcmVxdWVzdDogLTExMAo+Pj4gWyAgIDE1LjY5NDUz
MF0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IHFtaSBmYWlsZWQgdG8gbG9hZCBiZGYgZmlsZQo+
Pj4gWyAgIDE1LjcwMDc4NF0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0byBsb2Fk
IGJvYXJkIGRhdGEgZmlsZTogLTExMAo+Pgo+PiBXaGF0IFdDTjY4NTUgaGFyZHdhcmUgYXJlIHlv
dSBleGFjdGx5IHVzaW5nPyAobWFrZSwgbW9kZWwgZXRjKQo+Cj4gSSBoYXZlIGFza2VkIGZvciB0
aGUgaHcgZGV0YWlscy4gVGhlIHVzZXIgZ3VpZGUgZm9yIHRoZSBIREs4NDUwIGxpc3RzCj4gV0NO
Njg1NiBjaGlwIGFuZCBhbHNvIG1lbnRpb25zICdRdWFsY29tbcKuIEZhc3RDb25uZWN04oSiIDY5
MDAgU3lzdGVtcycuCgpTbyB0aGUgY2hpcCB3YXMgaW5jbHVkZWQgd2l0aGluIEhESzg0NTA/IEl0
IHdhcyBub3QgaW5zdGFsbGVkIHRvIHRoZQpib2FyZCBzZXBhcmF0ZWx5IG9yIGFueXRoaW5nIGxp
a2UgdGhhdD8KCj4+IEFuZCB3aGF0Cj4+IGJvYXJkIGZpbGUgYXJlIHlvdSB1c2luZz8gbWQ1c3Vt
cyBvZiBhbGwgZmlybXdhcmUgZmlsZXMgaXMgdGhlIGJlc3QuCj4KPiAjIG1kNXN1bSAvbGliL2Zp
cm13YXJlL2F0aDExay9XQ042ODU1L2h3Mi4xLyoKPiA0NjBmYmQ1ZGRjNTdiM2QyZWZiZjFjYTk3
NmY3OGI5MAo+IC9saWIvZmlybXdhcmUvYXRoMTFrL1dDTjY4NTUvaHcyLjEvYW1zcy5iaW4KPiA4
OGIzYTRmYmRlOGNhYjQ0OTNmMDA2MGFlM2I1ZGVlMwo+IC9saWIvZmlybXdhcmUvYXRoMTFrL1dD
TjY4NTUvaHcyLjEvYm9hcmQtMi5iaW4KPiA3ZmQxYzIzMzdiMGI2NTAyNTg4ZDMxNDFlMjA1ZTcz
NQo+IC9saWIvZmlybXdhcmUvYXRoMTFrL1dDTjY4NTUvaHcyLjEvYm9hcmQuYmluCj4gZDE0NjBm
YzFjNDU5NWQwZDIyZjgyZDViYWVhYWJiZDggIC9saWIvZmlybXdhcmUvYXRoMTFrL1dDTjY4NTUv
aHcyLjEvbTMuYmluCj4gZjY3YmU4MzY1OWM3OTBmZTE1ZDFlNDJhZjUwMWU5ZmEKPiAvbGliL2Zp
cm13YXJlL2F0aDExay9XQ042ODU1L2h3Mi4xL3JlZ2RiLmJpbgoKU28geW91IGFyZSB1c2luZyBh
IHNlcGFyYXRlIGJvYXJkLmJpbiBmaWxlLCB3aGVyZSBkaWQgeW91IGdldCBpdD8gYXRoMTFrCmJv
YXJkIGZpbGVzIGFyZSBkaWZmZXJlbnQgc28geW91IGNhbm5vdCB0YWtlIHRoZSBib2FyZCBmaWxl
IGZyb20KZWxzZXdoZXJlLgoKQ2FuIHlvdSBmaWxlIHRoaXMgdG8gYnVnemlsbGE6CgpodHRwczov
L3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi91c2Vycy9kcml2ZXJzL2F0aDExay9idWdyZXBv
cnQKClRoYXQgd2F5IGl0J3MgZWFzaWVyIHRvIHRyYWNrIGFuZCBJIGNhbiB0cnkgdG8gZmluZCB0
aGUgY29ycmVjdCBib2FyZApmaWxlLgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5l
bC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAK
YXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
