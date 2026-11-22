Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF86606A6AC
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3+2XT9v2;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XB4BYZXA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BeVtOudt3OEvEUEKgjiMRbOe+We3cpRPoFjUKgGxA3o=; b=3+2XT9v2sJXcqR
	IOT1cJ3rnbUHbWgH0eXM+jxH0qEsexzaa+7yMvBncOruFHk8dG5mjKtLSwiyovqxawgpa3WThVgoc
	TZM7vkdceuKP42/5KCIqMJrqvEaRu7qrFFzZniKcHIhoz19IjwLzqVn9S2R4QyKo2qgqjGPdog77v
	XvPdXYHkufhVqUwnTgUhhdlwzZoQdUe3MUVzxgJCYzBzSBUibO2ZWdkwEARM7sBszKYcetpOzQvz/
	2j0JLEQiGNAZyiR49zgDxAK/q+6LF+R6NPkls/Q5rcxVzbfoaJ8nIyiBBcdXOBOPUDoYfDDr9MHgz
	KxoI1wYssVRh/qvvGsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2Z-00000001UF3-3sDA;
	Sun, 22 Nov 2026 18:11:51 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2W-00000001UCn-0QMm
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:11:50 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso359032466b.3
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371106; x=1795975906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeVtOudt3OEvEUEKgjiMRbOe+We3cpRPoFjUKgGxA3o=;
        b=XB4BYZXAjEkLbkHSCp4aR+omRN51sszLu9JY7fKgufvU2Zxl8I/W86Agn+avDech/7
         SfD7LoQoIJKhRLNm+9y3mBpktsDZ9ldMssOBzHcorOMxhnwjko/Wown211S6iVbP92de
         itk/IjNh3fsT4vimKrppveT5BShqIwK+vGGiHTWJXcTUKwpmyZoMg72GzavdLBb0cisy
         iN84NBI8/TPpBfGOXAs9iKcFSRmf0+5XA7+8FPQ5bMWINNwIuX6gPVpfdf3kxaCpqCEB
         ihrQlWh3yqsNHZT13I0vt7cOl1Xv5aHbWxNlt+wSaJV0dm9cAaFxNzIItnKN4sL9ehEx
         bR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371106; x=1795975906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BeVtOudt3OEvEUEKgjiMRbOe+We3cpRPoFjUKgGxA3o=;
        b=XTDJPo9l8HFodSUnsNLblJ2R28IV+qHGJRAo3edobdoARnNIs0DgaHvCtUBKw80vff
         48+rTaxVDJYyxVVjuJ4Rhd/EoaZCXVPi47/AJltvPvIFmORUdGCdYIXcXFtRrQ0LC4FI
         RgwDNUW3EpHzzgaW6ToDsfsNkiJ9OgMd0cHsuIXPmJYHk2vQ9tnBKSO89iE6/O21WWkd
         4XnQHPyToLnFqVve/gb9m+J9wLB5aQnJl7uzCLgQagAf9JZ9Aqr/vuKPWB/tqMndn8Cx
         nfF3t4yUoaLAyqUfH0MvFseux55/BzjTUjQKHBpN9fYw0uf7v2/XXrSWZFEJTJe6+/Wp
         Nllg==
X-Forwarded-Encrypted: i=1; AL+hErFlFGAppu0vPjIC++BOyrspSoiNuOzWDTMqfM2me2NMBCVkLHhgFu8XNqxDsd60pUx8quR3098=@lists.infradead.org
X-Gm-Message-State: APuU4Z/4w/0q1NSUQjcvq2Tpu9A7HLFlZDwl9PRQny6Rb2HtV3vkEt3R
	SpvNRPpj8rkbNUAjqvB3BjGBHf7ubjLLlZBeZxZFKPuMUOipGaDYRQAuWnLVvDVFEw==
X-Gm-Gg: AZFdTZfqPM3oCkkuSMAzGDXZx+TC0Jl+lX1pXCtnzeDf3PxSnBNK7vOy0wfbsKc30Sn
	YZwq1mmmNWaOTv8InUY2px1mcdTwb2EmjXpWSaV8LGfzFUsFZ8iR90GHAZviHaK4BW0xj+crThG
	O9ZD2BfK1+lswWFBSErU1uk+tc0nRble5J//QaL0wdje/16Cpr/zBnMiHQEBSxir2XQmv5IeCMt
	L4rQpRy0rp/wu6UGb6t1vfV1/R5jQhPHTEGIQ+XMbztb3AzqAy+Dlx7U7rTlhuTljb5qrnQKB9v
	r2Bi4lO1fZQpGnfB6609cFEZR7RKh5bZ8h7qfQne4L9PkKph1nmTGgt/QFUUqzV1yZHqdsZFNWP
	yXKGvsTR6CAXwJJeT+9YQixwVp8KK8D46MUo9iueaQ98R346nAxCEazFm+zB7UevZ51SD1QEuw3
	IBPP3QeJylemC5GW/qltjaFYoS12xn8NyCYiN7BNcgWNeg2bfdkz0obNhAtUbc/h07b0vJThTKM
	Xy18eGMavHMRuKX7N6+zMuhMrqCweL4p+bqUqEExxRK8HVZZLYYf2iQKO0YN9NEf/OI434bu5kX
	aAMyGYmKmhZjiEE1AR8pYkIt5qRouWVIGHwNdNrffu/KY0hBZMP/d20xVarBt6wMHT94psUutcW
	cn21O8EIxcU86uYOExrfcolVfqTotZDFucMc2HG6QwULGEEhy4+GYCuycrzNakqj1YgbmqzgCHl
	8l8pmDLuZRix1/kfnfSwzX8m0WimJos0GfkfPV4BPkwcbU3Z74kWOMopnnosLl68uQTDIJdgRZ/
	GHBl+ZDDmmodKGYElO3DLZFlS3j17sjazqoLciODsj8ql449Ha9kaAsVMz8j53Dhm8QKxUs8JNg
	PwYQo6SfzEBBRx0n9PPQCQcI2XdaUOYdjzi1Licz67r1uYCdM+WtI3qO7aob6eU7UNPsMGj9
X-Received: by 2002:a17:907:6091:b0:c51:51f7:c9e3 with SMTP id a640c23a62f3a-c5151f7fd77mr472909966b.34.1795371106268;
        Sun, 22 Nov 2026 10:11:46 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:45 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 3/9] wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
Date: Sun, 22 Nov 2026 19:11:39 +0100
Message-ID: <20261122181145.1015729-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101148_156296_634B222B 
X-CRM114-Status: GOOD (  10.50  )
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

Nothing shows ar->dp.num_tx_pending, the MSDUs the hardware has not
completed. Print it per radio in soc_dp_stats. Divided into the pending
airtime in a station's aql file, it gives the airtime AQL charges per
MSDU.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb9..ffe1f466aefb6 100644
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


