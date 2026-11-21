Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2EA606A699
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GTXpksZ0;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=j3J6lmFd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zcSc726+ApkS3y0S6C44eyfA/ilxfVvvD1+ezXLb36Q=; b=GTXpksZ0F934s1
	O1fOTBtKNFtC+bIs+pwVy5+Q+gNUqmCfFWk7x+xe2+J7h16/1uZOWhVs47fMfd9DoLzqJVVRawB+y
	PaN5IZY3ZmeLIXmL/WmhowjeJmlVe4EjEY/KRk8ABjNCCjJ/b3N9f0+C/0bDpUDLGT0LP9kAmkohE
	hMLDSPzC4x8IUF0KoqR46BC5FeLb2Z66el9vdOg3roN5vCyyJdXgbBENnjnVCOCrckq2eNcmAhelT
	/m3+0xan99x1FoI77lvYaqYR18mtAlKmLkaEq+7PlHRwMwqSWYewyZixor92EVb3+DGRNzL6WGCzm
	iIbiKwWDqtsthDuX/d2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBM-00000000S2N-3zST;
	Sat, 21 Nov 2026 23:07:44 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBJ-00000000RyT-16js
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:07:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c511c0e2826so254611766b.0
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302459; x=1795907259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcSc726+ApkS3y0S6C44eyfA/ilxfVvvD1+ezXLb36Q=;
        b=j3J6lmFd5qH+INt+0b3IisWVDtoKFM5frr1V0phnMgYxYBIU7C3JHp8iF8m5p3RoOh
         60b1M2LhqLptjvW6Te+YjECQBOgstnXsQNVsamLmhNGeIcgtx4SCnYvKsiIHDKoMvl2T
         z1EbnbVPOL3aZYYEat04/UNdh6wKFTEXTShn6sDMTkwZnnGsEmgIoDy0U4k2B1meFNGX
         r36ZuGnrNhyxQXuxBkaGF5MruUVX6RukljfNLVPAuLd1QoamT/Gj2fmRf0Zihf+jZH8K
         WX0U1yXyAeuWl+KGO1BeQzDzlEzdzhLPMylUkv0F+qnC+GPGWpI2Po3A2vJ+3GY7xrJQ
         CxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302459; x=1795907259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcSc726+ApkS3y0S6C44eyfA/ilxfVvvD1+ezXLb36Q=;
        b=iAek2U4cg/Pup/UmcAg6Xpb43TS5yV9KFXCMM0Q2RExI0j15XeODzuwJrQjwhYMEz3
         3rpLWC0LODzazEK4uf6fhA6tIzB1D0UyTn6yfuiCZqbqBJKg2+gQJXFEA04OqUSqNMsC
         ph+Vk3ahdR73lXlRdvOcYyXc17gTvVVAKloMQtDZc9eGv8PC/y69SpdXu9pa3jco2cKe
         Oa9gZ7/mHVAuv0EhEiSc0Iq/nSEqBP044TMi/Yq0Cq/3SA5LbVtPQHjUejtzHhqerLNT
         XONv+EPSqElNaypKQhI66D6dFoPtoTskRN6Gh17rgLZ+MZ6IWLCpIVxmZRla8kBCJKtS
         /4AQ==
X-Gm-Message-State: APuU4Z9ygkGt9t44HTX37kZCuQZLI0Z3AEbRHPwqz/KcHks5P2zc+scJ
	Y4SniOY54EN9kmMuKQbyxdw5YuzkiUqp16ES62XsdL1elpOURh5CTOkT0xLG8zb3Iw==
X-Gm-Gg: AZFdTZd40xqgjubz4Z1rIboRoTXeYZ0drCle88wMBoZNKQeYSR1Bp8NNBOBqfJbLqj/
	CWNkS5RybeKxD/w4aTigPELt63MvZeFg2X4P8MjHIAKhQ7lFSzOu78m3PNcV06/DzE/lUeDRl7q
	cXPBFo+g7U4JLiASRXVSD+BNKsBQARfltL7gNITzOGhQ68ELUbvEW7t1MdgRtKy2WjY2EGzASNC
	wJSDQGhB0JOc4fNN+ud8nOyFaEkYobDWbipzUy4WjEb+UDMyFBJrmQ82KlpcuTtr2R4n+nHjQTS
	Q8UEhH3pwQ5+QEqp0xmkA8FqzuHeFEl7tSV97Rzq6p2hb4CfYIUw2JqiIEXSEdn7qOomPWEaPJ9
	ROW0K4dWwYFhwuKvjSktjv2AmqSR/KU09LmSOwFa5o4J2qxdxsZIgIKdc1Vp6S9CqIi5n5l+DjN
	cRF9hdNExR9fH+UQwexfwRgTV8+y6E0bapBWzHdXC/ArQsoDkWiIsNO543wcC5us+YtAhc5cXx+
	/wyHhlgj5AIiW5JpOh/bBSdM15kSSp7YCvW3M5kel3ug7yhziOZU7t4yJM8AQx+Aw6XnLW5J43s
	raWB14YtjeVugD+NhTzcj/Nhi4p39M+uwVLB70GDMG3nXy740Ic56YIn3MNLcNuCK+E+CHrcHqm
	Bjhyk3MUX6fLUpOPNEu1znVKnrop3s2Ju8X7/IrLKYLBwPDnf359UZlNVpeMlaklj/kmQvnoXUq
	LIptcVSfxF6QJXwAo2B7xwCZupLEWLiv78+MGzM0iA1BqHLIBjTCc7uYTM5aRcHp5E5N3F3adKK
	6WgBcAjbo0Xmg5U8BcES8jQaOURpEXU04fE3vvL1VdpAHsVP1POK3tKoiU9LGlcsGIkkSYtM6Pw
	/xlzyG9BvRBt8Vno/+zwIcVvyBg1r3W4z5Ga117FcChoEuT/az0ZB1wG6oyMR1qqkOp1dwmasj8
	=
X-Received: by 2002:a17:906:b009:b0:c29:4fcb:2886 with SMTP id a640c23a62f3a-c513ab47ff7mr440549966b.39.1795302459360;
        Sat, 21 Nov 2026 15:07:39 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:37 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 03/13] wifi: ath11k: keep the srng allocations when a firmware recovery fails
Date: Sun, 22 Nov 2026 00:07:21 +0100
Message-ID: <20261121230731.1206043-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150741_367131_67DC6F95 
X-CRM114-Status: GOOD (  17.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 32be3ca4cf78 ("wifi: ath11k: HAL SRNG: don't deinitialize
and re-initialize again") recovery zeroes the hal state instead of
freeing and reallocating it, but a failed recovery still calls
ath11k_hal_srng_deinit(). This frees the ring pointer buffers and the
ring configuration, which only probe allocates, while the rings still
point into them. Driver removal then walks the copy engine rings through
the freed buffers:

  ath11k c000000.wifi: failed to reconfigure driver on crash recovery
  ...
  Unable to handle kernel paging request at virtual address
  ffffffc080ee5090
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
   ath11k_ce_cleanup_pipes+0x16c/0x4cc [ath11k]
   ath11k_ahb_stop+0x2c/0x3c [ath11k_ahb]
   ath11k_core_deinit+0xec/0x168 [ath11k]
   ath11k_ahb_remove+0x30/0x90 [ath11k_ahb]

Return the error and keep the allocations for ath11k_ahb_remove() and
ath11k_pci_remove() to free.

A recovery that fails before ath11k_ce_init_pipes() rebuilds the rings
leaves them as ath11k_hal_srng_clear() zeroed them, lock included, and
the same walk then reads the NULL tail pointer in
ath11k_ce_completed_send_next(), at removal or in the next recovery.
Nothing in dev_flags tells such a recovery from one that failed after
the rings were rebuilt. Set ATH11K_FLAG_CE_RINGS_SETUP once
ath11k_ce_init_pipes() has set the rings up, clear it where
ath11k_hal_srng_clear() zeroes them, and let ath11k_ce_cleanup_pipes(),
which every copy engine teardown goes through, return while it is clear.

The rx_replenish_retry timer posts buffers to the copy engine rings and
ath11k_core_reconfigure_on_crash() does not stop it, so it can fire on
the zeroed rings too. Stop it before the copy engine cleanup, as
ath11k_ahb_stop() does. Also test ATH11K_FLAG_CRASH_FLUSH in
ath11k_ce_send() before it reaps a ring rather than after.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 32be3ca4cf78 ("wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: record whether the CE rings are set up in ATH11K_FLAG_CE_RINGS_SETUP and
let ath11k_ce_cleanup_pipes() return while it is clear, instead of testing HAL
srng fields in the CE layer (Baochen Qiang, v1); stop rx_replenish_retry before
the CE cleanup; test CRASH_FLUSH in ath11k_ce_send() before reaping.

 drivers/net/wireless/ath/ath11k/ce.c   |  9 ++++++---
 drivers/net/wireless/ath/ath11k/core.c | 10 +++++-----
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 1e08b0970b14..af08a2a24c6d 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -718,6 +718,9 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 	u8 byte_swap_data = 0;
 	int num_used;
 
+	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
+		return -ESHUTDOWN;
+
 	/* Check if some entries could be regained by handling tx completion if
 	 * the CE has interrupts disabled and the used entries is more than the
 	 * defined usage threshold.
@@ -740,9 +743,6 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 			ath11k_ce_poll_send_completed(ab, pipe->pipe_num);
 	}
 
-	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
-		return -ESHUTDOWN;
-
 	spin_lock_bh(&ab->ce.ce_lock);
 
 	write_index = pipe->src_ring->write_index;
@@ -866,6 +866,9 @@ void ath11k_ce_cleanup_pipes(struct ath11k_base *ab)
 	struct ath11k_ce_pipe *pipe;
 	int pipe_num;
 
+	if (!test_bit(ATH11K_FLAG_CE_RINGS_SETUP, &ab->dev_flags))
+		return;
+
 	ath11k_ce_stop_shadow_timers(ab);
 
 	for (pipe_num = 0; pipe_num < ab->hw_params.ce_count; pipe_num++) {
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 5f4e7fbe0b25..d6346e0ee047 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2290,6 +2290,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 		goto err_firmware_stop;
 	}
 
+	set_bit(ATH11K_FLAG_CE_RINGS_SETUP, &ab->dev_flags);
+
 	ret = ath11k_dp_alloc(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to init DP: %d\n", ret);
@@ -2340,12 +2342,14 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	ath11k_dp_pdev_free(ab);
 	ath11k_cfr_deinit(ab);
 	ath11k_spectral_deinit(ab);
+	timer_delete_sync(&ab->rx_replenish_retry);
 	ath11k_ce_cleanup_pipes(ab);
 	ath11k_wmi_detach(ab);
 	ath11k_dp_pdev_reo_cleanup(ab);
 	mutex_unlock(&ab->core_lock);
 
 	ath11k_dp_free(ab);
+	clear_bit(ATH11K_FLAG_CE_RINGS_SETUP, &ab->dev_flags);
 	ath11k_hal_srng_clear(ab);
 
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
@@ -2354,15 +2358,11 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	ret = ath11k_core_qmi_firmware_ready(ab);
 	if (ret)
-		goto err_hal_srng_deinit;
+		return ret;
 
 	clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 
 	return 0;
-
-err_hal_srng_deinit:
-	ath11k_hal_srng_deinit(ab);
-	return ret;
 }
 
 void ath11k_core_halt(struct ath11k *ar)
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..593e54c59737 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -288,6 +288,7 @@ enum ath11k_dev_flags {
 	ATH11K_FLAG_DEVICE_INIT_DONE,
 	ATH11K_FLAG_MULTI_MSI_VECTORS,
 	ATH11K_FLAG_FTM_SEGMENTED,
+	ATH11K_FLAG_CE_RINGS_SETUP,
 };
 
 enum ath11k_monitor_flags {
-- 
2.53.0


