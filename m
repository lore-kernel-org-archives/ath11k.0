Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125D8C433EF
	for <ath11k@archiver.kernel.org>; Tue, 18 Jan 2022 02:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUdSEvhab0jES0SKQQMRNz+E2YqLuN+UrmUOrXLfJ+s=; b=lOq9TZ00Muy+4t
	/ulqHzlTaI0pORoXQ6ADXQWqefRUbpR6K/ABXTvFW3h1FczBsPHRjqXdmGRwwCKhpIS/xFgST9PoB
	Seuceb36m6sSyYCWn0XKNRZLJN/NWZNURLmZn9fnU8bNCI78ojHS1wcK9locFIz0cokHHvGyNUGpM
	7V6EFdT04lt8PPlsb4Qv1VIp0atdzt/upONnGi04NNJuu5eexL/PUF86CA60KHcsowKhtg1sDsqL2
	T3VaGhIsJdzzSlaGtPQbw1HIyy2+XD3Bg1cshG7pl6293ldE321sp2L91rqfZ2xj9bu0U9iCDjyhC
	iz1WHgOKV4901S8MWYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9e7f-00GsdH-9C; Tue, 18 Jan 2022 02:21:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9e7S-00Gsat-PU
 for ath11k@lists.infradead.org; Tue, 18 Jan 2022 02:21:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89AB7B8122C;
 Tue, 18 Jan 2022 02:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5CAC36AF2;
 Tue, 18 Jan 2022 02:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472469;
 bh=VbjM88vfkzibxjmt+y58uIpvisAVC02ljgpwkY+7PCM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IyIqOvMJqL7RaoEbzRxRgUDtWsbYLmZquDAk1r1YUi3abPpS4Rk5WRFB17kDXL8Hi
 xCDivf4R3oaw613eqz3sXdXVM4IQG96lHeHeI5jVDHSqInVLlEj27ym/okj7o05KkB
 X7Gnwmz8SvkmdG9tl5jxUynZ3VFmKrTF6iffT2iPJvI3uru8eqADfrIyNfKUDmzlA8
 kZxYppO0vKJM3jgwkm+FUejK8MkvEdMagrWA5Pi+dFabkrufg8QdKp5JyJfuWxsLN8
 GgFIh/7kSHPidd3ZR93i8AiaMkYVkgW8qrNI2q5sjJt35MctfT7pJ5jl3BnYjJPXrx
 Y+R0mBthx2h6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>,
 Sasha Levin <sashal@kernel.org>, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 024/217] ath11k: enable
 IEEE80211_VHT_EXT_NSS_BW_CAPABLE if NSS ratio enabled
Date: Mon, 17 Jan 2022 21:16:27 -0500
Message-Id: <20220118021940.1942199-24-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_182110_994392_C49F327A 
X-CRM114-Status: GOOD (  10.24  )
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

RnJvbTogV2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPgoKWyBVcHN0cmVhbSBjb21taXQg
Nzg0MDYwNDRiZGQwY2M4OTg3YmMwODJiNzY4NjdjNjNhYjFjNmFmOCBdCgpXaGVuIE5TUyByYXRp
byBlbmFibGVkIHJlcG9ydGVkIGJ5IGZpcm13YXJlLCBTVVBQT1JUU19WSFRfRVhUX05TU19CVwpp
cyBzZXQgaW4gYXRoMTFrLCBtZWFud2hpbGUgSUVFRTgwMjExX1ZIVF9FWFRfTlNTX0JXX0NBUEFC
TEUgYWxzbwpuZWVkIHRvIGJlIHNldCwgb3RoZXJ3aXNlIGl0IGlzIGludmFsaWQgYmVjYXVzZSBz
cGVjIGluIElFRUUgU3RkCjgwMi4xMeKEouKAkDIwMjAgYXMgYmVsb3cuCgpUYWJsZSA5LTI3My1T
dXBwb3J0ZWQgVkhULU1DUyBhbmQgTlNTIFNldCBzdWJmaWVsZHMsIGl0IGhhcyBzdWJmaWVsZApW
SFQgRXh0ZW5kZWQgTlNTIEJXIENhcGFibGUsIGl0cyBkZWZpbml0aW9uIGlzOgpJbmRpY2F0ZXMg
d2hldGhlciB0aGUgU1RBIGlzIGNhcGFibGUgb2YgaW50ZXJwcmV0aW5nIHRoZSBFeHRlbmRlZCBO
U1MKQlcgU3VwcG9ydCBzdWJmaWVsZCBvZiB0aGUgVkhUIENhcGFiaWxpdGllcyBJbmZvcm1hdGlv
biBmaWVsZC4KCmRtZXNnIGhhdmUgYSBtZXNzYWdlIHdpdGhvdXQgdGhpcyBwYXRjaDoKCmllZWU4
MDIxMSBwaHkwOiBjb3B5aW5nIHNiYW5kIChiYW5kIDEpIGR1ZSB0byBWSFQgRVhUIE5TUyBCVyBm
bGFnCgpJdCBtZWFucyBtYWM4MDIxMSB3aWxsIHNldCBJRUVFODAyMTFfVkhUX0VYVF9OU1NfQldf
Q0FQQUJMRSBpZiBhdGgxMWsgbm90CnNldCBpdCBpbiBpZWVlODAyMTFfcmVnaXN0ZXJfaHcoKS4g
U28gaXQgaXMgYmV0dGVyIHRvIHNldCBpdCBpbiBhdGgxMWsuCgpUZXN0ZWQtb246IFdDTjY4NTUg
aHcyLjAgUENJIFdMQU4uSFNQLjEuMS0wMTcyMC4xLVFDQUhTUFNXUExfVjFfVjJfU0lMSUNPTlpf
TElURS0xCgpTaWduZWQtb2ZmLWJ5OiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5vcmc+ClNp
Z25lZC1vZmYtYnk6IEthbGxlIFZhbG8gPGt2YWxvQGNvZGVhdXJvcmEub3JnPgpMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjExMDEzMDczNzA0LjE1ODg4LTEtd2dvbmdAY29kZWF1
cm9yYS5vcmcKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgot
LS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgfCA0ICsrKysKIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTFrL21hYy5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9t
YWMuYwppbmRleCAxY2M1NTYwMjc4N2JiLi4wYTE5NmZiM2RmOWZkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMWsvbWFjLmMKQEAgLTQ1NjEsNiArNDU2MSwxMCBAQCBhdGgxMWtfY3JlYXRl
X3ZodF9jYXAoc3RydWN0IGF0aDExayAqYXIsIHUzMiByYXRlX2NhcF90eF9jaGFpbm1hc2ssCiAJ
dmh0X2NhcC52aHRfc3VwcG9ydGVkID0gMTsKIAl2aHRfY2FwLmNhcCA9IGFyLT5wZGV2LT5jYXAu
dmh0X2NhcDsKIAorCWlmIChhci0+cGRldi0+Y2FwLm5zc19yYXRpb19lbmFibGVkKQorCQl2aHRf
Y2FwLnZodF9tY3MudHhfaGlnaGVzdCB8PQorCQkJY3B1X3RvX2xlMTYoSUVFRTgwMjExX1ZIVF9F
WFRfTlNTX0JXX0NBUEFCTEUpOworCiAJYXRoMTFrX3NldF92aHRfdHhiZl9jYXAoYXIsICZ2aHRf
Y2FwLmNhcCk7CiAKIAlyeG1jc19tYXAgPSAwOwotLSAKMi4zNC4xCgoKLS0gCmF0aDExayBtYWls
aW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
