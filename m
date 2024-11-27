Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08F0D6ACE1
	for <ath11k@archiver.kernel.org>; Wed, 27 Nov 2024 14:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTFIHkewMEaROQgyzcIc2iMfdAKBZdNTPyDszGdNlRo=; b=lWe8twM9DpeuPHgyLRaT/lg8kd
	Qz05W9pwSKULrP8tI2H7QPwWA1PXgu3jgMRpVBQTFLPKXT4lqaY3we2tWe/X7f5aAgt2Aa0RtOVtw
	gLAcCd5p/Knj3ZTn0Gh9GCXFKClB8v4nblPZa7VjzUBlfKhvVKr+e96obzeYIhL+bXwNbSH7zM0As
	ejb1eRVg8VAjCiR8l9ZMNTsqJAZwq/jdpe8teBHHw2e+lbHrDPeWoEd5nfhQAki1m6kTl52nsfhUj
	edd6bYLq/iIQSuWTbYzvc1KbprLXDUZx3j4OpJrJHkPjP85PTERUt5uqqYrgDyh5/9SZnE5/BH+vA
	bnpqlvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJEp-0000000DObE-19cO;
	Wed, 27 Nov 2024 14:41:55 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJC8-0000000DO9V-3P8k
	for ath11k@lists.infradead.org;
	Wed, 27 Nov 2024 14:39:10 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7248c1849bdso6894822b3a.3
        for <ath11k@lists.infradead.org>; Wed, 27 Nov 2024 06:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732718348; x=1733323148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTFIHkewMEaROQgyzcIc2iMfdAKBZdNTPyDszGdNlRo=;
        b=Xvc6Gp7E093UTipsPl7HdJ+9n2edkV8BAbs0Mq1Z78GEKs37SvzTQfnZeUQM3d6i9o
         t2GbXwf5SKowiwQ060eVifp1e0PpG8e6jSLYLWza5k/Y2mEII4LJydJ5EcGjBdo/HzRw
         ktZr/SastqiGFBIq3wsK5WLkpHaIxOkxp8xd+MRcfWh+uGnSepuKKJRjYnJJn6nFFjLp
         LTBoUofpaeqNdDubKRoHh9aO4PyFddH7slX5QDjr3BBS9wnqk/pgBKsmM1ajorJ+OOHK
         0GvkwpOvtPELmNhjzPyDXpe8E4R9hDWcmsIhkz2MjXe4Mz/tDKb1RJ6MrhYgXSxb+QXe
         0lXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732718348; x=1733323148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTFIHkewMEaROQgyzcIc2iMfdAKBZdNTPyDszGdNlRo=;
        b=mOAIKEM7aPBiJQVJolHIBdv9BJF+8GH4ZEfyTccf56T38lvEwPMQN9qJrEKXJSg13/
         QTbFw+mwJdWedDFZozrIogI2zZP3t6dXFFlp5QiAUvZVP8Ar43+eWQvUpcgaiUk6327p
         CVZ1WpziTRTQttmdolqZSd3gOy3RLrN4556jqounIi+D3yeZMWl9iTD27DKs4I0n2o6z
         jsBmEmOvYL9WRuJQHPYVYK2hPlUTmgOBXBuXZ7YIkIWlLeSBU0O6USvOKObXokIs5PC9
         6sqVttKTyJW45EEFawiaf36+Ze6O3Mrd5Ldw5Gm/txAEip9Hdbdd2a8tbGpJ50738MP6
         0QDw==
X-Gm-Message-State: AOJu0YyDzzm6lpixzMKJDkLTBhxOZZzKyFjNwVUHL2z9Ca4tCzd7LO8q
	Mct148If29QThutWk6hcLN1TbA1wetLGGizoqgk4rz2qOm221FoO
X-Gm-Gg: ASbGncv1UoJO/fb1P7sYLUcGeerKoTigFtiMIUJrGutD2oG82FfnepRFtrhpO2GGpkB
	FlAYJQm+MSh550cHlUtd9wesGN0OmojmzUHtO3zj4eLUt1+t+CvMe1/2WfFMvbfRYR4TB32mCin
	PxRVezOqK6+Q2vf4kLkM2NwozyIAUAIN9903vfMesf32Tst2HUYIOn+e/GY7Cp33JNmVIVWj6k7
	j8WG5k4gDXkyEAqozPP08T1ZvoZS3oyRq4bj39rGfOHIrLTpvOaVP41/6o=
X-Google-Smtp-Source: AGHT+IEXUD2cpVkmiuKSnu34vZ5p7LGeLXhOUINW5LByyCy0AAGXpoRkp3T+IjRRZa6bkvRWJ0H7oQ==
X-Received: by 2002:a05:6a00:b81:b0:724:fac6:35f2 with SMTP id d2e1a72fcca58-725300107f4mr3650429b3a.9.1732718347283;
        Wed, 27 Nov 2024 06:39:07 -0800 (PST)
Received: from localhost.localdomain ([223.72.121.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de456472sm10283606b3a.14.2024.11.27.06.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 06:39:06 -0800 (PST)
From: Baichuan Qi <zghbqbc@gmail.com>
To: markus.elfring@web.de
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	zghbqbc@gmail.com
Subject: [PATCH v5] wifi: ath11k: Fix NULL pointer check in ath11k_ce_rx_post_pipe()
Date: Wed, 27 Nov 2024 22:38:04 +0800
Message-Id: <20241127143804.30075-1-zghbqbc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <30b208e0-55a2-400f-9638-1765e7ed3bfa@web.de>
References: <30b208e0-55a2-400f-9638-1765e7ed3bfa@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_063908_848699_AFB53A7F 
X-CRM114-Status: GOOD (  12.34  )
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

Current implementation of `ath11k_ce_rx_post_pipe()` checks for
NON-NULL of either `dest_ring` or `status_ring` using an OR (||).
Both rings, especially `dest_ring`, should be ensured to be
NON-NULL in this function.

If only one of the rings is valid, such as `dest_ring` is NULL
and `status_ring` is NON-NULL, the OR (||) check would not stop
`ath11k_ce_rx_post_pipe()`, the subsequent call to
`ath11k_ce_rx_buf_enqueue_pipe()` will access the NULL pointer,
resulting in a driver crash.

Fix the NON-NULL check by changing the OR (||) to AND (&&),
and return an error code `-EIO` to indicate
`ath11k_ce_rx_post_pipe()` is stopped with an NULL pointer 
error, ensuring that the function only proceeds when both 
`dest_ring` and `status_ring` are NON-NULL.

Link: https://lore.kernel.org/ath11k/a9ccc947-20b2-4322-84e5-c96aaa604e63@web.de
Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Baichuan Qi <zghbqbc@gmail.com>
---
V4 -> V5: add err code in NULL check
V3 -> V4: reorder describe info
V2 -> V3: add Link URL to mailing list archives
V1 -> V2: rewrite commit message and fix tag

 drivers/net/wireless/ath/ath11k/ce.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index e66e86bdec20..223dab928453 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -324,8 +324,10 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
 	dma_addr_t paddr;
 	int ret = 0;
 
-	if (!(pipe->dest_ring || pipe->status_ring))
-		return 0;
+	if (!(pipe->dest_ring && pipe->status_ring)) {
+		ret = -EIO;
+		return ret;
+	}
 
 	spin_lock_bh(&ab->ce.ce_lock);
 	while (pipe->rx_buf_needed) {
-- 
2.34.1


