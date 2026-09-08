Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16083C79FAE
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+9FqYSQ2L7Zu1nAHB7ZI+rj9iphBqw0F7t6xJ4R1Qs=; b=IKo4d4mBFo4gYEdtMa9GcDbKTs
	7HUfg5wXru34E2pVBhY+eNMr/+lpRDSqHGazMLy9ByXGG3oHg9Xc1z1YBUIkgjykh16rPr2nmoSNZ
	iza3BOVHwWjdiw9GqhkGXwFAkw6zjntv0QzGZNfzs8iuHOOabXJyShnrqdB6o2nM/St8ZrA6aOgOh
	ZObiVOFhnOWlm9xglUjdYBe/Oh5ADzU52OS1vpXaEyLevK3m6BxX4R+T8urMuOKbbhmnprGQtHpun
	IaToogTk3EpsloG+FQM/aBy8KNK25EncqFs81ABE+xYRmFFD3U4F26NpCsfgjlrViRQHwwPVR4Aps
	VpsVy8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGT-00000009Bs1-0RMv;
	Tue, 08 Sep 2026 13:53:33 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGK-00000009Bgt-2hIM
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:31 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f8694aeso88652766b.0
        for <ath11k@lists.infradead.org>; Tue, 08 Sep 2026 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875603; x=1789480403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+9FqYSQ2L7Zu1nAHB7ZI+rj9iphBqw0F7t6xJ4R1Qs=;
        b=Qmol07l4NpM6VqTpBxZ8bQONHPXLuC1CtbOzoY5Kq8iU3lMBRasxnAkXpo4/R0DHHV
         5MKts0RbBvFp80zVgvS1seuepMU2Rna2YAb3O/MLjePCrols9EuZDqhqlhHeK7UOJvqh
         GWZ0OpJ7XbGDNcXnRF1vMGa9azgAyhCbTZLTPJyuL/jXiDHD1MUNtCEF+hCB4JxJnPGk
         bC5qnWlum2Y1HyBJ0V3Rc6PqhwOuyccSSNsnYvUzRByLnRdWWbTa/NtpHqiftfwgHopy
         CDi+IAcMm5mwoETBh3s9RuWn3A7hTHvxQiPMeJ2j0bdUCv+GkXCFsfgxwU5otSHGVXwr
         li+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875603; x=1789480403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R+9FqYSQ2L7Zu1nAHB7ZI+rj9iphBqw0F7t6xJ4R1Qs=;
        b=MNY6ezyokD95Ty3dZ05De+WJlGlNzykjPo5HRpbc0uR9SKXTbuyIL/EzuvcJNLPdBE
         Y1DmA+tHdfzy3FhkSDeFkahU/pYJAEe45iQUG2zLw0qVztkXXU5oV0ORjE+KGkr4LdGX
         uPPzRLCDU5KryzcwMaR5c338dWLQVryv9HG3wTJwJrYB2GfW1S5+2eKENaEFiMjGhcKz
         kHuvsE6LpqzJR3nFe52hIrPKGs+LIJC7vpiL+XkUDpAaNB9WCX8khFH1idXJ5CBf7ZiC
         oYbeGNxC/p7RpTIB+hPkXtS7J2hpxC1JFirz0DxkS3zQjQKXECrrUz3QxodNcYsUpXw8
         qSVA==
X-Forwarded-Encrypted: i=1; AKwUvBwPxjqF76p8PLiaup7zGHtsrNAKP8obAwdXbmfVY2EeY558PoRD9vSzw7H+b9IMz6rqtGZmaQI=@lists.infradead.org
X-Gm-Message-State: AFuF++ltrj7eYmYBdcmutfa7hyua0RFhbXu9h9JqXGWblPrTzfgNS+Wb
	H5r/QlD/t7YKyzWxV+NrIGW9YZxDNKiWdTdX7RMh5I4EaeY48rIh+euDgLXDA59kRg==
X-Gm-Gg: AYBFou3QehkBZKsrOX9rPvgRV9qYWCOA6sVYZR72c0HvVbe1XsNlAWEElB1OjGrQL1O
	hbY5ZUPP1rG9o7Q+RGq+6rmZvPZsxdq9Jf+Mp9hdGttF9MahrtwXip3HNcXqAI34YOtaP72Xus4
	e4+XKxITd/B6v1Xbk+f6t7ZmkeL9aVNGEK95Q+oRGETXTr6Zdkt2KIVFxHZR8k8sqYBtFOOU74z
	jt/neO9V2KeCMFyjPXbJTNCw9uvvkBERRov+5b+tgejB4rtoeEOLBhqPmOZ7byl9XeR68SNIAX7
	/DNhVZeeeved5gwq5mKmHvfOxk7XqsY5l7UBBvNwXfMivtnpk9bT3zInCHRHEYSbA7huwj3BbS+
	8mfPSSHpWrWd1sFRTLlWl2Cwu/bdg55cmS8ZMNBN6oR4yFmpwQASR1dkvYT+pz2LBb/xynkNGFu
	8A+nc0fRA50kwYLY/XDmWVFIIBV0z7foPKash+nu74z7YNtWDfGU+AFDQc+QqaqJpv44RchLBJd
	wqowuEYQeM+V6l9lTYD34ulN+oNnz8fg58/g2jMdAUUcll6xE2nxuaD645oecPZiGlBFF1dqVCs
	SP53XU1jeALBd+hQTy14+33oQUi+v47KxjkTlyMAkJlduuCuRxIuZQHJnWRcU89Myc+OwfcZJUk
	1IH0fiPgWLyMoiBu5tlNebu2dJOqkV3xiJ/srzl4UBmPkze8Oa2YYRndX63E/y0GDkX8IZRBeHU
	+OxPyXe/JyuGkQ
X-Received: by 2002:a17:907:930c:b0:c25:f7db:4bee with SMTP id a640c23a62f3a-c29044f2780mr326114266b.20.1788875602673;
        Tue, 08 Sep 2026 06:53:22 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:22 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 3/9] wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
Date: Tue,  8 Sep 2026 15:53:12 +0200
Message-ID: <20260908135319.754140-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_065328_478240_FB0167DB 
X-CRM114-Status: GOOD (  13.55  )
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

soc_dp_stats can therefore say when the transmit path overflowed - TCL ring
full, misc transmit failures - and not how deep it is at this instant. The
count added here is bounded by the tx descriptor idr, one entry short of
DP_TX_IDR_SIZE per ring, which is large enough that occupancy rather than
exhaustion is what characterises the path under load.

Print it per radio, beside the failure counters it complements.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb..ffe1f466aefb 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -714,6 +714,16 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&soc_stats->tx_err.misc_fail));
 
+	/* Descriptors the hardware has not completed. */
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


