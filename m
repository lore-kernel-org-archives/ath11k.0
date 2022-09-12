Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B62ECAAA1
	for <ath11k@archiver.kernel.org>; Mon, 12 Sep 2022 10:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDhic47Wf3RM1BJIbSVz3uFmKnRHFZil7rpP78dFhbk=; b=M8dCa4ryICJzP1
	peEXZFeDgRYDClMR0A0RV6UVNwgjsf5fxayxU8JAg1S7flihfuBlR/unQdOUKNNQ5hvFRcxNuccrO
	v0osswNliwKj2AgP/DUT62yifE41Xc++ex29s2EY4gR2dgV6AdzSQS8fTGRUTK547dp3r5EZ3CPyB
	QDmQMBa1Pcxx3tlqmrWjsHGL/ZicMkPHTqknjI98erJ9YJkt+LLMX0g8RDWB4EsaifFJZa7IqUFbX
	ERYGwt5KCCcdeIsBWdfrhn+3ghdjwBbR88GvwPrAmcXJMr64/vAgJZrkaYUTnTeKPL7XyOpeTKlVm
	caYwTGPSY/nN7CJPNoCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXh1n-0090Fy-Dl; Mon, 12 Sep 2022 10:50:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXh0I-008yzN-Qh
	for ath11k@lists.infradead.org; Mon, 12 Sep 2022 10:49:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 80A5EB80C69;
	Mon, 12 Sep 2022 10:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F494C433C1;
	Mon, 12 Sep 2022 10:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662979763;
	bh=GWmpLkDHOamaH18vVPfnc4F1h0ku9hgrS00WmUIaHd4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GPVtZWPLpQyDW4JdxgKheDA/6H0tLlD3sgTpsGiB86JH1V3s/jgdInhvAyxwBm3zL
	 OHtnci26mAAwfIUJ9Ieg8e8OZ/2H45cPPxF2XfndumxboewD0SrWxZiDMveVSOYZ4P
	 C7p/3r10nxBx08og1c4kbpZ04pLF69KbHuXfBcOGFl9TMHILGkUxn2lpO0en8AJjGw
	 aH1dkqCg6AimMfBjE68452nevXfiEan1qjj5FgP1yCxC3GHKFXhUG9qIFlKxoNQzZQ
	 YQen1gq4TAG4Azu3Zs504nyYb+ODryhA8KwVtfMUniPbkTrj5Wp0PPisV+yCYLDD5M
	 wN8mXuntltKuA==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,  linux-wireless <linux-wireless@vger.kernel.org>,  <ath11k@lists.infradead.org>
Subject: Re: [PATCH] wifi: mac80211: RCU-ify link STA pointers
In-Reply-To: <24df3a0c-a312-d9b6-5840-1eacd79d824b@quicinc.com> (Wen Gong's
	message of "Mon, 12 Sep 2022 17:36:47 +0800")
References: <24df3a0c-a312-d9b6-5840-1eacd79d824b@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Mon, 12 Sep 2022 13:49:19 +0300
Message-ID: <87a67498b4.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_034927_054251_4507D781 
X-CRM114-Status: GOOD (  10.74  )
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

V2VuIEdvbmcgPHF1aWNfd2dvbmdAcXVpY2luYy5jb20+IHdyaXRlczoKCj4gSGkgSm9oYW5uZXMs
Cj4KPiBDdXJyZW50bHkgZm9yIE1MTyB0ZXN0LCB0aGUgb3RoZXJzIGxpbmtzJ3MgcnhfbnNzIG9m
IHN0cnVjdAo+IGllZWU4MDIxMV9saW5rX3N0YSBpcyBzdGlsbCB2YWx1ZSAwIGluIGllZWU4MDIx
MV9zZXRfYXNzb2NpYXRlZCgpLAo+IGJlY2F1ZSB0aGV5IGFyZSBub3QgcGFzcyBpbnRvIGllZWU4
MDIxMV9zdGFfc2V0X3J4X25zcygpIGluCj4gbWFjODAyMTEgZXhjZXB0IHRoZSBkZWZsaW5rIHdo
aWNoIG1lYW5zIHRoZSBwcmltYXJ5IGxpbmsuCj4gVGhpcyBsZWFkIGRyaXZlciBnZXQgbnNzID0g
MCBmb3Igb3RoZXIgbGlua3MuIFdpbGwgeW91IGZpeCBpdAo+IG9yIGlzIGl0IGRlc2lnbiBieSBk
ZWZhdWx0Pwo+Cj4gT25seSBwcmltYXJ5IGxpbmsgaGFzIHZhbGlkIHJ4X25zcyB2YWx1ZSB3aGlj
aCBpcyBub3QgMCBieSBiZWxvdyBjYWxsIHN0YWNrLgo+IGllZWU4MDIxMV9hc3NvY19zdWNjZXNz
KCktPgo+IMKgwqDCoCByYXRlX2NvbnRyb2xfcmF0ZV9pbml0KHN0YSk7Cj4KPiBjb21taXQ6Yzcx
NDIwZGI2NTNhYmEzMGEyMzRkMWU0Y2Y4NmRkZTM3NmU2MDRmYQo+IHdpZmk6IG1hYzgwMjExOiBS
Q1UtaWZ5IGxpbmsgU1RBIHBvaW50ZXJzCgpTdHJhbmdlIGZvcm1hdCBhbmQgcy1vLWIgbWlzc2lu
Zy4gV2FzIHRoaXMgbWVhbnQgYXMgYW4gUkZDIHBhdGNoPwoKLS0gCmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVz
cy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdw
YXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
