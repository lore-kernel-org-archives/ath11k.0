Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85709E80AB1
	for <ath11k@archiver.kernel.org>; Wed, 27 Sep 2023 14:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xLCJgPdH2AOB7UXo/BEyHZ4cq1cbKHPflUbKTOcNBPQ=; b=ps5QHeBfIWtpVZ
	p7abqFgtepCfA5mf1vh/4Ygsl7VmgFVE+1jawabYhQKhp+BwVypmmRox8hueDMxBVYJFIdRYP+h6r
	MWVnUQdMRS1WzuQ6R/8CRWmXGmVOFqjP4ET6ZA/3Cvti8b1l1zvTW+EF6J1WH9buPpYhHNGuJx0Ix
	MDrLwj8mnvqbXMRESPmI8TOtfC3awmPPAQ1QJSZjbvFUggjJlI2M3NGqanByXQbD6L+U6czyXgs5X
	eOtAZ6GJvEWrE9KJIRl6r5fqFQYGfzN+/PCkBfM5jrcIZ6dhL4v3+4PK3tiUgP1nvlR92skaacpWP
	a3h1wcML9HgRWvwM52gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVVU-0018R7-1r;
	Wed, 27 Sep 2023 14:27:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVVS-0018QO-25
	for ath11k@lists.infradead.org;
	Wed, 27 Sep 2023 14:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58914CE188B
	for <ath11k@lists.infradead.org>; Wed, 27 Sep 2023 14:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BE7C433C8;
	Wed, 27 Sep 2023 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695824831;
	bh=/K4oe3X/dlVARO85QHUA5C1y7kL3dVI9yU92xRcX9uI=;
	h=From:To:Cc:Subject:Date:From;
	b=r00jlFpr0NfaxbkDhKWGLWr4aB7jZaGhdPxUrSUnVQIaZsohG3Hz7ER3cIFng0JpY
	 xZquEYYq0fXHWrYkuUeqjs0cRV6vsgXHZCbkaMCjrXXxtv4fh+9/n1MyPf3ZrpxyDf
	 rRl9RLM2IuZqbia3WUlbFljwQ6reyWMkNa46QqaTxCIg9gR0QTlSxVDA3F4EilNk2Q
	 l7mt1YL5e3CveJYLY8xBTxuaeC2TDbZl9shAjKF4GdT4KyNoK2vROk9GQ3vOjLkSWz
	 NMF0JCOC+kHSd3XNJk4qDj8ewYO6QzLISWg6i0KU9zXFDBh6hYPkfyKyXB34Jnag9A
	 OGeav2+r9RJIQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v3 0/1] wifi: ath11k: mac: fix struct ieee80211_sband_iftype_data handling
Date: Wed, 27 Sep 2023 17:27:07 +0300
Message-Id: <20230927142708.2897504-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_072714_905968_C0800E7A 
X-CRM114-Status: UNSURE (   6.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

Fix a sparse warning in ath11k.

v3:

* check NULL from ieee80211_get_he_iftype_cap_vif()

v2: https://patchwork.kernel.org/project/linux-wireless/patch/20230926163350.2641064-1-kvalo@kernel.org/

* use ieee80211_get_he_iftype_cap_vif() instead of open coding it

v1: https://patchwork.kernel.org/project/linux-wireless/patch/20230921075440.1539515-1-kvalo@kernel.org/

Kalle Valo (1):
  wifi: ath11k: mac: fix struct ieee80211_sband_iftype_data handling

 drivers/net/wireless/ath/ath11k/mac.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)


base-commit: 73e13f6a439b75a9dbc84bbfa0b0d6624b354853
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
