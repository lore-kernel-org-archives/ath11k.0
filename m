Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68FDCCF2D3
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 21:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPr4qdqLVcWX6XCuQJCH3UmIwyLoC3WQx0IATf5uj9k=; b=hY6w8+eo8U9u+WpJ9OZlvW8BGl
	HDQuk7bXKrHu42vU/hDf7abbCNIA93QFET14nsKQ1pvd9VG+2T2Bxbfra2ngmnpnliOdsHOrt56C4
	E9MtJmQKCybc31YCEJrdgu0mUSgrGYKRFuPkCAxIU7uPV4PiiKUbvCty7bkZpjCHTExDgIeEXv60L
	laPmGymlkAtmvoUve+Ic7Eq5non3/BAJs4PEX/bGy3P/j5S2b9NAqzf8/i+NX2FcugurJCQNUPuZj
	+CFP/5AH6llcfnDKw39L99aobGxhBoex1RvV6yFHjRydXFcONE804hao6UY6SwTp9EksrP7RBGGyY
	iIRGQIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY18-00000006EDs-1hiM;
	Sun, 18 Oct 2026 21:02:06 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY14-00000006EBo-2H9Q
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 21:02:03 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso198811466b.2
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 14:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357321; x=1792962121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPr4qdqLVcWX6XCuQJCH3UmIwyLoC3WQx0IATf5uj9k=;
        b=vIknN1boIhLSeY/j+81YYS3lqW+aDp54P4SlU5yd9wdsW5VTBMOikZvaJrJ+gmogtJ
         rMX6jDAWhxxz6TaJCMVnP5EwUZIVmHEgH5bSRbC16tJW6e/+zemCtwDSMr+QuAZNUgR8
         M/ceHaZPLTSARMdUQGxXa3QNhYKERJAFp/fkAaTRlUMj+9szlw38iUqzm78hVuCOXM7n
         tkxbOYqcjA2c+d+RfeQOtx6EwQ36vOyQZWFYA+IouAKZOT5I1M0atBzjLJaRCMPIurIE
         U6Eec7N/yPNxGQtX0lB6iMXuzGRq5cBdD71wfiZ3dNbP44u6SBZNs7PMqTkx/GCGogi/
         ZnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357321; x=1792962121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPr4qdqLVcWX6XCuQJCH3UmIwyLoC3WQx0IATf5uj9k=;
        b=vsYR7Chn/8KRKixWg990eHGyGWuufxNZ4Jn3ynnzEhTwcHNp6ESg9vUxHR6i/janNq
         AvutgWyY7qZ5QgPLCaaA4653OgpRjvFvp1HRz5VRgl19cx8eNyjCNqooUz0Txs3WZIkJ
         8Myz4jckYO3E6O6iET6IQbR65Y8JV26Wor4uvD80D8AKA1zulDY6jIbFWj/QEsWCFRm8
         tYTa4yg6BmHPD3vf7cNM+2DB5/y6AmLl3RcF4NAU3vyDVW9QN+TscHyeN9OBaXbOd6P2
         yoAV1KJyUWSLmmD4ywwS+LBU9B6LkeXoACefpZo1BTALy8djdrVtHCjSaD7dpAHKRH2s
         00Uw==
X-Gm-Message-State: AFq9FYJU2Lep9o6++KXI3Dt6xsnuI/a+pfpEtPBH57aoxxjcKJlGpt/z
	Mm9ZPSwuA0MYuxPIYE4PBZQKZSfysKGZLq/Wf/ihxazUGmMvSEsq93dV6UNztDIEvg==
X-Gm-Gg: AYBFou1u1Uj+3MC+dtVWMlGkmhexw7O7tMo6kKHouhwEQ8mGWIm5CVH/7py+BxaEETH
	VcDnslYjzaWkoOHyTk1WmcYGlEX6RpYbfJE1T2nFtuLF1J+nwjGivBiS1EEg/2RFvMIw2opstC6
	DDqpn/BEmp5KaFUvWywa5SjL422XFmCA8BB1tXPfHk004yoXzpnKIbPJyWPxtt+oiGcTgEKGcif
	kzGFmMa0EF9ctxDJaSy+Bp5NDdVL0RjUIw0zop4UWgt4xM4HDT3a0NxOmgD4WSnqnfGsNgIhXqk
	hsAR2qjWdeyh7Z4ktWykV93aAuibTUdkPCP/OhKQdgTirNkY8aZ8AHwr8gAhG0yxVV4V27JLvPO
	pRRUg+qvbt8/DCj/EMyXzUiUp3rZiPfTkX8x6h15vUryqDir5MWqeNkW5sgRzwzyAWMNQcLeeNM
	aBveN64dd4182dFz04Belna5inFg0rlLp18UnLFCCHEAGN8ZISNVMPsM7N/6nAyqzL/CvACPPW2
	qy4zP9/r/bL4SkaNSdZM+hu03NZ1v+/qcfUr5tVz/pDTm7dfqOZHQq3VoQu/xOU60NffgdCAoi2
	pc78q5X7TSdh7XkyZzc4D3u5Y+lOIisJTfC5O0LXnAngZoZlwIhGRJDzdQURERqF5ouYzq1cEcg
	UxML87IvnhZa1KTaa2Kqj0xEtmtmW0iyJnaefJCBBQiOH+WCN0dQoQYhWSgtiDU2CwI/1bYGFKB
	Hsu35sxwO1
X-Received: by 2002:a17:907:1889:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c41a03f8030mr392380566b.39.1792357320700;
        Sun, 18 Oct 2026 14:02:00 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:01:59 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/5] wifi: ath11k: keep the radios when a firmware recovery fails
Date: Sun, 18 Oct 2026 23:01:50 +0200
Message-ID: <20261018210153.1925962-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210153.1925962-1-julius@bairaktaris.de>
References: <20261018210153.1925962-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_140202_617333_A1B8A43B 
X-CRM114-Status: UNSURE (   9.83  )
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

On a firmware crash recovery ath11k_mac_allocate() keeps the registered
radios, but the error paths of ath11k_core_start() and
ath11k_core_qmi_firmware_ready() still call ath11k_mac_destroy(). A
failed recovery thus frees an ieee80211_hw that mac80211 still uses and
leaves ab->pdevs[i].ar NULL. A frame bridged to the radio then follows
the freed hw:

  Unable to handle kernel paging request at virtual address
  ffffff8316cfd480
  pc : sta_info_hash_lookup+0x4c/0xe4 [mac80211]
  Call trace:
   sta_info_hash_lookup+0x4c/0xe4 [mac80211] (P)
   sta_info_get_bss+0x1c/0x78 [mac80211]
   ieee80211_lookup_ra_sta+0x124/0x14c [mac80211]
   __ieee80211_subif_start_xmit+0xb8/0x3a0 [mac80211]
   ieee80211_subif_start_xmit+0x50/0x750 [mac80211]
   dev_hard_start_xmit+0x98/0x120

and driver removal dereferences the NULL ar:

  Unable to handle kernel access to user memory outside uaccess routines
  at virtual address 0000000000000000
  pc : ath11k_dp_rx_pdev_free+0x34/0x12c [ath11k]
  Call trace:
   ath11k_dp_rx_pdev_free+0x34/0x12c [ath11k] (P)
   ath11k_dp_pdev_free+0x4c/0x84 [ath11k]
   ath11k_core_deinit+0xdc/0x168 [ath11k]
   ath11k_ahb_remove+0x30/0x90 [ath11k_ahb]

Destroy the radios only when ATH11K_FLAG_REGISTERED is clear, as
ath11k_mac_allocate() does.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: 0366f42640a4 ("ath11k: Move mac80211 hw allocation before wmi_init command")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8e4dab61a3009..dd256853bab57 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2231,7 +2231,8 @@ static int ath11k_core_start(struct ath11k_base *ab)
 err_reo_cleanup:
 	ath11k_dp_pdev_reo_cleanup(ab);
 err_mac_destroy:
-	ath11k_mac_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_destroy(ab);
 err_hif_stop:
 	ath11k_hif_stop(ab);
 err_wmi_detach:
@@ -2315,7 +2316,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 
 err_core_stop:
 	ath11k_core_stop(ab);
-	ath11k_mac_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_destroy(ab);
 err_dp_free:
 	ath11k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
-- 
2.53.0


