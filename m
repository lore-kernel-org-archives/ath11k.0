Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FED606A330
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XfaMZckU;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jmUG69Of
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jfrh1uIU+/waSgkZCGYbAyxAmQdxTwCrEPYnNRV069U=; b=XfaMZckUn68tfy
	vmtYGxogRuhSnsrOFG75s4F1ww6wnx7TCShmZpyI4DkaewxjNn/9QLtetTZcEJZ9IQ6D2VnfNdxLQ
	E21G4sYehTKEiW+kMuHwj2BGt2x+kKsVIIsuMQUVjFBwbunG6cpE5Lm8aguNUKsWjd/XbpQOdMdVy
	6RO6twbq5rPjivrwq77lj38kBygGvJW8I660fPsZP91gikXWA+uUn/hWzJjR/swWSW0uO9ms+GQ1n
	KFpmhJdB4F/C4u2ZfBZdmclcnUZuVa8EogmN6t1yl3SbV2uDf2gLU1seCD4QeBF5/8em70B/pFopG
	xbP3cgHCbZ3czFpd7Hfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBy-00000000Sh7-1VN3;
	Sat, 21 Nov 2026 23:08:24 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBa-00000000SIC-3xMQ
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:08:20 +0000
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50933bdf4bso498112466b.1
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302476; x=1795907276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jfrh1uIU+/waSgkZCGYbAyxAmQdxTwCrEPYnNRV069U=;
        b=jmUG69OfxuoSccP5vndLm7Y6bvo5ACR8UCogsAmAwfHhEd1xWWcYH/voURY3l7VixI
         VH+13RPCo7gSDy8eLbY6k9c83PxNyk8W5jEGL/hKpCr29NMfF1NiCORYuqDdjgbv2RP8
         9SwemwJoUO+YaP9iPB0X1372OTnmxZkA8aF54ltWReojz4FibngNbvoB0WQRt8UzPGsj
         Hu31+xsafkAXcNRk0PwsTsZU8CiqzCJ3w99CZnoD4VhO+ZHZUth/gx/CYNdeTZ+b3BNz
         QqsAUnxVOhRMXFUGclYL4V5C3HMVTQea+Xy/SKozCLUEUZi4++sumtfQiLS10F6ykAjJ
         Dbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302476; x=1795907276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jfrh1uIU+/waSgkZCGYbAyxAmQdxTwCrEPYnNRV069U=;
        b=fIIAi3p3WwRjqEl2Ewe/4iW7up/ioGOGb1OeW3lDuMozhXwVpbGNQjXLGEjvBUVhKY
         NNfjtpQnwepy1xMQJZPH53TmJ+3ihwiYExlxphVNVWHj4Q3DJ84Z3Qsovu+LXyiFMVtg
         YLor4UfEu7aygfrwOgb9VyrNm4QBuc1JHG9teu6J1RMrE5c2wZzsQlf8LDAH6w8U/DUu
         lfxDcrkXbZCNev/nYb/m86/6jMYzT7wInuBloQP1Tm8phr02tSZocHJNw7CnNCTIq81k
         SUpkXfsapeQqFdE80PlXKK2GhHH0gVYMd5h2tLyC1BwGdQAEqTRFPkNYF0lX7RRDlTXJ
         pLHw==
X-Gm-Message-State: APuU4Z/gceQxhgZYxHf6WkIWhsKh5HVY2H4SH+iz8vJWKkIYcfQx3Mh7
	NU3etpV77LSpcnLsoL+sypotf5jT960PM4q+6yqmWa5QAzi5J4Bkp3ZaMri0eEKhzg==
X-Gm-Gg: AZFdTZcPiu+yWh2qiEDjRUNE+/9/0FZ0hgf4tD55FNjRob+HceFYOPlaDULW7FS+4Vt
	ZK00G/3G5LS5zBiZ0Va1Xn9K81Rp2VAehgyI5aGWviliUfSV6//INdidypgFyQECLbJHWnZFcb1
	AgwXW1WWX59UEB4BciCckEHWHfsxmo35ygkmKjW90USbRELq02m0xbloDMV+fep1t+mDHa/RtKG
	Dlymxxn8yb6iEI5Reu38stmyJzqsXxvbL4BD973N40NQf6A5qhJbdAcvuAChiQW16CMTDEs8FeD
	MhhlEAIlAynkCjrTcc1IkZO21vxnFkbntNvF/i/HqmOy3HIliCrNO0Q43q+/QSIUniSbxGDPe2Z
	wm7d4RDl7znq7Zry6qU6lSvHu9y8dX/SfeD6OzwWZcROSfHGNWnVtnTXx8BENSEIufg6ta/09Iq
	altd96dNHrtubS2wrqc+NMW2VNn2TFIhV8VknZ2fLEce4T74uXss/fpNILNE95+eti5h1qXzfnc
	raY2GIO3guHvAEZOmQUPHqWGvwaSLjvl33ILFgqxdCrvu6YrTkikYqiVzgsFf2o6wpPqzKlfOkt
	SuWafJvUxcYRowZl7yimw986lzQaLWW/DMtSGp28R/vFAUJdhHiJIgYNG7sdseQAPrQE2OgO/3x
	mD3NZjGE41T689XG5ycswPa8eNxbInnBn8DPtzRTO24acugfWfwZ0Sb8Rd2wZeD63F01hZVTGZI
	4E0IqJNm+YqQSlUTknjzz0j5nE+a2L3DNLSoKgirnZFG+pYRlZ+kdmQs+9z+SL+SNKSunoP9Thb
	6TniGJRu7aF0TnGsAmZcDHJWeBhwH+uT/70FeT+T9/QQ8fqxW8WmY3zBPSODJx0HLOG3xCuqQV7
	CVZDx7CBXOLKZCn5VY+Wq8pELuD6bGp0ZXaLkjvorDIbVZXTjOF8lRpLo0x667huOGxxeNVXm+Y
	=
X-Received: by 2002:a17:907:3f0f:b0:c41:9a35:17a2 with SMTP id a640c23a62f3a-c5131a6ef04mr809669266b.31.1795302476575;
        Sat, 21 Nov 2026 15:07:56 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:56 -0800 (PST)
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
Subject: [PATCH ath-next v3 13/13] wifi: ath11k: keep the cooling device across a firmware recovery
Date: Sun, 22 Nov 2026 00:07:31 +0100
Message-ID: <20261121230731.1206043-14-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150759_219204_19F1CF00 
X-CRM114-Status: GOOD (  13.65  )
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

ath11k_core_reconfigure_on_crash() unregisters the thermal cooling
devices of all radios, but ath11k_thermal_register() returns early once
ATH11K_FLAG_REGISTERED is set, so the recovery never registers them
again. After the first recovery the cooling devices and the phy's
cooling_device link are gone, and ar->thermal.cdev still points to the
freed cooling device.

The next ath11k_thermal_unregister(), from the second recovery or from
driver removal, passes that pointer to
thermal_cooling_device_unregister(). With CONFIG_THERMAL_DEBUGFS,
thermal_debug_cdev_remove() takes cdev->lock in the freed object. Without
it, thermal_cooling_device_exit() only compares the pointer with the
registered cooling devices, so it unregisters a cooling device that was
registered since and allocated at the same address.

Since ath11k_thermal_register() is a no-op during recovery, the cooling
devices stay registered like the radios: do not unregister them in
ath11k_core_reconfigure_on_crash(), and unwind them in
ath11k_core_pdev_create() only when this call registered them. Their
callbacks do not reach the firmware while it restarts:
ath11k_thermal_set_throttling() and ath11k_thermal_show_temp() return
early unless the radio is in ATH11K_STATE_ON.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 50556081e09b ("wifi: ath11k: thermal: don't try to register multiple times")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 0795ba7e038c..4aaac5200ed2 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2072,7 +2072,8 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 err_spectral_unregister:
 	ath11k_spectral_deinit(ab);
 err_thermal_unregister:
-	ath11k_thermal_unregister(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_thermal_unregister(ab);
 err_mac_unregister:
 	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		ath11k_mac_unregister(ab);
@@ -2342,7 +2343,6 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	mutex_lock(&ab->core_lock);
 	ath11k_hif_irq_disable(ab);
 	ath11k_hif_ce_irq_disable(ab);
-	ath11k_thermal_unregister(ab);
 	ath11k_dp_pdev_free(ab);
 	ath11k_cfr_deinit(ab);
 	ath11k_spectral_deinit(ab);
-- 
2.53.0


