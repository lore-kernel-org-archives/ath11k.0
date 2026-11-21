Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D260A2610
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U6EpUrf2;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=KbkN5aiO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RzF4XgzG+OFQFl38cVbBCWJ0+gCFYYh6ZK+opbkd1ps=; b=U6EpUrf2QRSJbQ
	jfj5KriixI8G4MnOKLgEtIvKhsPu/i2WeYYlBX8eXvLHblFi1Wwf64HGoqaPvcH96XFswn0zEMpjl
	6+tkK7PDanMDxqYiQVjLDu/6JzckYwKLp/o/05tBhbtZ5YbKILbtcjeNocZh/3RQxFYgYOmzx6+zs
	ee+v4Bz1CViQX9pRtnVFM/XUv5narpYCBBDZwV4rUu9oNYnGIDimsKhVGeF+4xWqgOgM16LuPra+H
	dSNc0pbVbGxbzJfGG9xFsAQ7MXnXOsnVGvivhaVaGPe/94bE1uloTk+cxb9aH8wlXg6gjIps332ud
	YHmIHeTTYZG4s4Qe+WUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBO-00000000S3x-09nN;
	Sat, 21 Nov 2026 23:07:46 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBK-00000000RzX-3YLQ
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:07:44 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c513a854320so364436366b.0
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302461; x=1795907261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzF4XgzG+OFQFl38cVbBCWJ0+gCFYYh6ZK+opbkd1ps=;
        b=KbkN5aiO2klFjr7rUcHqQQ+sVyjuM6X6UCFSWEGGFALVzR16wdio/ofr6LYEEiStrq
         oQV1nA6DWPp9G2wObIykBvwa6sAaYpAY14+M4uClj0ew1hgvM2wX38fxIinS9/2/PK45
         TN5jARuAIHDwZxtQleaI0QvSPp901DezXuky1xH8PhElCrxYXGANLR/BP9AWPew8fKbB
         teaCve2LNC/4ahaqr1YKh8bEe5XvgUwCVF3TTNDZ+mdKgFITv3+b0pRSOKxdhT8pz9NH
         kiX31OwUTkJEKOKWFr7rUGnZhPN1EeUSTgAG8Bgqnh/BX/uwcIrt9N10Qmz82DxrKd/f
         qmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302461; x=1795907261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzF4XgzG+OFQFl38cVbBCWJ0+gCFYYh6ZK+opbkd1ps=;
        b=VzBb8tEnNuRRMRTEiBOHaBWiN+J5hJP1pP6tdsRs/z+VwU+JQBz2tcspq0rp18NifZ
         CTeOBhKgATER4H9m87zNn68OJ8ji8FyWH9FoNodH9e2uPusO+7UnanjgrkJMuRlE90hK
         8kscCtOc3o4jUb0TUt+c+FyZynusmm1LqUiggmdvsnv7s2+HzTbzsEvUsFSPUh9XMEw7
         xdP1g6tEDdsNMGfG5fF/uSNnvZdXiRxhv+g4HQSBXJ4mY2wxjt2bNGgeI5EFvDqtIkVj
         VoqfJ80GVwqtHKik8VFiWNEHvXxN5zfr0Sp+Mq2VugWnnjxc1qQy1wdzjaYQYtWm3kxe
         HSmQ==
X-Gm-Message-State: APuU4Z9U9sJTabHk9J+Nj8fj3toEv6GCkqQUmFk6uZbj9Y+JXeLv0+1/
	RHuKBP65+rnZ1WZE9Om8HaRV7ezXFIPpr0Z3dOQIYCwdVfpKwMUZkfoU9row+D88LA==
X-Gm-Gg: AZFdTZf2RB7jQkTNwq5hcO3W8Jk3AotYc/LJFFfsCt/IMQdVkzJNR6JvYFyloXz5rUG
	iik7M+5/7Mkmyn9UsPInve18fwRqG0eC86dejIQLcYvZhVyYQy78ENXFXxstFe16AO9YcppXCHM
	wevH1aPIzizGC6t+zNctap/GswluXevqDGXAJOHsi3hIbAC5gLFOfaxN37W39Z83I4WiG8RceMn
	hhmiqwUtBtZOEOo4pfbxLhGGh2cAXV7hXF17a9FtqcCX4ysRM78soO+lppgTHmWgL6lXorOXsyz
	Di6KMrQ2NuoIBTyTwWXpt3aN/nEZI/JhrvbwA8CmUNDyUVtwklcoDbbSn0DY9zOet2/jv3uGL1l
	KBKiqSsC6NZhSxg7glOTe6mh5PXzFXwAZUEs7g3RP29BiMSZRnlpJFMoyOAwQlUrw2W32j1UuQb
	h5WaCRiWzmgLE7IHgW4JF4FeBX2lqc9U6ZcWLlGVkaWePB9AnwbCD0cjKlrXbJ186mKgaFxu17L
	NevvENUAiRPhDfWTAK/fB3R8qNA4hqlR0b9nLeznKhuz0nqcXJLfOE8ev2dzZkAsBq68ahyP2WP
	qQ+0ZhfDSjKhFe+s2stA1SeGV15bYvJv0JfzKXfKHMd74KZ0d0eYU0CFqJVxPDIYA7LHZtJusan
	UgWnWWmFwi9eOzlDtnVehabIbvuZTkWR8bFs3mRFWr8uPvCeoVRMEXe6IId3eTAL23F6yvf2xcs
	gD9K0uR4bfKav9Hy8Pjl85cj1Zdec06JqPYXLb4GQjQF2xzPs3VCRSJt8glohYX2droRqR6I7w9
	vU4mq0lcCoa2x5OYqCCQiMrYtaSL5HZiyrCFs4xnEpKvFRlLH51XmnhfFNYja19jV4FouBw4ecp
	lNR7WagezkCrrVTr/JOQ6jVD57X+BoGX/oc2LKiyrtnIvyQcijrY05lLEM+qsK/OBdt9/C2GQ5c
	=
X-Received: by 2002:a17:906:4750:b0:c3f:dce3:20d5 with SMTP id a640c23a62f3a-c513a88a462mr502393666b.22.1795302460965;
        Sat, 21 Nov 2026 15:07:40 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:39 -0800 (PST)
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
Subject: [PATCH ath-next v3 04/13] wifi: ath11k: clear CRASH_FLUSH only after recovery rebuilds the rings
Date: Sun, 22 Nov 2026 00:07:22 +0100
Message-ID: <20261121230731.1206043-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150743_025124_AF2F03D6 
X-CRM114-Status: GOOD (  11.08  )
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

ath11k_core_reconfigure_on_crash() clears ATH11K_FLAG_CRASH_FLUSH right
after ath11k_hal_srng_clear() zeroes the rings, but
ath11k_ce_init_pipes() and ath11k_dp_alloc() rebuild them only later. A
WMI command sent in between passes the CRASH_FLUSH check in
ath11k_ce_send() and dereferences the NULL tail pointer of the cleared
ring:

  Unable to handle kernel read from unreadable memory at virtual address 0
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  lr : ath11k_ce_send+0x114/0x350 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
   ath11k_htc_send+0x188/0x3c8 [ath11k]
   ath11k_wmi_cmd_send+0xc8/0x2f4 [ath11k]
   ath11k_wmi_send_peer_create_cmd+0x78/0xe0 [ath11k]
   ath11k_peer_create+0x138/0x500 [ath11k]

Clear the flag once the rings are rebuilt, before ath11k_core_start()
sends the first HTC message.

If ath11k_core_start() or ath11k_core_pdev_create() then fails, the error
path frees the data path rings with the flag clear. The stations stay in
ab->peers, so removing one later, or removing the driver, makes
ath11k_dp_tx_send_reo_cmd() write a REO command into the freed REO
command ring. Set the flag again before ath11k_dp_free().

On targets that do not restart the firmware after the cold boot
calibration, the QMI FW_READY handler clears the flag as well, also
during a recovery. FW_READY follows the firmware start, so it arrives
while the restart work is still rebuilding the rings. Clear the flag
there only on the first boot, before that handler starts the firmware
itself.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: set CRASH_FLUSH again before ath11k_dp_free() in the error path; clear it
in the FW_READY handler only on the first boot.

 drivers/net/wireless/ath/ath11k/core.c | 5 +++--
 drivers/net/wireless/ath/ath11k/qmi.c  | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index d6346e0ee047..7456a8422654 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2298,6 +2298,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 		goto err_firmware_stop;
 	}
 
+	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_RAW)
 		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
 
@@ -2323,6 +2325,7 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		ath11k_mac_destroy(ab);
 err_dp_free:
+	set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 	ath11k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
 err_firmware_stop:
@@ -2354,8 +2357,6 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
 
-	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
-
 	ret = ath11k_core_qmi_firmware_ready(ab);
 	if (ret)
 		return ret;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b957..a176e6498ec9 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3291,10 +3291,10 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			if (ab->hw_params.cbcal_restart_fw)
 				break;
 
-			clear_bit(ATH11K_FLAG_CRASH_FLUSH,
-				  &ab->dev_flags);
 			clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 			if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
+				clear_bit(ATH11K_FLAG_CRASH_FLUSH,
+					  &ab->dev_flags);
 				ret = ath11k_core_qmi_firmware_ready(ab);
 				if (ret) {
 					set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
-- 
2.53.0


