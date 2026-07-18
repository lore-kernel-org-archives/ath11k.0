Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C3FC4451C
	for <ath11k@archiver.kernel.org>; Sat, 18 Jul 2026 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6FMRb6Ton81+XDkPtgEkIQhf4bCKKZGg7F18DbjTnE=; b=AODBGuZnSYed/rycaWJcTFhw1/
	KzHRgpr42ov51PvShAsuxFsuttZtWmV/d1JLT/ylvyYg6egQknh+3S1uLu7rrRHvjcU4zc0Qng+vX
	o7YhzEdqM+i3nTIDe7so6H6FQbh/u1KUrXARZio61gAkVod6EMajEKqjoerjl3Ezcjz1b93Q/nvJs
	uEzP4VynoZP1WkQj2Bpx4FS1k9AVXXvcRDiC63JeLTOmwa3Bv9B8EGZccH16/nQmbGgCyAA2ZkJqz
	yNyFQb9wpOqcqpFTEBYTGhjZettyuvRZ9n2PzlKupt7GIv0DkbiscQGihmVVSHAETFc+tIyufXwDJ
	/M5t2OKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkzjt-00000003qzI-29La;
	Sat, 18 Jul 2026 07:45:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkzjr-00000003qxs-2PG8
	for ath11k@lists.infradead.org;
	Sat, 18 Jul 2026 07:45:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ceae1ed204so63045045ad.0
        for <ath11k@lists.infradead.org>; Sat, 18 Jul 2026 00:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784360735; x=1784965535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6FMRb6Ton81+XDkPtgEkIQhf4bCKKZGg7F18DbjTnE=;
        b=sncX0IYPiVw5NR5SWWGN8UqLjon3PexStWieBTYOE8uDX9U3FpBUMOqh6mrS2BPOuW
         MsBt9D7QjnibcyAYvfNouyq9SU8LGRV4z6eQKAgJGSRf39X1blMqQiJg927tkryZV9+d
         7B/1c7K4DsJCL271VC/qHPbR6z7eulzdAmC6J6PTZEeKVI8llTX6pixGBXAQdN7+56At
         vTllykmXdvIHGhIVOXz3R0xqDYCzH7QDuhRSiiaURgvm04zgzxJx2jCGjGp4m3FxkHpL
         QvTcHqVHFG1bJo+ZduD3UsXkwlypvLlBREve6x2CS68ZrOKL2q08mDFukaY/AihCTBWJ
         lsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784360735; x=1784965535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6FMRb6Ton81+XDkPtgEkIQhf4bCKKZGg7F18DbjTnE=;
        b=bXTobovd20I3JECqLyr6UtHBqGoLsFM1ABxgCoizz9Y34ZrhG69O1uQJHNzEBHL/iX
         zNXKTetKZABwL7TEF4ca54IlHP/M+pLWr+8QyQ+U51abjzL919pLAe9vvJGrzuI6/fiZ
         zuBdnzlyQ0lHSk3xaiJjq9Ka99fIB/GYIDpK9ZTEaQ/VFsADMNAHWos3uokIjVVCt8Lj
         2nz0Qvx0VqSPU4w/paT2NJ12wNhYBil8pSH9oxgAKXIhVnL0ClijvOBNDIT83sdRjpSn
         Hve+ZS6XOXZvzY79BT8qYls6VdJtnGmZokEmVvoGXDrJSjQXA14hQuDQ4h8qmGtGcD/I
         gwaA==
X-Forwarded-Encrypted: i=1; AHgh+RrxHYahJCoKheUMTyFxAFxjRa3jImMKiVmmy6x+9qTAcLCHSHUmJxKOHSY4CPFJXF5rBDLlUjM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+dgVO3s1uBoW/h7Hvt9e3PbTMwDlZ/5IT4VZ1LXAyNOmUhwR0
	2AEBWkDNwrXTKdKaIYTv38F2Hh+DAV4MJihkM3rZloefBIU9W928qw0o
X-Gm-Gg: AfdE7cmyLJO3C24raJ797B4mYceAXAIFP+JolX6qBiR3Gwj7en6XguoaI8fH6pm2R+Y
	iNJ7RhdDyI8FNdVXxbZq9lMKKmWvqb5Zo8CSQkjm+Ob4uRTMKBkM0ehNHLqI2U4/k2uLvNXF8GW
	eChrZOO8RE71U+kdxCJ3pOrOVwKr78YLfevME6KPfNgFw05/0DMR9r5cL1bx50dt1jxTvkn0xxT
	1sEZU6Ilrap+SthaFh7p4jT7AcYvRylaAX62H1+mqWSCcRf7EpQmQX52ACYVrcyqcv7Af67RQLv
	J+Y53VkWAnkXr1T/u7pkkzcBl5BUxTqg3vfu7hzBv1hZSphJS6x0EDMh7Seg7LUJVFJ2n1W/OT3
	lgIpe0AQ4vkdcZgRXCwmsuxS7tUZUq4ftDzJ3mnMzws85XB3gFik92zxq1WJV4LutauA=
X-Received: by 2002:a17:903:234d:b0:2cc:f4d4:29a7 with SMTP id d9443c01a7336-2cf3499781cmr65687175ad.24.1784360734636;
        Sat, 18 Jul 2026 00:45:34 -0700 (PDT)
Received: from lgs.. ([152.32.188.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da07csm23399685ad.52.2026.07.18.00.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 00:45:34 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Ganesh Sesetti <gseset@codeaurora.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v3 2/2] wifi: ath12k: release QMI handle on late init failures
Date: Sat, 18 Jul 2026 15:40:26 +0800
Message-ID: <20260718074026.3085688-3-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718074026.3085688-1-lgs201920130244@gmail.com>
References: <20260718074026.3085688-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_004535_609971_5F01EA8A 
X-CRM114-Status: GOOD (  10.36  )
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

ath12k_qmi_init_service() initializes the QMI handle before allocating
the QMI event workqueue and registering the service lookup.

If either of these later initialization steps fails, the function
returns without releasing the initialized QMI handle. Since the failed
device is skipped by the hardware group rollback path, the handle is
leaked.

Release the QMI handle on the late failure paths.

ath12k_qmi_deinit_service() uses ab->qmi.ab to determine whether QMI
service initialization completed successfully. Set it only after all
initialization steps succeed.

Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index fd762b5d7bb5..692f1b2c2031 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -4041,7 +4041,6 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 
 	memset(&ab->qmi.target, 0, sizeof(struct target_info));
 	memset(&ab->qmi.target_mem, 0, sizeof(struct target_mem_chunk));
-	ab->qmi.ab = ab;
 
 	ab->qmi.target_mem_mode = ab->target_mem_mode;
 	ret = qmi_handle_init(&ab->qmi.handle, ATH12K_QMI_RESP_LEN_MAX,
@@ -4054,7 +4053,8 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	ab->qmi.event_wq = alloc_ordered_workqueue("ath12k_qmi_driver_event", 0);
 	if (!ab->qmi.event_wq) {
 		ath12k_err(ab, "failed to allocate workqueue\n");
-		return -EFAULT;
+		ret = -EFAULT;
+		goto err_release_qmi_handle;
 	}
 
 	INIT_LIST_HEAD(&ab->qmi.event_list);
@@ -4067,9 +4067,16 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	if (ret < 0) {
 		ath12k_warn(ab, "failed to add qmi lookup\n");
 		destroy_workqueue(ab->qmi.event_wq);
-		return ret;
+		goto err_release_qmi_handle;
 	}
 
+	ab->qmi.ab = ab;
+
+	return ret;
+
+err_release_qmi_handle:
+	qmi_handle_release(&ab->qmi.handle);
+
 	return ret;
 }
 
-- 
2.43.0


