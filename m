Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F40F606A326
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 17:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wx+hLRus;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=sKbNkyxC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=O080aChkvNamwQRpvXuVq5oFlnHhJNHxbRaLnIM0Xus=; b=Wx+hLRusMHBZiSt2G5uxttTfSn
	otPsQUIGk54qcLGcjdBhQ/y3t4iNulwiO5BI6NNQzqL5hA0yG7G6JxuMSxZcptaPR+36hq+lyq8q3
	o8j5lLP+OvS+adPSHnAjdk/3ooKiXoY8AjA9oY6iE38KVMW3dfG3m86ivlKvTEKRHfa/22/+pG9zm
	r9kS6w4sCjgsaK71NzPDW9lD0U6fsOkTkgX2VCHwSObU8gmwmL7IEM2chJ6FTVwORKjxMyTWv2TTq
	uJQbCfhv2/a/cUhIQtGXz6MadRDW4mCnnXp/azmFMZZQcpMav7+WtsIdMHn+9Sd15XCS+8Ceo0Qfr
	hBtbmn4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXMDt-000000012ke-0Qbg;
	Sat, 28 Nov 2026 17:28:29 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXMDq-000000012jm-3bZ9
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 17:28:27 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c51a14bd405so526765566b.2
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886905; x=1796491705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O080aChkvNamwQRpvXuVq5oFlnHhJNHxbRaLnIM0Xus=;
        b=sKbNkyxCJcOoPveeLhID71dWywVoSJSnKg8ZJpIMDVIByEF2Bf/qCbkZva6kgMHzEC
         kPGjK3hKB8UJjVbJJTsDAW0OSrfiX15vyx/Ck8Fz2hS1fxEhhf8PH9a7WIJH7M7vKAWd
         5m2pBvfeLLPXSyLv4KeQMfKQ3it+QRw91olOl5jxq3e37pFVVuJnmG+51krBGmLIH/bq
         MPdl5gxdakQKrSzFjhDsd/hJMFpdj1z23+ikykjXLSXX1Y7U6tdaw4rQX8ic/mn849KN
         jXQ/bm3TVEKFAqmwti3Zn2bzmdSi7lGLS78UHrodRRUVSkgJPznSOWz2XJRRaaTlBAHM
         TSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886905; x=1796491705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O080aChkvNamwQRpvXuVq5oFlnHhJNHxbRaLnIM0Xus=;
        b=fioElptCTYjTKHwR4MKtprOps3JC9ADP6BJlX/ZeEHMMZd899DeygWJeyBB9+VPEJN
         LZHzEi4yaxuQaYe4kyKcCUmwpbyT3QxfmvuHevkKwpvqfuEJ5NrW4ZroUdlEmakahsfI
         RuGV3td/rqDvvR0NSa052GOmZ8huUFbiC7mJwfvdzmUwZNaJNm/+EKPqzGjHuCZxAY2M
         EksigGnGnkSJySLuewLFs708NV+h9sSSpC+DEkz62W4TlPKJ5IxuMiIz0XK2Qxhf8Xqe
         MwoIEbnk+ATiODvR+s5H96asMaXPASXrGVR2hSaThfZBXu46iWG6b4k0/lxzCvqJ4MgG
         /sMA==
X-Gm-Message-State: APuU4Z9Bw470o2DUT6efWs7CJITM2YQUdGBdCcVCfeyaDtP8LNv8Jo0K
	zz8TITr+bXksWyAYtIGn1/T+Pm+TDZYp0w6aU+3QLYifkW/9Msm8k42MrzyKMLq2yA==
X-Gm-Gg: AZFdTZdUx506XxAdJCnALqdN+w4y3Zm0gEigrmuFskfPB3t9V5G8dMQWVBxw3pCd8CC
	SFsibQj+O4BtWGrLlgdaFzTxWQtPM8vN2r5XL/+D0QqO4Ot4nPG4MZIjbK/X0fc7Ic08p146Nq6
	3hvi1J2JKaFn6Lo76FPtTkrebUAyPFif/4vmpVQLH46gxlElA+vH7ihGefDM5KWVkGTE9dJFbz1
	6SQDA2rxASWpW6IxHcu6dAZ/cB4v/xUL8m3L3siVZO9cvFwRNtUL9VuSsu58quoKwhIwKO1ib1y
	F6GtatOT9aL2hlnpKfKT3rNKhes0N3fpG/YCE0HwmhWoXdtCtoGcm/iPy2G5cEd8HAE72u6vqtq
	gXxuwubkAHyVDj20V8fa/XlJHypcEABaxEAKhXMP1nYRP2kFuvsVRyjKGDLyLTB5MDT5pcdjpHC
	cO3idr1rELXv5Eq1iPZwBrWYoesOu96JiqUfcIJTu2B1BjrgsNrECofRRy9Dx3bSl+uZqb3kDf3
	52OI0VK/GTpVba5SVqvlXfFedLVzTQEULAHgJaCGGFbhviKV9HYxWnP1WNocJn9iUob8+KufVnx
	UKg14OZ7s/NR1I4vU7gaC9kD/3kdmcD6Fn0wnVPzHxLXzIw7hrHNxvxPdIjFDHaSuDwNo3S48cd
	2vYcrOqVXzP4jtwOtKEFyiAuy8GJVQJaDHpFCgxPwhyB19POXbB4L9+ZWY/ljMpaZ+91b7FChpn
	VRV+9Vbkl9gSKX3PzOKsSMXafyI7GdKaeQ9iXkJD/uMaNcbeHzXsQmUKDFIkzft2oyEAoQKLeil
	R7oolDinyrP+i3UPskb1svi8GgP3seSUq1mUpJ+Wdu334nSW2pCflx87MFPZAv5A+UeluwbIYIF
	ArjSjwNiXw/oJA==
X-Received: by 2002:a17:906:99cd:b0:c50:5005:8ecf with SMTP id a640c23a62f3a-c5158a29e82mr1859064466b.8.1795886905085;
        Sat, 28 Nov 2026 09:28:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed607sm976442266b.77.2026.11.28.09.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:28:24 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath11k: ignore the PPDU ID format indication
Date: Sat, 28 Nov 2026 18:28:27 +0100
Message-ID: <20261128172827.1168404-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092826_917457_23CBCB27 
X-CRM114-Status: GOOD (  12.96  )
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

Firmware WLAN.HK.2.12-01460 on IPQ8074 sends HTT T2H message 0x30 each
time it starts, at boot and after a firmware recovery. ath11k has no
case for it and logs a warning every time:

  ath11k c000000.wifi: htt event 48 not handled

The same line is in a user's boot log with WLAN.HK.2.9.0.1-02146, the
firmware linux-firmware ships for IPQ8074.

The message is HTT_T2H_PPDU_ID_FMT_IND in Qualcomm's public fw-api
(fw/htt.h). It tells the host which bits of a PPDU ID hold the hardware
scheduler's command ID, ring, sequence index, link and MAC ID. ath11k
only compares PPDU IDs as whole values and never splits one into these
fields, so it has no use for the layout. Name the message and drop it
without the warning.

Found on the bench, from the warning in the kernel log. No security
impact.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
The warning shows once at every start of the firmware (boot, driver
load, firmware recovery) on IPQ8074 with WLAN.HK.2.12-01460, seen on
the bench, and with WLAN.HK.2.9.0.1-02146, seen in a user's boot log. No
frame or user action is involved, and nothing else goes wrong; until
this lands, the line can be ignored.

I used Claude (Anthropic) to help write these patches.

 drivers/net/wireless/ath/ath11k/dp.h    | 1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6d..bace81c453e16 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1033,6 +1033,7 @@ enum htt_t2h_msg_type {
 	HTT_T2H_MSG_TYPE_PPDU_STATS_IND = 0x1d,
 	HTT_T2H_MSG_TYPE_EXT_STATS_CONF = 0x1c,
 	HTT_T2H_MSG_TYPE_BKPRESSURE_EVENT_IND = 0x24,
+	HTT_T2H_MSG_TYPE_PPDU_ID_FMT_IND = 0x30,
 };
 
 #define HTT_TARGET_VERSION_MAJOR 3
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..c65bbbdc267eb 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1747,6 +1747,9 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 	case HTT_T2H_MSG_TYPE_BKPRESSURE_EVENT_IND:
 		ath11k_htt_backpressure_event_handler(ab, skb);
 		break;
+	case HTT_T2H_MSG_TYPE_PPDU_ID_FMT_IND:
+		/* ath11k uses PPDU IDs only as whole values */
+		break;
 	default:
 		ath11k_warn(ab, "htt event %d not handled\n", type);
 		break;

base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23

