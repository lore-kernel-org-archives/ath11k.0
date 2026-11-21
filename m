Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E402606A68F
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oqAPYE7C;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Fykqq6EZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OPsfghuAOvZXGmgP8YNMyy86FtkIG7/XEGKOG2j+8RA=; b=oqAPYE7CS7C5+7
	QYJy/zRVrvSCDYg72hSvhUn11Q86G1UOkQyIgcFnjfA1Tg19y99Svubrf9phANGGLySp7g4qKxihK
	G1agGJm/S3/chNP/GXiMf8+fk2QEyO7DzPD5sV8hXHNBDKAtaXPTLZJTQZAoHMzS/H3KrxIRN2dTe
	723qY7QolLr0ErN7i7e5vg8SuUPnF0k+eVJl72IrJH2Jp0p6nM4cJm1Af0b1qn7zkC4gWJIgoh2fA
	AOofdUDU//plrFEh76krhKz25e4w/3U9RLfP313QBhAXZhcP0YrYWNpiuW6tGLWLVxNOs05j5OPVj
	cCA5WpAWBTErUqUXrYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBL-00000000S0e-0i0D;
	Sat, 21 Nov 2026 23:07:43 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBH-00000000Rxx-0UkO
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:07:40 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c515369b627so159845766b.1
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302457; x=1795907257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPsfghuAOvZXGmgP8YNMyy86FtkIG7/XEGKOG2j+8RA=;
        b=Fykqq6EZPGlyloBiGUMgY2WLQXnYjz0G562x4OrNTKcwiZvap99th2aMKQ6qzZ6xfH
         D3a4jzpNvZWTqjJikyZxfKnk8z9RW6+gg1e7Bci0QVHqg/oO1grkWZcZxv+amTT3hCmF
         1W4as47iQOf60CdpFq4roOHtzxCZ09KHMNdLZ9GyWcQTEWZtryrpeXuGRtd083+nN4ew
         z5uz+YaBSXkiSzdOUMzN4F90TC7KDSv0MxnJ3GeHiyjrg2RRSObAD5znkbveZHJTnXG9
         P7NUo87gp1zZz70HOKYz2cYGNLmj+th6TiMPajTLWhL4WyR1UbWF7cwzNpEJmNnz62ee
         JfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302457; x=1795907257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPsfghuAOvZXGmgP8YNMyy86FtkIG7/XEGKOG2j+8RA=;
        b=ZIZgtjnUwu6a62U/k/sQ6TnwesQA43wyJ1Eo7Llz1w2qY5MFnT8B+g8qfyYUdLp3Kv
         2JOZiMB5Fa2LLbA1oJj5rS2GlopfbktR5RydxlqJbgbnkMbJbnDQnefMnQtZb1RxMJXy
         Tfm9R+RWDWgrWluYiem+zw0XZrpCXRCAgLkYheuwlsEJXccR9sXAi9vw/5sRt4LXCBXL
         TO/qOsT43VJchJ1Cs+EFOvg/KcqsGj421I3E9J+lrt6qIGnhN6Dm0ak4rFDqcF4CGOnO
         SBRkyM83QuqVV2E025wgWcCgoeMkvKt157lbww0ZgBtdIiadc3qmwnW3XQDkV2TwoWjk
         0QUQ==
X-Gm-Message-State: APuU4Z/ButG/w42F8AYLKn/MY3JMuEEqbjE4ul8YDsFUNYTCng+twDo4
	1tMxRbU1hAde+RgN+/4kGysHs9E8JmYW5V+OIm8Dx11PdBNN/vw/MGXUn85xR3hirQ==
X-Gm-Gg: AZFdTZdFyipTBgEmPHGx1bAyxcwi8lxuSIuE/qEqpG/zmgA/MnCl70Hlh/bO7tATjsB
	2SdtA2S8/lp4R65/sGZdsigG+6ak9ISqBlL63ucIDnkuLH5Y8+a0tLVAi7NI1Qa+e2JrDOfmBB2
	Uz30y+1f7LFLE02HLGyDkiNJ8O8vZIlv2k1NcFKRJuO3YJpS3OI6mVSRtA5TToHI/H34zt4dfLu
	2sgty9+x9XDRbH7R8YjirqkWe6mFlPUxydbbgpT1Lg9bkjy98H0gQCW6ZZxYmJF42VkviJOV6hm
	PBeX9ZAURIZm8piAfgWkk2N8SeMoJbjeLvIT93r8IhnfP3oz9u2f8PLUL5CqoPYX0KkD7sr76YS
	oEOu29/2o+3qI2HNlB4YrduUoiW70a+ZfXwwdJNXbq2+C08oTierbx/eLMmlXzWni9VeMFG3YNu
	0bm8ENOHmSidOzhggNE43nS67V+AeqNrdeBoMwV6dgkvJGu5ouCJTERLUGeCe8CPZyqxKskvqaB
	D/QSLuEsJ4eoAO3R1IrPkVZSbFW3dD/cduY2qxkIQbINMqIyf7NLH94+TLDbOwsFacsNcLfeS1P
	bbclEZnDbvJzR2Z73Fs6ydDgn6nbjDJuin27n4nLMNSsP+cynjdBo7Sq5fY1ZaQtCcvHR8A9udx
	2TvEjMO0vVgwU9/xA4g78w5/Jx4fwbTPdGr1fLfIY9LbwYvcujzzHXnKutFC3QAhNacS+fa8gIX
	HVS8w0jAS3MuZRJBbZzLv+JGH1VMhZz36OF+YKRkoXeiRm2PtXHlpOXsrynDT2Mmlt7rN9GU0Fv
	e7syc0lSdhz44XQoTZBZ5SWfxV0a7d/6LI0cjvON6CGji2XEmLoTqyxeMzyEAg5LtDcKoj+TEa/
	x3Y7e2LwzcFrSOvaHgQ9i4zODNLNmfSdK/hi4GD1tsiuZl+LMiVEH5zTAB/fyY/oM8PSZBHPmPg
	=
X-Received: by 2002:a17:906:1911:b0:c41:b94c:4538 with SMTP id a640c23a62f3a-c513acd297fmr440901566b.47.1795302457248;
        Sat, 21 Nov 2026 15:07:37 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:36 -0800 (PST)
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
Subject: [PATCH ath-next v3 02/13] wifi: ath11k: keep the radios when a firmware recovery fails
Date: Sun, 22 Nov 2026 00:07:20 +0100
Message-ID: <20261121230731.1206043-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150739_182890_50539628 
X-CRM114-Status: GOOD (  12.57  )
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

ath11k_core_pdev_create() has the same problem with the registration.
During a recovery ath11k_mac_register() and ath11k_debugfs_pdev_create()
return early, but when a later step such as ath11k_spectral_init() or
ath11k_cfr_init() fails, the error path calls ath11k_mac_unregister()
and ath11k_debugfs_pdev_destroy(). The first unregisters the radios
from mac80211 while ATH11K_FLAG_REGISTERED stays set, so driver removal
unregisters them a second time. The second removes the debugfs tree of
the device with the macN directories, while ar->debug.debugfs_pdev
keeps pointing to the removed directory; the next recovery's
ath11k_spectral_init() and ath11k_cfr_init() create their files under
it. Undo both there only when ATH11K_FLAG_REGISTERED is clear as well,
which is when this call did them.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 0366f42640a4 ("ath11k: Move mac80211 hw allocation before wmi_init command")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: also skip ath11k_mac_unregister() and ath11k_debugfs_pdev_destroy() in the
error path of ath11k_core_pdev_create() while the device stays registered.
Florian's Tested-by dropped, as the code changed.

 drivers/net/wireless/ath/ath11k/core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8e4dab61a300..5f4e7fbe0b25 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2073,11 +2073,13 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 err_thermal_unregister:
 	ath11k_thermal_unregister(ab);
 err_mac_unregister:
-	ath11k_mac_unregister(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_unregister(ab);
 err_dp_pdev_free:
 	ath11k_dp_pdev_free(ab);
 err_pdev_debug:
-	ath11k_debugfs_pdev_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_debugfs_pdev_destroy(ab);
 
 	return ret;
 }
@@ -2231,7 +2233,8 @@ static int ath11k_core_start(struct ath11k_base *ab)
 err_reo_cleanup:
 	ath11k_dp_pdev_reo_cleanup(ab);
 err_mac_destroy:
-	ath11k_mac_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_destroy(ab);
 err_hif_stop:
 	ath11k_hif_stop(ab);
 err_wmi_detach:
@@ -2315,7 +2318,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 
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


