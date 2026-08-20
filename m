Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF33C5DF87
	for <ath11k@archiver.kernel.org>; Thu, 20 Aug 2026 23:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5guak/l5UyDzlzPmHmh7n4osKYDtyW2ixRiNRrlsVf4=; b=LIKil/3WuROJLZQB9pQu0leiHd
	3evF0LpV4fzjcr2XCKjeZ67sR3lzBP1KOyqcSry+LtGpR/PZWNrasTVddepwVlEOl8qkA0sYemh95
	AY3h/bvM2VLcWnBLC99E7AyULCcHBBd25dm7/mVN1O4KI5cpovGvDGQ60dbNNgVx5CPzLwavOUEUh
	V59iP7BvqFB1ApxU9iq2X8yUdMFrwWN0ClVvzqwI9KnCOKzSNxo4cSUoKjpbUDDYndnFhAWRWj9TT
	sJUYdEvxbF/vAI6KBHP7h2DGaY7hnBWAl2K0WCqG/LjpcNNYUISoxP3zLSpcPi0wPyoyutfOAiI+r
	zK5CvITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxC0P-0000000CKOB-1E42;
	Thu, 20 Aug 2026 23:17:05 +0000
Received: from out-128.mta0.migadu.com ([2001:41d0:1004:224b::80] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxC0M-0000000CKNW-3JRZ
	for ath11k@lists.infradead.org;
	Thu, 20 Aug 2026 23:17:04 +0000
X-Envelope-To: ath11k@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=5guak/l5UyDzlzPmHmh7n4osKYDtyW2ixRiNRrlsVf4=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787267820; v=1; x=1787872620;
 b=in3SMw6VyM5Uf8XmGD2+iV73AO0EWiRd3g1fqLmoUNm74kSFI3ZrjklFZ9LoSs+szeO/fgw3
 OiS4bZNHBXTus4w0ltvdw8m+wy1YSxoHf2oCsr5roZMxTBF9fw3rzQuOEAf1NktptW2On+j8Ju3
 o+eGCnc3uLB2yEYAn4Mm9Z/Ngs09mfjUj1LyTkIW0cZeIxMMHZoSTj4Jr0VKoBBKRHY2xJQbgDU
 Cob7EY9gjT36MU8UDYva9miSl/peJbUll93nlp4KZOF7U2XzDAzflB+32VpYT5/9W25Kbgxtq5b
 Waq0cTJ0nOf61jGVkbL8iQBMJGmjXwJnxrFn3bzCSPRZg==
X-Envelope-To: ath11k@lists.infradead.org
Received: from fedora (187.15.154.68)
	by smtp.migadu.com with ESMTPS id c467778d2f607571;
	Thu, 20 Aug 2026 23:16:50 +0000
X-Mizu-Trace-ID: c467778d2f607571
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Benjamin Berg <benjamin@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Benjamin Berg <benjamin.berg@intel.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH wireless-next v3 2/8] wifi: mac80211: change public RX API to use link stations
Date: Thu, 20 Aug 2026 16:15:04 -0700
Message-ID: <20260820231504.137503-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1bdf4b7d-2f05-4ae3-8304-60697d2c849d@oss.qualcomm.com>
References: <20260819135703.4072215-10-benjamin@sipsolutions.net> <20260819155703.af6d319e6b61.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid> <1bdf4b7d-2f05-4ae3-8304-60697d2c849d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_161702_964743_B74F00E5 
X-CRM114-Status: UNSURE (   7.81  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Thu, Aug 20, 2026 at 10:56:14AM -0700, Jeff Johnson wrote:
> The fix is trivially `= NULL`.

That does fix the first frame in a batch, but it cannot fix the ones after
it. The initialiser runs once, at entry, and mt76_rx_complete() reuses the
same variable for every frame and again in the A-MSDU loop. So once a frame
with a wcid has written a station into it, the next frame without one keeps
that station rather than reading NULL.

That is the case I measured on an MT7922. Sixteen frames out of roughly
4000 were handed a leftover station, and every one had a wcid-bearing frame
ahead of it in the same batch, so an initialiser would not have caught any
of them.

Clearing it on the no-wcid path inside mt76_rx_convert() covers both.

Devin

