Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B32606A31D
	for <ath11k@archiver.kernel.org>; Tue, 27 Oct 2026 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TBudeJdk;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=nOhYLYkm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n0TwnzTIHDwFQ2i6Elssq13LiQ4D8uWjLOq+Ut0imnI=; b=TBudeJdkhoKUIr
	OWdI5rrOl6nfpHn9vFlI92L3LdVHKIwhNqQ1Gea7yzYcrGfgFWHlP7js7xa9EgbE6P9k/2f8AMnaL
	a8x56s0AdENWJ0G19916YtavIWICo1X6BuTC6zf+rcCDG5+KJCaz8WeM5/5GCm5QJ8mcSoVbo0ODX
	Jg06vJIhxdNO9VfzB6Vlxe0Y7ndkyfkHuINhrgGELNQfz4oQ0FXgfIZ3nXCS5rfH630fdwTtTliHS
	Zzms75CWOdIiqc5Mw/wTeJsiV0LpYVJa2AKr9PT99S+BQm0TTNPgKdoGWgNoiXHt5i5iJrzca0VIC
	HXA/sDW3yEF/E06iv/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc2A-00000003xPe-3fP3;
	Tue, 27 Oct 2026 07:55:50 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc28-00000003xN1-3uPK
	for ath11k@lists.infradead.org;
	Tue, 27 Oct 2026 07:55:50 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c247f6687dcso578141666b.2
        for <ath11k@lists.infradead.org>; Tue, 27 Oct 2026 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793087747; x=1793692547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0TwnzTIHDwFQ2i6Elssq13LiQ4D8uWjLOq+Ut0imnI=;
        b=nOhYLYkm4qTPozl0Mpa05HGmDGF9XG+9OGBXOfp4V3rCNg3f5OOMZvUNyVoctxbwGM
         Ps8jJ+FMFJjAYWCrt0ChFgRPy3o7wNBuJKKLdJjr3HlvMN6+9w55BhJHUdArpOEO4oBv
         lsI88Rdc98gWaxoVokYwC3Z7grSW+cPXSFgutbzrQ+kM+tIDO8CrL578LRP/qt+KZ/El
         Ui8ZkZLb0zDLIJclR16u8XYuu/4CMJna98k/Kkf9y/kj67zP13wzzXfo8Zx15dhrVOrX
         KoClxRX/UbLBIGhHfyhhnSJDu/JiReKITVCxBDmQpk3BcscU2HD3V2AOLjw5gxVAluca
         y0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087747; x=1793692547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0TwnzTIHDwFQ2i6Elssq13LiQ4D8uWjLOq+Ut0imnI=;
        b=FcV2XU2et2MjuwPxgbLOirxlJIfIr0J+vmJHqhVMqdwzOz0CqAcXLzHfrFTP74wQTc
         dh7F/3vNiqem/hQf1/dMot4pd/d1febHEJwvUF9iIjX8CCbAhfi4880Wn4yktMwl6uwc
         AZOHKilbpPcyYk48zUM+HbCMLpxa5n2WwYw0WOqn+KmuJmNObvZMSerUIUqK7+3OdEt3
         jokA9ma2pvSlJ3QyTzEyp+cE5U7xQIco6VGvSW8iXJAHfOCV4hKwrZynncEC7F37Dr51
         UEbFnLHwxMlrumn3RnrLdTHS8/3sF/b96M3ygxr39nO2SVpibcpxpBHY8rdOqOIgGOkO
         e6aA==
X-Gm-Message-State: AFq9FYIeeEApiyF2PvGIK2bre93wKwDmBt78rn6HvUYV0Z25Y58S6I9R
	a/JgnpTBEeeO8Lit0rVkEX8auzJlXqszPtl7UAkGCH6la52p+1FDBOKQberQI7+U3iTaf9sAvY5
	NWV03xNpe
X-Gm-Gg: AYBFou39tV0jcK+4aOBNmdlMcVM8M8KOXZ87UV3xtvYNRxWVXgoDa+VI9997CvllqrZ
	NLlYSCESaT9A3XGWb+lbjgsXTok0grmoSSnp87oTBBFlXd0wEzHeZYTv0IBuFmpA7pRQskkYhLC
	6UXd/Zh20Z41zBUCfgXEOPhOlbDJMdairqS7Tf21hTBVoGmFJky23CxEOuXWkpY6WrXnYCTVDnX
	AGXT4hKQRx5JOa6uBDiMTkMXK6bnmBSB2Xi13MmdH2H1bwya7yqD973ExtR6QAT+mq9sEx5LaJJ
	zX5nOi12p1THKruhhpyjwn2La45p0NdD9YtllLy4gRcVv+y+77PQ8T+CXlS9BfdL4YbyEibY8Tu
	ljr5F/v4LtzeuE5rpB2ckMUeQ1kaCPF57Jy7NGKxr55QSd2FALF7HswuGM3aaxXzLOj26FsJb5C
	w3SfT6E9Evx76uzjsVdQQgiQq7GoDDZUvayMeF1TIPxu/gXAomH6F2OhJ8rFaulXQqO6w10ntNM
	JtMxMOtdlaaWBA/BtlftSx6wvpzq4sEo3Jx2ZlSxTTZzXWiK0dNrjuWqu4G5sPO3cezP+kEmTe2
	tWfzo+FWYdRxzwZJpdJ3FDGRLsLze5YK2Ew83n2Ljs9CxdjW8XAMCyNpS2xUBMN03D3r7/XpdS3
	CVM2ylFG7ybIeQOaPDmq7uognjzLbOPGHGAUWHaHJ10Bd7pmPL0lkiF+IRi7+cMmOfd51dNbK66
	Ar8WViRIVPeU/2YE46Z2UZyFvESY+ly6yvoSKSPIzdlaw9/hY9eM0oPObng7wv6GcFQTVvGACI4
	6xuYyeE
X-Received: by 2002:a17:906:ee82:b0:c32:414:b72c with SMTP id a640c23a62f3a-c46bde461b5mr926740066b.45.1793087746615;
        Tue, 27 Oct 2026 00:55:46 -0700 (PDT)
Received: from Desktop (pd9513dae.dip0.t-ipconnect.de. [217.81.61.174])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm4669251a12.19.2026.10.27.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:55:45 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Semih Baskan <strst.gs@gmail.com>
Subject: [PATCH ath-next 1/3] wifi: ath11k: skip unknown hardware modes
Date: Tue, 27 Oct 2026 08:55:42 +0100
Message-ID: <20261027075544.19144-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027075544.19144-1-julius@bairaktaris.de>
References: <20261027075544.19144-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_005548_988911_594CFAC2 
X-CRM114-Status: GOOD (  11.26  )
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

ath11k_wmi_tlv_hw_mode_caps() indexes ath11k_hw_mode_pri_map[] with the
hw_mode_id the firmware reports, without a range check. A firmware or
board data file that reports a mode above WMI_HOST_HW_MODE_MAX reads
past the end of the array, and the result decides whether that mode
becomes the preferred one. Skip every mode from WMI_HOST_HW_MODE_MAX up,
as ath12k does since commit 1e9b1363e2de ("wifi: ath12k: avoid array
overflow of hw mode for preferred_hw_mode").

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed9e7..b3c778eb15876 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4776,17 +4776,19 @@ static int ath11k_wmi_tlv_hw_mode_caps(struct ath11k_base *soc,
 		return ret;
 	}
 
-	i = 0;
-	while (i < svc_rdy_ext->n_hw_mode_caps) {
+	for (i = 0; i < svc_rdy_ext->n_hw_mode_caps; i++) {
 		hw_mode_caps = &svc_rdy_ext->hw_mode_caps[i];
 		mode = hw_mode_caps->hw_mode_id;
+
+		if (mode >= WMI_HOST_HW_MODE_MAX)
+			continue;
+
 		pref = soc->wmi_ab.preferred_hw_mode;
 
 		if (ath11k_hw_mode_pri_map[mode] < ath11k_hw_mode_pri_map[pref]) {
 			svc_rdy_ext->pref_hw_mode_caps = *hw_mode_caps;
 			soc->wmi_ab.preferred_hw_mode = mode;
 		}
-		i++;
 	}
 
 	ath11k_dbg(soc, ATH11K_DBG_WMI, "preferred_hw_mode:%d\n",
-- 
2.53.0


