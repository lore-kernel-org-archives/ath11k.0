Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0151FC4451C
	for <ath11k@archiver.kernel.org>; Sat, 18 Jul 2026 07:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFyV2Rkgf5HtfQYv0w6PI4pQpZkaJeMYAvZn1zRWRf4=; b=1ENZkHQ0fTCqF//0QmruIqMFMH
	CYDiJoPiBzU1OJ7vb/1qhprPJLrQkUIaxDtJSvkvw6Y8wopUuLDou6cDkdWFP3sh+rotfet81+BfT
	rdLqjnEm8N67G5dXAluZyrHt9XSL04htnBNt8JzHlFWJk0Ey1SUkYskLpIRyZOiFh7okxIB0m8Vdt
	dAzsZCwsA+d/YwBxxr4VSwUKc/4FqcblkvJwNHJRw2dvrfvVHoTludLJYR+f210a0dACFoE9Or/sB
	J3CjlBufIZlyOpUS0qQ99qxlcJqLw/Qj49eTLG86uhMinaAS3I8fhaexD1E1yEXY5+gC8frMAlLJv
	T5T3rfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkzjl-00000003qvr-1s5c;
	Sat, 18 Jul 2026 07:45:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkzji-00000003quy-2P8N
	for ath11k@lists.infradead.org;
	Sat, 18 Jul 2026 07:45:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cf52d15d88so155115ad.2
        for <ath11k@lists.infradead.org>; Sat, 18 Jul 2026 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784360726; x=1784965526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFyV2Rkgf5HtfQYv0w6PI4pQpZkaJeMYAvZn1zRWRf4=;
        b=c07J3bGPiQ4cB9q0bIIK0GSllP2UG8/Aqiu6NhBjBqhG2RQj78bM35yTv8VZVoJiBr
         d2ZLB/RABp2WsE7Zar2gce4lS7BDfqdFfR8eeDSYYniGZIpJ2JQD5qKH49blB//PmGWH
         5dvEIFk4e620Q6IiEp/CZxP6aRQyjC8A16VOnh5owy4MAzpny8HWXlXY1eoWrGeQ7lmA
         ixjA7rzNQ6wL1Hgx9c/UisIGLca5B2FaigYWfF/NssxpOZpPj4SJPNfUHdlS5yMePzhD
         MFgukjMVmh5Fiz/voIvh9oO1XnCwAPB5L/QENxFVyvcx2RXb7ycU5O1ugHzr/iZmTQtX
         R0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784360726; x=1784965526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFyV2Rkgf5HtfQYv0w6PI4pQpZkaJeMYAvZn1zRWRf4=;
        b=Sr22TvMq7wq2MuQ8NkbU7TrAo53Sp2sIcxaV5Tos2mLwZd7mJYScvwxCiATt0fUAE1
         IWcoSJW/OJuXRMiyE9/dsusKBdnTZgekz3MxzyJD4uStts3l8MEgtEqgw2B2A6+fmcLA
         c1usOC7/p2f9/LiiW+ld88PRb6946+ZONbBlyIdW4i6E3/SqW1IE3k4iqjrGZxk84qT3
         uOv1jVubs/rVj32KBpaIyqBFyKrcy5gLvqAn4DRh2nzNaI1q+JoGqRkb0F6ka+RGpZub
         yn/j7YOP0DExrwk/wTrORfPOyjOZk6vfvuzWqzs+ai7OxX8Z7cpLA/vqlxZR22MU9HHZ
         f/Xg==
X-Forwarded-Encrypted: i=1; AHgh+RoqwDL1fC0W4pGNGDYW+h3WBgCuCA+muLRqmSSisqzzcVGUoJi7KMuaZQbXWuvIo4qI9FeTiYA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvJz+G+qz48LD27n6tdxSNfmMk91txec6lkEfbg9YMktK8hOPZ
	khwUVpoTGPpKs04VJCOnjVIRd09ibYPb1UpId1278qdEOhXdx8rHRLb0
X-Gm-Gg: AfdE7cmVcnjphMK+c/rIwkG2t2Wg2YjaHjJ+QocFPLlnjigIYWr8hi2fo4/NqQQpI5t
	E4hac60L/HMrXkQNQJlRsi2C4lqdb7JRidO6TMahJ8yknOU4Jwlxl6SzaihxTcqFqDHB3rZ+nus
	03//DljaqLuZJt9v/M9FeTCe6sHGJz+qCd+5nyPK9P3HvYF0CtPin3H1mzIC8R16veMG+vd40Vr
	SFVyO396hscJyj/2tgax1LTx3DlBVJVjg4fOzecGuKVG0BTRcySedVe9o6DYuc3e6D0Fuza33IF
	KHCJgY9lxHuf/uMmKVwTuyz2BDr3Vxy14tQwWW9SESOyhSBJV6VO6TwmwoH1cobiL2N6TReBrVf
	QgfQJp8d1H4huKslksx407r9DoQz5JNr1GKaY+vLW20faOg4r7Xpdsw1weJ097kOHnCM=
X-Received: by 2002:a17:903:1aeb:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2cf3486ef6emr68540395ad.16.1784360725629;
        Sat, 18 Jul 2026 00:45:25 -0700 (PDT)
Received: from lgs.. ([152.32.188.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da07csm23399685ad.52.2026.07.18.00.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 00:45:25 -0700 (PDT)
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
Subject: [PATCH v3 1/2] wifi: ath11k: release QMI handle on late init failures
Date: Sat, 18 Jul 2026 15:40:25 +0800
Message-ID: <20260718074026.3085688-2-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718074026.3085688-1-lgs201920130244@gmail.com>
References: <20260718074026.3085688-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_004526_616219_118F23F9 
X-CRM114-Status: UNSURE (   9.91  )
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

ath11k_qmi_init_service() initializes the QMI handle before allocating
the QMI event workqueue and registering the service lookup.

If either of these later initialization steps fails, the function
returns without releasing the initialized QMI handle, leaking its
resources.

Release the QMI handle on the late failure paths.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 410a7ee076a0..6e3f82169d24 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3329,7 +3329,8 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	ab->qmi.event_wq = alloc_ordered_workqueue("ath11k_qmi_driver_event", 0);
 	if (!ab->qmi.event_wq) {
 		ath11k_err(ab, "failed to allocate workqueue\n");
-		return -EFAULT;
+		ret = -EFAULT;
+		goto err_release_qmi_handle;
 	}
 
 	INIT_LIST_HEAD(&ab->qmi.event_list);
@@ -3342,9 +3343,14 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to add qmi lookup: %d\n", ret);
 		destroy_workqueue(ab->qmi.event_wq);
-		return ret;
+		goto err_release_qmi_handle;
 	}
 
+	return ret;
+
+err_release_qmi_handle:
+	qmi_handle_release(&ab->qmi.handle);
+
 	return ret;
 }
 
-- 
2.43.0


