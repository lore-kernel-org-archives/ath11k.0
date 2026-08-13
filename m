Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADE4C5CFCF
	for <ath11k@archiver.kernel.org>; Thu, 13 Aug 2026 12:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c64E2R36qwjkaxktM22vflgbxK7VH2cQNkcuM8Kj1/Y=; b=KsVgpxPIELxC9BmJoofXSVbifw
	AG3ibFMrnPdRD29M4OO+BSg+ytS4y7eH/Gqp8jT3nmRlP94cmL8L0+JdmKzvPtsHJy18DBfHXLWYo
	aUjXU61vw8VKnvo/hhE3beltqWevOFv2nvLMMxvhE7IG42zmV2ukmaMHQxgvXSHN6vityQOwej1Ff
	pGRpCzy6bxgYIVuOVyZBtHvehRrytN+Wvb9Ewyl9VZB02jO8d173YSUEfWD7pNndIpa9fNzq5z6vT
	Lu+ROpGOk8tsD7nfMSFJWw7LtSdpZNoaHo22PweVuoSxVZSBKTUr1VRo+5MX+AvcL7liDX0tbTere
	SQSqDtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUM7-00000000dfv-0T20;
	Thu, 13 Aug 2026 12:16:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUM4-00000000dfW-1TWB
	for ath11k@lists.infradead.org;
	Thu, 13 Aug 2026 12:16:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1968436f8f.1
        for <ath11k@lists.infradead.org>; Thu, 13 Aug 2026 05:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786623374; x=1787228174; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c64E2R36qwjkaxktM22vflgbxK7VH2cQNkcuM8Kj1/Y=;
        b=EMeqUoZM4sWCZ1Ujp4g0jPi9h43TK4dK+w15f5nXaExW03DYyY56Dlr1i2tjk+ZwDI
         suay1L4ooVhTWd3Obx84blzsW5TI/04ECknxN7Q32qd+U6wasNwO046taTtUBRbukhVN
         xCilo23ZUO/St93TaGzrRsZpbSGzJJiLPrHsKFbxWGbBxzVKJJ6KiiKTCMDFJgv/zMLv
         4JrGOJP6ik623h6juXiVOb+osbzIHWuaE5fd9gEEka4RN4NSIGwy0HWtVyVeDDAPazYd
         HHkxk1YBPWageVIp1S9WE37V0YiTzZ5rWa3PxlrnRtV12hRANvoI0xsJF9DNGwLdChPs
         Ge0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786623374; x=1787228174;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c64E2R36qwjkaxktM22vflgbxK7VH2cQNkcuM8Kj1/Y=;
        b=W4wRQJD/l0R+MkYMz//NJF3kR135xGGhyuOYukP8EtFav1gvp13v88w7NS7n+3Vt4V
         kEu0qvevh96y3r+QTfXjKj+Fu/e9Pj9PzofiSxvQCamusZ5THvdmOPXd7tpQWUY0tMZt
         hf47XDe7TVSxAUV8gSHSUaIU3C/Z81objbZcLn3rAWiIsLbetjw0enpLK1TV7p86P07D
         5u+zby3l+0fUBcVyTPWrUKciy3awNUd23A20DJqhObUZfkrdovHUPFC1PRvjCLtN4VuV
         SWzMV25dENBHiMqGg13mVYC3NVt0FYlEEXX76NStBFtKsYzGxT/AroUTLTZcJ810Pz1X
         N8Dw==
X-Gm-Message-State: AOJu0YyTWSDP6DMTqhE4JOd/vLSnceJGFt4Fdc/pTHsruHnNm7HqTk93
	mlcV1tyxT8eEe6BHqgOLUmtDydaSdFt4BG1/kvIVyeqWqEJyni85XejTx46feA==
X-Gm-Gg: AR+sD130ndiFMFqUA+K0Ydin6Vke1ku7eisMGJaNmDUdR4/5qF8qGEhNoxfBu3SVi58
	CAYFqjKBJSNLHprhfsshSBoyAcLf/HzcilzcyrbTZ70oS7g2Jtug0UIByFH75RghiUd3XEyiW91
	1gn1HCyZye+bWW4Rcrs/gBelGRakabGOwsb5ZESePtPTm68ceHgyfaJ01/4QS8iaoP0ZZwS95RT
	8wIByg0KGnksTD4gGrbtpUnrB635SdlJn4x9zAQs/b7HdzkWLZ2NmEzkdqP87dcnw+AZnrkpRKm
	HypTzc6WspQJyS7QdswBkFH4QApm+ULsbHonnmX0c/40sChdCH1fe+8ME1Hz2Su7nRagbogVCzv
	BnqjNdBNAPfPTwew+r+mI4RN5SoLISeo1RYVmAGovtKST0VdVIE4G9ZXI9xkwV/RosjrK5rXx0R
	4UN3POXQpe7E3isDpjfMCT11baIMLtPUZn/uvsVNWlZBZDSbSiHLazzkviZoCP5E/w7AX6vN6z/
	9TO9qvgkrpWjiH4C39J
X-Received: by 2002:a5d:5e82:0:b0:47f:7129:e30 with SMTP id ffacd0b85a97d-48159cbb72cmr8313513f8f.11.1786623374277;
        Thu, 13 Aug 2026 05:16:14 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5c2352sm5122353f8f.34.2026.08.13.05.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 05:16:13 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
Date: Thu, 13 Aug 2026 14:15:28 +0200
Subject: [PATCH ath-current v2] wifi: ath11k: fix locking problem in
 ath11k_dp_rx_tid_del_func()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-ath11k-locking-v2-1-f4113a0bd0f4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WPzQ6CMBCEX8X0bAkt/558D8OhLgusQGvaQjSEd
 7fgwbOnyWRmv8muzKEldOxyWpnFhRwZHYw8nxj0SnfIqQmeyVjmcSkkV74XYuCjgYF0xzPZZpg
 A5FVSsHD0tNjS6wDeWOhymK1F7Vn9Dd18fyD4HbnXW2sm7nuL6rdSyCousyIVUZIGFYILrglMh
 A6UbvDaTYrGCMy0E3py3tj38cAijtl/KfW2bR/plsJ5CQEAAA==
X-Change-ID: 20260812-ath11k-locking-52f5e3cc6937
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_051616_452666_5AE448F9 
X-CRM114-Status: GOOD (  16.14  )
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

In this function, we iterate over dp->reo_cmd_cache_flush_list using
list_for_each_entry_safe(), under dp->reo_cmd_lock for concurrent access,
and for each expired entries we :
  - drop the lock
  - call ath11k_dp_reo_cache_flush()
  - kfree() the entry
  - retake the lock to keep on iterating

list_for_each_entry_safe() protects us from deleting the entry during
iteration but doesn't protect for concurrent access. So another thread can
take the lock and modify the list in between and crash like below.

To fix the issue, move all entries that needs to be freed to a local list
while under the lock and then iterate over the list to free the entries
without holding the lock.

	BUG: Unable to handle kernel paging request at virtual address 00000010ddbeef8c
	Call trace:
	ath11k_dp_rx_tid_del_func+0x164/0x3c8
	ath11k_dp_process_reo_status+0x1d4/0x2fc
	ath11k_dp_service_srng+0x334/0x338
	ath11k_pcic_ext_grp_napi_poll+0x30/0xc0
	__napi_poll+0x34/0x184
	napi_threaded_poll+0xb4/0x1d8
	kthread+0xdc/0xe0
	ret_from_fork+0x10/0x20

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
Changes in v2:
- Dropped original patch from Maxime
- Switched to a new design suggested by Baochen
  We iterate the list and move the aged entries to a local list under lock
  Then commit the entries to the hardware & free all aged entries from the
  local list without holding no lock
- Added harware revision to Tested-on
- Link to v1: https://patch.msgid.link/20260729085741.3485711-1-nico.escande@gmail.com
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 33425707c084..5b717b731197 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -762,6 +762,9 @@ static void ath11k_dp_rx_tid_del_func(struct ath11k_dp *dp, void *ctx,
 	struct ath11k_base *ab = dp->ab;
 	struct dp_rx_tid *rx_tid = ctx;
 	struct dp_reo_cache_flush_elem *elem, *tmp;
+	struct list_head flush_list;
+
+	INIT_LIST_HEAD(&flush_list);
 
 	if (status == HAL_REO_CMD_DRAIN) {
 		goto free_desc;
@@ -783,23 +786,25 @@ static void ath11k_dp_rx_tid_del_func(struct ath11k_dp *dp, void *ctx,
 	list_add_tail(&elem->list, &dp->reo_cmd_cache_flush_list);
 	dp->reo_cmd_cache_flush_count++;
 
-	/* Flush and invalidate aged REO desc from HW cache */
+	/* identify aged REO desc that needs removal */
 	list_for_each_entry_safe(elem, tmp, &dp->reo_cmd_cache_flush_list,
 				 list) {
 		if (dp->reo_cmd_cache_flush_count > DP_REO_DESC_FREE_THRESHOLD ||
 		    time_after(jiffies, elem->ts +
 			       msecs_to_jiffies(DP_REO_DESC_FREE_TIMEOUT_MS))) {
-			list_del(&elem->list);
+			list_move_tail(&elem->list, &flush_list);
 			dp->reo_cmd_cache_flush_count--;
-			spin_unlock_bh(&dp->reo_cmd_lock);
-
-			ath11k_dp_reo_cache_flush(ab, &elem->data);
-			kfree(elem);
-			spin_lock_bh(&dp->reo_cmd_lock);
 		}
 	}
 	spin_unlock_bh(&dp->reo_cmd_lock);
 
+	/* remove aged REO desc from HW */
+	list_for_each_entry_safe(elem, tmp, &flush_list, list) {
+		ath11k_dp_reo_cache_flush(ab, &elem->data);
+		list_del(&elem->list);
+		kfree(elem);
+	}
+
 	return;
 free_desc:
 	dma_free_noncoherent(ab->dev, rx_tid->unaligned_size,

---
base-commit: e07447e654476262558bee570f4cf456e2b32565
change-id: 20260812-ath11k-locking-52f5e3cc6937

Best regards,
--  
Nicolas Escande <nico.escande@gmail.com>


