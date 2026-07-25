Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006FFC53200
	for <ath11k@archiver.kernel.org>; Sat, 25 Jul 2026 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6HhSphr40arB6iMxyFae2bf796pOpLnQzTJ7BzfcsQ=; b=AQpRn4bscmwnqCg7FlNEW3u4hZ
	z02VkYg9mtwZnPFSF9By5T/bbf5K85yXeTLoprZDlU88yFHTI+v4EyesiQiPLoxbZBFyJC0LCqSvf
	C/yRQ1vGYkV6Y5mi8g3t/ZWC0tO/Iz2UefoQOOVugVU8bRt7EfpD657vBc7WIaSLRL5EW9Y14MC2K
	9pRVZUD+lmqjaGZKqcXu3XGPIiPfVbYgfBJwtBTyca+PL7mMYj/e/RIPlrciF84JqgrcKVhwYgOdj
	2ezk81LeTDsxs4n1cIsto9PBHHaXtAUh/pxNBgMcobeDJS5f1kul0aKzJAT4ktpgT+1KQqOaELeie
	RimNF1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndD2-00000000Qqy-18oJ;
	Sat, 25 Jul 2026 14:18:36 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndCz-00000000Qpb-2Ko3
	for ath11k@lists.infradead.org;
	Sat, 25 Jul 2026 14:18:34 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-69ea0595598so1405795a12.0
        for <ath11k@lists.infradead.org>; Sat, 25 Jul 2026 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1784989112; x=1785593912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6HhSphr40arB6iMxyFae2bf796pOpLnQzTJ7BzfcsQ=;
        b=g44EM8Af1UUdogGh08blP37wIcAKnzjbgucGNbzEhld7RvLaBu5J6VLaXfIqdCeUsw
         fZZ+xzvJVDfWCyv0TpGZ+cwBUiX5O5HDtr1s3u2NQ4y86ERC0H2VvwqlyQDe4qJG88ed
         VATjUa7gn7hAPf35DN7rZOlZiWxQyrQLr7WLvOTFONuRfBLU2JavAJLEQndvdOAiXYzz
         czP9JAByPR6o6VMxJOWDPPtquJkslYl11Pw9fDOaoL2i2GiGcvaGmcpWzKSHcwSfNRH1
         5Hdb+es81L1VcN4mt3D2UGSQvYOuF745n4OSAAOr0T/NfanqUDbfJMFYiSb2x4eFuf9W
         H+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989112; x=1785593912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6HhSphr40arB6iMxyFae2bf796pOpLnQzTJ7BzfcsQ=;
        b=Y1L6ehPVNIc4otAUThVias94PKUoHhSD83EiXlOi/MqGzevLlsxOaPB17OZk3E5uMM
         Wt+GkXhAIafDTfXTuOnM/oZwchRfoV25wATeeGTLC9tHoMTDsSHbhB55MeR6w2Y5yqiH
         C+gdqnSWucMI695dA15fUqQeTfN+Hrnir+hhTgcL3s0R1OZ5GpR6/QWlQUR2DuMOgk4u
         pTc0isYFJ/tm2unYrVvW0IFyr2CS5zxIxtkibVTBwOLUJpgJ6hhExKYsIqmU67N8dK57
         Kc+Vf6Bsq1dKu8DFAwjTBt2VnJEVlA5AG5RUOgfT9rF47pTpRqhzt4zkQEWne/JeV3oV
         c3Fw==
X-Gm-Message-State: AOJu0YyORmWwOJ28t80x/xP2D9+Bm8J/jJDiPr0NKBAsPAQaLqcNrHO0
	LUF5pLbfpCO2/NE40P5p7TxlTHwhowt7gCm20RrgUjJfIT5ihfE0jWAqCH0YECu2zQ==
X-Gm-Gg: AR+sD130c/E/1SIK+5PcKEK5fqxrF/FaTFRkb4jKERHaKXzogDWQ/uW3AX3TIoh/8O/
	fadnwiKGOgrRnrfsffoRY6PR4I54KVU5MFpMlPm+zRsGelH5fjVhPKreWe7JFnjrlkXf0fcp/R0
	Hu04koQEEtxJfWFDAFrCoFFUjWeEvXZ03Ka7eVYabzkoa+RF8l0//bEDvUy4XM309NZ3rKzsAF1
	wkZ+TZ6YatBs+l8s1lRWT/ElusSw0xQrexD7kaRrlzezd3mVWs/OTAiT9U2PYKzRsnvHJU/j74G
	I5VNGtZ9KowV5pbmR0eM01SC/1h+V5x9+p2JpHnubgjV5IShheei6SOEeqwkziKyjuPsLqjXAo4
	cHGgiNS+yKWMAoN7mXOmiGY0pkZOdBgq7lisionCUgJHy40EwbSvHxA/9HFSY4qPvYxSrlQ+kog
	WqxCHgYk+VPNneDc6nwF84Mhd5ONYlJgvrIJimLFBsSYkcdpdNTeeGg0nqx+KZGGSeZgScojSH9
	gWOb28fGFx05b5Hz8KONm4AVGVuVZY0G/NdQuGIV1+k6iiRNe2Z4ks2mPVXxM/xHkoxsURyYHVF
	/Cc/KbMtVYiU8PYtOP4m1e/C0U4fq5KM07nkRchG/Wx1kcLYjmxGkj1HbSpsJRAOSzPcgQRQPtB
	ldV3o3FJdUDOWQ/RdLdLNiXq9SVY0LYo=
X-Received: by 2002:a05:6402:42cd:b0:699:f3b8:165c with SMTP id 4fb4d7f45d1cf-69fc116ad78mr869524a12.28.1784989111703;
        Sat, 25 Jul 2026 07:18:31 -0700 (PDT)
Received: from Desktop (p54aff063.dip0.t-ipconnect.de. [84.175.240.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm894010a12.26.2026.07.25.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:18:30 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath11k: disable interrupts during firmware crash recovery
Date: Sat, 25 Jul 2026 16:17:57 +0200
Message-ID: <20260725141757.1316877-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260725141757.1316877-1-julius@bairaktaris.de>
References: <20260725141757.1316877-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_071833_630835_EB0265FD 
X-CRM114-Status: GOOD (  12.45  )
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

On IPQ8074 a firmware assert reboots the SoC:

  Unable to handle kernel read from unreadable memory at virtual address 0
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  lr : ath11k_dp_rx_process_mon_status+0x15c/0xd84 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
   ath11k_dp_rx_process_mon_rings+0xa0/0x5d4 [ath11k]
   ath11k_dp_service_srng+0x1f4/0x348 [ath11k]
   ath11k_ahb_ext_grp_napi_poll+0x34/0xd4 [ath11k_ahb]
   __napi_poll+0x38/0x188
   net_rx_action+0x120/0x2c0

ath11k_core_reconfigure_on_crash() tears the data path down with
ath11k_dp_pdev_free(), ath11k_dp_free() and ath11k_hal_srng_clear(),
which memsets the ring list. The DP NAPI is still running while that
happens, so it services a ring whose address pointer has just been
cleared.

That function used to disable the interrupts first, until
commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
moved the disable into ath11k_core_reset(). reset_work is only queued
from mhi.c and from the debugfs hw-restart handler, so AHB parts never
run it on a real firmware crash. Their recovery goes QMI server exit ->
restart_work -> ath11k_core_reconfigure_on_crash() ->
ath11k_core_qmi_firmware_ready(), and nothing disables the interrupts
anywhere along it.

Disable them again on the crash path. The reset path has already done
so by the time it gets here, hence the ab->is_reset check.

This is also why the debugfs hw-restart trigger never showed the
problem: it goes through ath11k_core_reset(), the one path that still
had the disable.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
Fixes: d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8039124e7832..8c24fc8828d5 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2334,6 +2334,15 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	mutex_lock(&ab->core_lock);
 	ath11k_thermal_unregister(ab);
+
+	/* ath11k_core_reset() already disabled the interrupts on the reset
+	 * path; only the firmware crash path reaches here with them live.
+	 */
+	if (!ab->is_reset) {
+		ath11k_hif_irq_disable(ab);
+		ath11k_hif_ce_irq_disable(ab);
+	}
+
 	ath11k_dp_pdev_free(ab);
 	ath11k_cfr_deinit(ab);
 	ath11k_spectral_deinit(ab);
-- 
2.53.0


