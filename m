Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711E5C04FF0
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tiy1gt4Woafvx0uRnSK7MBSrbRDXILF+pVSATv8TAI=; b=jlGi96/4A+cGeA38Cf2IV12HqE
	pufGDJtccdttcBr7M5BJpsKUdRwKxzmTvgCOtogOJt6cixhznIBxxF+1RNPlXVCnNQYWwYuXZAdQ7
	GVi3+vRztmwkazlgHribgpDuEzsn+bL0LH+29RPzE4EKh1CosJ7yADBZyRkdmG5QXzRLNleaCVqtB
	wpB7AQ46SM10iivxGq8n31ckufoVbQo8eVJlIJjFTD8K2vPOzQzWFQWRoiEmjLKqqRpjvMm9/cw6J
	C0008B64PZvzjSiO/bN+DI/LICdfZnuAJQ8RwmhuebW0+K6fhy2CQUsitLHP1NucC8iBqp7RtQPp9
	d+rsVUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxhv-0000000DCb3-0RNG;
	Thu, 11 Apr 2024 16:55:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxhr-0000000DCYf-0RyS
	for ath11k@lists.infradead.org;
	Thu, 11 Apr 2024 16:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 695D0CE1233
	for <ath11k@lists.infradead.org>; Thu, 11 Apr 2024 16:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA7AC113CE;
	Thu, 11 Apr 2024 16:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712854520;
	bh=mD15s8QTfvS01rb0QJAhoIJhD4a3Q4/jwyVKrvxr9mo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kh5m6T6Rkn6NoY+t9k1pvf+zZzl/SR4R3I84prDvKhCzOQvZP78ZSk/rBRD9xWZL5
	 cLcSwYXjc9s5KtDsu8a1SfL2g7tDKCwHaNCK78j+K5m06PcDqL/lyKsaNYDw6oD8Qm
	 MJJZU4Mjj2FygAEY69DyTZHS4G7IRKmhbPPKWNDtY8+jgiy5lnRnnv3mknASUas3hv
	 u2XkM0q9DUyt7rHJ2LqWt79ysqyVunS2qkvkYb3DPi4El8Nzmw0T7CJ21vFazwnO1z
	 epiBQzT98wI3XK066w+JtyG5o6ySlzhNmNr7GE5K7EIBZRTFymxV5OxLrTZq+V6ZM8
	 XdNdqRGiDrrBw==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 1/2] wifi: ath11k: use RCU when accessing struct inet6_dev::ac_list
Date: Thu, 11 Apr 2024 19:55:15 +0300
Message-Id: <20240411165516.4070649-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240411165516.4070649-1-kvalo@kernel.org>
References: <20240411165516.4070649-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_095523_451424_0DA2FEC6 
X-CRM114-Status: GOOD (  10.22  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Commit c3718936ec47 ("ipv6: anycast: complete RCU handling of struct
ifacaddr6") converted struct inet6_dev::ac_list to use RCU but missed that
ath11k also accesses this list. Now sparse warns:

drivers/net/wireless/ath/ath11k/mac.c:9145:21: warning: incorrect type in assignment (different address spaces)
drivers/net/wireless/ath/ath11k/mac.c:9145:21:    expected struct ifacaddr6 *ifaca6
drivers/net/wireless/ath/ath11k/mac.c:9145:21:    got struct ifacaddr6 [noderef] __rcu *ac_list
drivers/net/wireless/ath/ath11k/mac.c:9145:53: warning: incorrect type in assignment (different address spaces)
drivers/net/wireless/ath/ath11k/mac.c:9145:53:    expected struct ifacaddr6 *ifaca6
drivers/net/wireless/ath/ath11k/mac.c:9145:53:    got struct ifacaddr6 [noderef] __rcu *aca_next

Fix it by using rtnl_dereference(). Also add a note that read_lock_bh() calls
rcu_read_lock() which I was not aware of.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37

Fixes: c3718936ec47 ("ipv6: anycast: complete RCU handling of struct ifacaddr6")
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c32be587000d..4fdd56cd30a1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9112,6 +9112,7 @@ static void ath11k_mac_op_ipv6_changed(struct ieee80211_hw *hw,
 	offload = &arvif->arp_ns_offload;
 	count = 0;
 
+	/* Note: read_lock_bh() calls rcu_read_lock() */
 	read_lock_bh(&idev->lock);
 
 	memset(offload->ipv6_addr, 0, sizeof(offload->ipv6_addr));
@@ -9142,7 +9143,8 @@ static void ath11k_mac_op_ipv6_changed(struct ieee80211_hw *hw,
 	}
 
 	/* get anycast address */
-	for (ifaca6 = idev->ac_list; ifaca6; ifaca6 = ifaca6->aca_next) {
+	for (ifaca6 = rcu_dereference(idev->ac_list); ifaca6;
+	     ifaca6 = rcu_dereference(ifaca6->aca_next)) {
 		if (count >= ATH11K_IPV6_MAX_COUNT)
 			goto generate;
 
-- 
2.39.2


