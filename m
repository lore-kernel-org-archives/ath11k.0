Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333FFC5DF8C
	for <ath11k@archiver.kernel.org>; Sun, 23 Aug 2026 19:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRfRf2Fgkto2eylatQTpTDlM8qkBEZ0zYa2j5Lueb1w=; b=qU/MkL1tZmy15hA8Wek8lD98St
	GqgBAo5wqGbD9NP6LxekgpyqVFLm2vW/UFCbZ1b62Ss1ocZ9eoltik5vb8EZbqKeJAtmYvZaCbu53
	rd+Z2CiOkDVZCT8riql5Xetp4F9KliD1qJgZKkJ9AomUthzhlPpF/yzoP5w3NNoOfEkwyHSN7uwu8
	wnK7Y4l7wDXMTBadB4Za94DALOYwUfBCZ/InEIH+AiqFZQEfTk+v781lG9ticUErMimPqkYezUSYk
	u0kUNcwkgcy/WqKRScgpEVWHXx8u5i7pbhgCQrzIV8wbYqiUeMeyhkWhzb5nSRjpJxtDh+ny4IAcm
	m3XT6MPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEK9-0000000FZw1-46Lb;
	Sun, 23 Aug 2026 19:57:45 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEK3-0000000FZsy-1JOa
	for ath11k@lists.infradead.org;
	Sun, 23 Aug 2026 19:57:41 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c214e625259so386462466b.2
        for <ath11k@lists.infradead.org>; Sun, 23 Aug 2026 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787515057; x=1788119857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRfRf2Fgkto2eylatQTpTDlM8qkBEZ0zYa2j5Lueb1w=;
        b=eBiwe8HqR6WzXdci5XYzsel8EpE6StX3En53od15tTGU+VNyzh5OMPutjS5zMxwFUJ
         /+mppVDq/gsZ78tkRJkVhaCBk9RIZ/qe1tb1yokfm5JeKmzRKZwOD7721/iEwZxu9ART
         NHeBDb047FkBA8UDhatTMG0evMoa15AvYKidfkkFqNhOHXscWLkZhWjC0/9r4i9ztI1b
         PLdHfRDFbvrgkLXeSMchX9NPCeLMImYfPNWb8bdpTNTH9BLCnh5gMfRm2PpMmrmBaFwl
         DnSOvMrAV9I4nneUDZpRYUjxliU+Y8+j3J9YssT28VRKnzCNLnKSWKxH/K61FUEVbEBe
         vhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787515057; x=1788119857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRfRf2Fgkto2eylatQTpTDlM8qkBEZ0zYa2j5Lueb1w=;
        b=jsi5FyJCo/OAN5Zpkc1qOLKb62DSVqH4nVL+8IpcKOGabzNSJmd0vCnqd7eY+tOfNh
         9z9OB7kvihVZu4ZI6GWHyHgQ0sMVo5XhGSF1YhNigD0K6+GnlfI/5m9VdT4fkVD+djik
         xfje4DCEmyAynYOqA4KiHLEvlecPPFFqWB/BUSWlniGUeAZfZnnSoKBA/NSp7hhP0oGB
         wqDZfm31txQMlmE4OJggcMSYEC5NCH5/v1y4C8nw037OrB3R2PIeQOa3RfS6SJFqic9f
         b5l1RK95Uui42dbNIpONPq1xyO41h4wuKP6Wldu11EvjyLk9cyYa9w1s28Lalfia7knH
         3cHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaZSMmIDsnoUzUQfbvSStbcsBucKTmmKc+UN1NNQj7O3T54LcGLoCq7l4ijPbZqySmZUALmRQ=@lists.infradead.org
X-Gm-Message-State: AFuF++neHSxy2qs0bRTYQg/vdMuzxSdplvJYqHrlFm5f7bY7poop045u
	64Sc8OPhONJG0SgRwIxcJ8J0NBtpDcR6r3DzrbobwssITZYKNXTkroiuPyosO25g/g==
X-Gm-Gg: AR+sD124lqhem3LkYpPKAw/OA6N3vJJ0LvFuIlKJ5y2opZcVTm2/ElmRBYjUGQ+Bc5s
	+vTyNJuwrlXIMZQD65qaPV0oXJzncTcuIi+mSG1JQCnUOD2SySFBjezPTpb6t7L0sNqJkH7KFGX
	KycCov4PmMBYS/+5swIrqwWl4tB7uFB17jICjCEbgpAToFw9TAY6b6dI5+n6nXf1kvWF1pjmZHm
	s9rZ28eJmPwv15nRCAGSew5liIBL53RwBONxwLS3FEQopmkx9S7tYGpqGsifHrOwugsFRZp5/IG
	bCMFG+hk71L0wglL+JYaWN+qiEd0/FLMEDmlc0J0Lb4zb45SBZNGn2B3ECGoHPPbbmJGcGJ+rDx
	NdUAAy0Uye4KeNHJ+SMV7Y+EaOD+E9ug0M6LtjzLjeHYdKeyoZqpziL8fHzGJv4U0jx20mwA4hq
	OieuNR8IEuygPMAx//N9SqLYWx1KLtnL9qSb77X/GiNqRu58+lnr8OSHpA74PNyGbmVK8VFnElT
	Wbeu/OlAFxHwEAoGEPj3oWJk79JGXh1ahVjAnIE1+MGEeKk1U4b0pshUR1SZawo0yOmE4HCLqjN
	a5kMZyZ7wc6l8Meo15TsJHKcgZQFYmpv/XvgCv1iDjXfUo7mUdhQk86+82GjRf87PS4c2yqJ7nw
	t2hwOB5dsyxsqb+z/kFP5epyd9+orLrvSYVNamqmzE6418I0AzJpAF3k/rK9YuNHKca7X3oUaSr
	3YSiVto871/Q8A
X-Received: by 2002:a17:906:ee8b:b0:c20:f6d9:d8c7 with SMTP id a640c23a62f3a-c246a6b0db6mr2450731666b.24.1787515057030;
        Sun, 23 Aug 2026 12:57:37 -0700 (PDT)
Received: from Desktop (pd9513a95.dip0.t-ipconnect.de. [217.81.58.149])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8edsm889532666b.6.2026.08.23.12.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:57:36 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: [PATCH v1 3/4] wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
Date: Sun, 23 Aug 2026 21:57:02 +0200
Message-ID: <20260823195703.49198-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260823195703.49198-1-julius@bairaktaris.de>
References: <20260823195703.49198-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_125739_374145_5B06AFB8 
X-CRM114-Status: GOOD (  13.64  )
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

ar->dp.num_tx_pending counts the MSDUs the hardware has not completed
yet, and is used to wait for the transmit path to drain. It is never
shown.

soc_dp_stats can therefore say when the transmit path overflowed - TCL
ring full, misc transmit failures - and not how deep it is at this
instant. The bound those counters report against is the tx descriptor
idr, DP_TX_IDR_SIZE entries per ring, which is large enough that
occupancy rather than exhaustion is what characterises the path under
load.

Print it per radio, beside the failure counters it complements.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb..9dc586b68136 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -714,6 +714,18 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&soc_stats->tx_err.misc_fail));
 
+	/* What the hardware still owes a completion for. The counters above say
+	 * when the transmit path overflowed; none of them says how deep it is.
+	 */
+	len += scnprintf(buf + len, size - len, "\nPending Tx MSDUs:\n");
+	for (i = 0; i < ab->num_radios; i++) {
+		struct ath11k *ar = ab->pdevs[i].ar;
+
+		if (ar)
+			len += scnprintf(buf + len, size - len, "radio%d: %d\n",
+					 i, atomic_read(&ar->dp.num_tx_pending));
+	}
+
 	len += ath11k_debugfs_dump_soc_ring_bp_stats(ab, buf + len, size - len);
 
 	if (len > size)
-- 
2.53.0


