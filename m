Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C6FFA3743
	for <ath11k@archiver.kernel.org>; Tue,  1 Nov 2022 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cw1x8qpo+aEvPBMJVoUHHOdcQ2FUz78QP2lSB5nUFSQ=; b=ZaOtwD1rc4ru0y
	Iblv4DRNRCcfbBj8Vnp/N8hJfotSQI1ojRpnWIvsnjXxT36KVef6WOFF6nLMfQOHp8QsGSQDLutO8
	5l9B2KyLJs6v/jjO4MFz5fzUsHofYNEELFL86tNQx/PMKiJiLd3wCGUHcNSqXccwq8A+WH8wPY0NI
	iiARuDEJlAZkLHu779C3c+sTROEama58OOxhGeZ41B961+ioTg21oX5z6lBwNs6X5J2I2bZtbWMiO
	fsm7+wVECQt2j0iRkWTWqMjRer2pl38QgHOS60K7fVGnLo+QuvXTIh5yMjbgcARihIsFDrQUnPvUS
	34Cn2AHqLtG3h6xGiKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opmuO-003Gnl-ID; Tue, 01 Nov 2022 08:46:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opmuL-003GmO-3f
	for ath11k@lists.infradead.org; Tue, 01 Nov 2022 08:46:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D03E461570;
	Tue,  1 Nov 2022 08:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D0CC433B5;
	Tue,  1 Nov 2022 08:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667292363;
	bh=FpS71S38hnMEG7b0x8rTpo/7NG3z6UPDtnm8A5gut/c=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KAiXBG6nPHNt2pYgB6pV6ZYv+3QBPsPPCJaZWFdELNuii6ARso75uFKAlFKhBn9jp
	 En3G6T0mWzAC/cgwp5wLX3IytGYqgI+WiXbfyuAb2mLsJRcUcHTeDVbas8fmfYU6+r
	 I+vcQ0IGqnHEoFlOyOqtf1H3su+Ln2t8JvvPSgrYBCvgGg27+fx7jBw8jVqLsYqx+L
	 XKl3LjksH8ZGGob2SNT6Y4/X6qvsBy05G6ZjBurjU7cGketff8ls40XvrPjFPfqHoC
	 mvwTMr2+/m63uOd8kfdBkdsqNgSSzFaIg0m1/KWHDRAKZ+2OjfVwj4troQWknS95XC
	 6Mln+zkrIX8xA==
From: Kalle Valo <kvalo@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  linux-kernel@vger.kernel.org,  Martin Liska <mliska@suse.cz>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH] ath11k (gcc13): synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
References: <20221031114341.10377-1-jirislaby@kernel.org>
	<55c4d139-0f22-e7ba-398a-e3e0d8919220@quicinc.com>
	<833c7f2f-c140-5a0b-1efc-b858348206ec@kernel.org>
Date: Tue, 01 Nov 2022 10:45:56 +0200
In-Reply-To: <833c7f2f-c140-5a0b-1efc-b858348206ec@kernel.org> (Jiri Slaby's
	message of "Tue, 1 Nov 2022 06:49:25 +0100")
Message-ID: <87bkprgj0b.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_014605_270457_44CE9222 
X-CRM114-Status: GOOD (  14.41  )
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

SmlyaSBTbGFieSA8amlyaXNsYWJ5QGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gT24gMzEuIDEwLiAy
MiwgMjI6MTYsIEplZmYgSm9obnNvbiB3cm90ZToKPgo+PiBPbiAxMC8zMS8yMDIyIDQ6NDMgQU0s
IEppcmkgU2xhYnkgKFNVU0UpIHdyb3RlOgo+Pj4gYXRoMTFrX21hY19oZV9naV90b19ubDgwMjEx
X2hlX2dpKCkgZ2VuZXJhdGVzIGEgdmFsaWQgd2FybmluZyB3aXRoCj4+PiBnY2MtMTM6Cj4+PiDC
oMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmM6MzIxOjIwOiBlcnJvcjog
Y29uZmxpY3RpbmcKPj4+IHR5cGVzIGZvciAnYXRoMTFrX21hY19oZV9naV90b19ubDgwMjExX2hl
X2dpJyBkdWUgdG8gZW51bS9pbnRlZ2VyCj4+PiBtaXNtYXRjaDsgaGF2ZSAnZW51bSBubDgwMjEx
X2hlX2dpKHU4KScKPj4+IMKgwqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMu
aDoxNjY6NTogbm90ZTogcHJldmlvdXMKPj4+IGRlY2xhcmF0aW9uIG9mICdhdGgxMWtfbWFjX2hl
X2dpX3RvX25sODAyMTFfaGVfZ2knIHdpdGggdHlwZQo+Pj4gJ3UzMih1OCknCj4+Pgo+Pj4gSS5l
LiB0aGUgdHlwZSBvZiB0aGUgcmV0dXJuIHZhbHVlIGF0aDExa19tYWNfaGVfZ2lfdG9fbmw4MDIx
MV9oZV9naSgpIGluCj4+PiB0aGUgZGVjbGFyYXRpb24gaXMgdTMyLCB3aGlsZSB0aGUgZGVmaW5p
dGlvbiBzcGVsbHMgZW51bSBubDgwMjExX2hlX2dpLgo+Pj4gU3luY2hyb25pemUgdGhlbSB0byB0
aGUgbGF0dGVyLgo+Pj4KPj4+IENjOiBNYXJ0aW4gTGlza2EgPG1saXNrYUBzdXNlLmN6Pgo+Pj4g
Q2M6IEthbGxlIFZhbG8gPGt2YWxvQGtlcm5lbC5vcmc+Cj4+PiBDYzogIkRhdmlkIFMuIE1pbGxl
ciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4+PiBDYzogRXJpYyBEdW1hemV0IDxlZHVtYXpldEBn
b29nbGUuY29tPgo+Pj4gQ2M6IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+Cj4+PiBD
YzogUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPgo+Pj4gQ2M6IGF0aDExa0BsaXN0cy5p
bmZyYWRlYWQub3JnCj4+PiBDYzogbGludXgtd2lyZWxlc3NAdmdlci5rZXJuZWwub3JnCj4+PiBD
YzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZwo+Pj4gU2lnbmVkLW9mZi1ieTogSmlyaSBTbGFieSAo
U1VTRSkgPGppcmlzbGFieUBrZXJuZWwub3JnPgo+Pgo+PiBTdWdnZXN0IHRoZSBzdWJqZWN0IHNo
b3VsZCBiZQo+PiB3aWZpOiBhdGgxMWs6IHN5bmNocm9uaXplIGF0aDExa19tYWNfaGVfZ2lfdG9f
bmw4MDIxMV9oZV9naSgpJ3MgcmV0dXJuIHR5cGUKPgo+IEZXSVcgSSBjb3BpZWQgZnJvbToKPiAk
IGdpdCBsb2cgLS1mb3JtYXQ9JXMgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFj
LmgKPiBhdGgxMWs6IEhhbmRsZSBrZWVwYWxpdmUgZHVyaW5nIFdvV0xBTiBzdXNwZW5kIGFuZCBy
ZXN1bWUKPiBhdGgxMWs6IHJlZHVjZSB0aGUgd2FpdCB0aW1lIG9mIDExZCBzY2FuIGFuZCBodyBz
Y2FuIHdoaWxlIGFkZCBpbnRlcmZhY2UKPiBhdGgxMWs6IEFkZCBiYXNpYyBXb1cgZnVuY3Rpb25h
bGl0aWVzCj4gYXRoMTFrOiBhZGQgc3VwcG9ydCBmb3IgaGFyZHdhcmUgcmZraWxsIGZvciBRQ0E2
MzkwCj4gYXRoMTFrOiByZXBvcnQgdHggYml0cmF0ZSBmb3IgaXcgd2xhbiBzdGF0aW9uIGR1bXAK
PiBhdGgxMWs6IGFkZCAxMWQgc2NhbiBvZmZsb2FkIHN1cHBvcnQKPiBhdGgxMWs6IGZpeCByZWFk
IGZhaWwgZm9yIGh0dF9zdGF0cyBhbmQgaHR0X3BlZXJfc3RhdHMgZm9yIHNpbmdsZSBwZGV2Cj4g
YXRoMTFrOiBhZGQgc3VwcG9ydCBmb3IgQlNTIGNvbG9yIGNoYW5nZQo+IGF0aDExazogYWRkIHN1
cHBvcnQgZm9yIDgwUDgwIGFuZCAxNjAgTUh6IGJhbmR3aWR0aAo+IGF0aDExazogQWRkIHN1cHBv
cnQgZm9yIFNUQSB0byBoYW5kbGUgYmVhY29uIG1pc3MKPiBhdGgxMWs6IGFkZCBzdXBwb3J0IHRv
IGNvbmZpZ3VyZSBzcGF0aWFsIHJldXNlIHBhcmFtZXRlciBzZXQKPiBhdGgxMWs6IHJlbW92ZSAi
YXRoMTFrX21hY19nZXRfYXJfdmRldl9zdG9wX3N0YXR1cyIgcmVmZXJlbmNlcwo+IGF0aDExazog
UGVyZm9ybSBwZXItbXNkdSByeCBwcm9jZXNzaW5nCj4gYXRoMTFrOiBmaXggaW5jb3JyZWN0IHBl
ZXIgc3RhdHMgY291bnRlcnMgdXBkYXRlCj4gYXRoMTFrOiBNb3ZlIG1hYzgwMjExIGh3IGFsbG9j
YXRpb24gYmVmb3JlIHdtaV9pbml0IGNvbW1hbmQKPiBhdGgxMWs6IGZpeCBtaXNzZWQgYncgY29u
dmVyc2lvbiBpbiB0eCBjb21wbGV0aW9uCj4gYXRoMTFrOiBkcml2ZXIgZm9yIFF1YWxjb21tIElF
RUUgODAyLjExYXggZGV2aWNlcwoKWWVhaCwgdXNpbmcgIndpZmk6IiBpcyBhIG5ldyBwcmVmaXgg
d2Ugc3RhcnRlZCB1c2luZyB3aXRoIHdpcmVsZXNzCnBhdGNoZXMgdGhpcyB5ZWFyLgoKLS0gCmh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoK
aHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0
aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDExawo=
