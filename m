Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2AEC61DA4
	for <ath11k@archiver.kernel.org>; Wed, 15 Mar 2023 10:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QF9t3YXs8ilAKErHPgegcumfY/Gq6AHUplz2/uAvBU=; b=B06JNVxQfW3I/L
	kfrjhQvetzFiPphlE7sL4SNFz51/9Sc8rTo4vfAqjYq1OxWQbVfXENjnG+sGpNTHDoHqA7FQIpJTK
	eXpfOoygFsC78/L4ao+3/uRgatALaLnabamHq6d0ib40ecy2yCBi4GbFSsu5Os0PXcgQSMEz6QonZ
	dC4JFd2rTDjxsRmsjc+07JJQfshT6foXxev5XVFnEFtcC2RJHRNeCptwOK4nKLqBNrYyXScoBJ9ST
	OqQMaX3AAZDwVnytdZ72W+AiEHKQthu10lx2qDm6F4MSTW256++1UVtwglJqx+TdQvc5I1IDzzHL6
	U6QuSIR2B9y93xlsL52A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcOE3-00D2eB-0D;
	Wed, 15 Mar 2023 10:19:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcODz-00D2dG-2w
	for ath11k@lists.infradead.org;
	Wed, 15 Mar 2023 10:19:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8C40DB81DA8;
	Wed, 15 Mar 2023 10:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0373C433EF;
	Wed, 15 Mar 2023 10:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678875553;
	bh=VRoiTmWaz2biO8bfxNbnjYigMHFcTYcPttbArQsA2po=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=YYPpbIq8YPV8QKLN6mqMua6A6EH/aqP9wN0P9tWrRNOob498Pv0jiL+uyYN8mN/pe
	 28PJKB3aGj0LhcIcTm70m6h3OHjAH0+cPJMwtfuqLMsg/XA/SMZizB8ZOhcwm3K1Rc
	 9XOPkk4DZDsUV5pj5GjSntFrhzehvZ5siec4dxVL83ePBlVTFnti4nBm/haPSrzSTv
	 T6MbhQDu1Enob/WSixB6+wj/R3MWmRTwF2wRTmW8bQF+jsEuCu2xaErxgiaKYU7cYg
	 a1JHiUatQk8ojc7cDwVS3UMo4qp6zBXjhYUL/E3JfFd0vVMhs4K23jPuBQXcNYQq5f
	 xVvmv9TIvEINA==
MIME-Version: 1.0
Subject: Re: [PATCH][next] wifi: ath11k: Replace fake flex-array with
 flexible-array member
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <ZAe5L5DtmsQxzqRH@work>
References: <ZAe5L5DtmsQxzqRH@work>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167887554899.27926.8193942719912747095.kvalo@kernel.org>
Date: Wed, 15 Mar 2023 10:19:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_031916_089978_9C759EC6 
X-CRM114-Status: UNSURE (   7.86  )
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

Ikd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBa
ZXJvLWxlbmd0aCBhcnJheXMgYXMgZmFrZSBmbGV4aWJsZSBhcnJheXMgYXJlIGRlcHJlY2F0ZWQg
YW5kIHdlIGFyZQo+IG1vdmluZyB0b3dhcmRzIGFkb3B0aW5nIEM5OSBmbGV4aWJsZS1hcnJheSBt
ZW1iZXJzIGluc3RlYWQuCj4gCj4gQWRkcmVzcyAyNSBvZiB0aGUgZm9sbG93aW5nIHdhcm5pbmdz
IGZvdW5kIHdpdGggR0NDLTEzIGFuZAo+IC1mc3RyaWN0LWZsZXgtYXJyYXlzPTMgZW5hYmxlZDoK
PiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2RlYnVnZnNfaHR0X3N0YXRzLmM6MzA6
NTE6IHdhcm5pbmc6IGFycmF5IHN1YnNjcmlwdCA8dW5rbm93bj4gaXMgb3V0c2lkZSBhcnJheSBi
b3VuZHMgb2Yg4oCYY29uc3QgdTMyWzBd4oCZIHtha2Eg4oCYY29uc3QgdW5zaWduZWQgaW50W13i
gJl9IFstV2FycmF5LWJvdW5kcz1dCj4gCj4gVGhpcyBoZWxwcyB3aXRoIHRoZSBvbmdvaW5nIGVm
Zm9ydHMgdG8gdGlnaHRlbiB0aGUgRk9SVElGWV9TT1VSQ0UKPiByb3V0aW5lcyBvbiBtZW1jcHko
KSBhbmQgaGVscCB1cyBtYWtlIHByb2dyZXNzIHRvd2FyZHMgZ2xvYmFsbHkKPiBlbmFibGluZyAt
ZnN0cmljdC1mbGV4LWFycmF5cz0zIFsxXS4KPiAKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20v
S1NQUC9saW51eC9pc3N1ZXMvMjEKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vS1NQUC9saW51
eC9pc3N1ZXMvMjY2Cj4gTGluazogaHR0cHM6Ly9nY2MuZ251Lm9yZy9waXBlcm1haWwvZ2NjLXBh
dGNoZXMvMjAyMi1PY3RvYmVyLzYwMjkwMi5odG1sIFsxXQo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rh
dm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogU2lt
b24gSG9ybWFuIDxzaW1vbi5ob3JtYW5AY29yaWdpbmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEth
bGxlIFZhbG8gPHF1aWNfa3ZhbG9AcXVpY2luYy5jb20+CgpQYXRjaCBhcHBsaWVkIHRvIGF0aC1u
ZXh0IGJyYW5jaCBvZiBhdGguZ2l0LCB0aGFua3MuCgozYjEwODhhMDllYzkgd2lmaTogYXRoMTFr
OiBSZXBsYWNlIGZha2UgZmxleC1hcnJheSB3aXRoIGZsZXhpYmxlLWFycmF5IG1lbWJlcgoKLS0g
Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRj
aC9aQWU1TDVEdG1zUXh6cVJIQHdvcmsvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9y
Zy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCgotLSAKYXRo
MTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
