Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC5606A31F
	for <ath11k@archiver.kernel.org>; Tue, 27 Oct 2026 07:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BzBD9SS3;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=MjgCs5yG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OnjgAO2S1SeHeUnZwhglBquHq1CKNVlZfv2BuRKP7G4=; b=BzBD9SS30jSDRl
	dxunA4wyfgWvKO70Dnc36yL6oduRSLpHUXHYf9gtQdSESIOgI44rhabvLa2CxdQwnu1HLdMef4dJO
	FEr3V2uL8h/qxsVszMUU1jLblioScZi98ZQ2GYncKlvhdwaRUwgjUqyLjeTQwNRorX3V65/qVDSRL
	/SqB4OQmm/3QDjHDWY5+LgnQwFYNwigfpyoE3wxMvHOLyPVjWS38JDlFCFLEtcDEtgPAwyyIMWjvc
	vaVzt0u7X6JXupp3vbrmGeceJymLQyPSO46ar4igCoRhAX6UXAak/Y0IqvOeN6McVbi8nOhlwBfox
	MjfaBeDWRkt5mGFd2OVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc2D-00000003xTM-3zuE;
	Tue, 27 Oct 2026 07:55:53 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc2A-00000003xNi-0wE7
	for ath11k@lists.infradead.org;
	Tue, 27 Oct 2026 07:55:52 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so5177316a12.1
        for <ath11k@lists.infradead.org>; Tue, 27 Oct 2026 00:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793087748; x=1793692548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnjgAO2S1SeHeUnZwhglBquHq1CKNVlZfv2BuRKP7G4=;
        b=MjgCs5yGgv/+kIQfakuNJLRY8FxOQgNH1XYQBKetG3zi8/CNH5Q9Z0VRAEVheINwOh
         ye+95uod0bqHZsxVGEaNN4s6gXcY8AKVxB96p+SPWV5NLONVz8HO2RVTNzotghqmbn/1
         vbXeJitWTn5hNhNgw5eYedC8Pntj6f3V4Kg2+JXrqUWAKbISDxVxaVb66KvSs+aMhOT4
         bSTsFXTr3ceHU8YJ/oTqVSJ6Wb8LuqAz7rSOCBedSXiEb6Ef9VnIAHsBFW0VrJtJ6Ytz
         RbpqOIwKek2YPjv7v+0TzoghoDmt0nerR9HX5QJ1EYCRERt5gpv9jOWvEn4sGvg5C0zt
         hprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087748; x=1793692548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OnjgAO2S1SeHeUnZwhglBquHq1CKNVlZfv2BuRKP7G4=;
        b=qorqPdiW+h4M1HoIv1vivOlzY2um+3lyOavSGjvpulttjwm1+NlMCR/GOvbyGv0qVT
         8gVxxuN618irbpK6IgWBWFvCoUxsQlTD5+WPYZGg1sUAz2QAO5iuD7W2SpiWF0+GANU2
         KPt/kz6Jbd86BFs3sqzrsksGpMdOoozxz/cAG7swIR2YSmUHln7dOzmh5ElGXpcVGgBv
         lgyJglosbSz87rU7ZDHVl5f+GwCwN6i5ylDCvKTLkXfzY+acu0d8vB66cnLHD1v6EAjC
         fqaOpTrwJpIjBGJvWamPdBwVX9QCWduhhkEGsswyihgZXUVUmyEC5YD3/4XEmilj7mp+
         j2Ng==
X-Gm-Message-State: AFq9FYKZiPseIDWsjPAa3BJarw+Zc+zDN+74HVidvXkqQAyfPEZUlLDT
	PwL5xp4sjYWoII3DcZ57BAta77sd8mV0+DqNO16OnFtSYVddRht6WDq2dBvzBpQqQA==
X-Gm-Gg: AYBFou1xcoNfGoevVoinELWypsUi29UQXQPR8F7mw2v1RH6m7Hm2VGBJZ4jAW5JVrX7
	B6Uj4r61jpdrdFbJjr7yTqbKaJBzYFST8AG4IhDZSsE8saw2n5WvS2AvzRco+Hl5vmmpxtubAS9
	PAj9LNQ9E/ookRPkrWO0YUzGlHkoVS4voaB3zfeTeWNKEP6+LBZhhFtAOMDWqxyFlRWnDtZAk4t
	fnzayd+evgNrYXajx/FHL3HNQL6iqDlVb35UsFPwqTDUnf2G5uzfYGS/SNp/xapl+4wRUgH855Y
	RQYCubO5iRj818t9x0Nb5v2UwjdqBCQcVF/RHR/Hr0fjpGdyDGPGSiHssL8JY5iDjs7YRiUy+Ut
	8dQQnot5HiGFiz/fS/8FbNOEgoL0zwYNNNPSZ3MpraK9XSQLLEPXDjpcq5gwPcQhGtRql91akYB
	rhWRUvGj/EFCp134b/ydOXCpJIX1kRz1zw+Zfp6BIuhXOOxdqBgstGj9KUgGNq50oTtyvfz4YOI
	UTfTnvHZmeavwWVPWYYOkHL+YDmUpinpM25nvoR1Agkdmhmm/WFaBuHlC0BzhIE4eFyZz4lJo+t
	sIA54T/IU+/jMWkfC4hu1HTSiW+lPHaxquvLDp2l/n76zsx/RFW35dvK+6fxl1Jpo9k6H7wprNj
	gZm+5fVz/rvedwuheSXiaEpUfqxIWSry6KgcsT+CNpq42TkZ9yHRqfaJicnSCD40Uu3Z+kEF+Fi
	yKM7RQVcpGSxO/z1la87YTLPoMzuUu5Pvdk/QAK8eWQ8wqWkr3ZbcHmQGFqtghbZ+ee8ASMtBm8
	5npQE79ItJM641nwvvjrY69nhNOww==
X-Received: by 2002:a05:6402:1502:b0:6b4:2b70:4a7d with SMTP id 4fb4d7f45d1cf-6b443110fbemr6982638a12.40.1793087748266;
        Tue, 27 Oct 2026 00:55:48 -0700 (PDT)
Received: from Desktop (pd9513dae.dip0.t-ipconnect.de. [217.81.61.174])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm4669251a12.19.2026.10.27.00.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:55:47 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Semih Baskan <strst.gs@gmail.com>
Subject: [PATCH ath-next 2/3] wifi: ath11k: ignore regulatory info of phys outside the hw mode
Date: Tue, 27 Oct 2026 08:55:43 +0100
Message-ID: <20261027075544.19144-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027075544.19144-1-julius@bairaktaris.de>
References: <20261027075544.19144-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_005550_323919_A6978DEE 
X-CRM114-Status: GOOD (  13.91  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Semih Baskan <strst.gs@gmail.com>

The firmware sends a regulatory event for every phy it reports, also
for phys the selected hw mode does not use. On the Zyxel NBG7815
(IPQ8074) the firmware advertises DBS with phy_id_map 0x3 and DBS_SBS
with phy_id_map 0x7, and its events always carry num_phy 3. With DBS
selected num_radios is 2, so the event for phy 2 takes the fallback
path in ath11k_reg_handle_chan_list() and hits its WARN_ON(1) each time
the firmware starts:

  WARNING: CPU: 0 PID: 0 at drivers/net/wireless/ath/ath11k/reg.c:828 ath11k_reg_handle_chan_list+0x230/0x2e0 [ath11k]
  ath11k c000000.wifi: failed to process regulatory info -22

There is no radio to apply the rules of an unused phy to, so drop the
event, as the single_pdev_only case already does. A phy ID at or above
the num_phy of the event still goes to the fallback.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Semih Baskan <strst.gs@gmail.com>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/reg.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 1030e119fd903..37be563d8de68 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -910,15 +910,27 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 	if (pdev_idx >= ab->num_radios) {
 		/* Process the event for phy0 only if single_pdev_only
 		 * is true. If pdev_idx is valid but not 0, discard the
-		 * event. Otherwise, it goes to fallback. In either case
+		 * event. The firmware also sends the rules of phys that
+		 * the selected hw mode does not use, discard those too.
+		 * Otherwise, it goes to fallback. In either case
 		 * ath11k_reg_reset_info() needs to be called to avoid
 		 * memory leak issue.
 		 */
+		u8 num_phy = reg_info->num_phy;
+
 		ath11k_reg_reset_info(reg_info);
 
 		if (ab->hw_params.single_pdev_only &&
 		    pdev_idx < ab->hw_params.num_rxdma_per_pdev)
 			return 0;
+
+		if (pdev_idx < num_phy) {
+			ath11k_dbg(ab, ATH11K_DBG_REG,
+				   "ignoring regulatory info of unused phy %d\n",
+				   pdev_idx);
+			return 0;
+		}
+
 		goto fallback;
 	}
 
-- 
2.53.0


