Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E03606A687
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VxFlF4En;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TB17o/ce
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=; b=VxFlF4EnlYDXRl
	Ulz8iloi7kbeumd5hZzVZnPvcUVV93dYDpqQS4SIAInwliWwsWaTumIgjDNwqRO3VRcxI+ioqcej/
	66oR4KfIjY0hu0MvkMyM1I7kDb6k9SFdTuWZvlATo2u4ZOqPI+5s4zObqItbKz0SW4vGQdjHBGZIg
	i4DSS7c+c4I27O4nm6qSid7xsj3+2Zfx/pd162Wd3vEgIuGhIDNLK3ZeVbrvJMo1z034LG1L4IXLv
	JinJ9HkYmNU85ONfgcOXWz73nKbhN8FtU98s0aSi0KTcCM6jFo/Tv5tmkCLtlcXHKckwdGaFsH9Qf
	WFVi4gOGzbXCpymTmS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtq-00000000wRw-24mX;
	Sat, 28 Nov 2026 16:03:42 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtl-00000000wJ2-2X20
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1498313166b.3
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881816; x=1796486616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=;
        b=TB17o/ceUvjX5BSbP2iqR1sHm2RGuv8rjIYrjlm0kkEuNo2qMT9YPaw9g80kekIUn8
         ftYvmpjXwOUzn0pjpMrazxkJBNv31VDA912FuaXKWjB7rX/rcu7endoIbm+NyzeylSxB
         bZUR6jlCcPWCSUpuepFdFaLZ9OMC7qbHxihfsbcKRwnRK6TC7xFku/oTGpIrYOmBKvaB
         GfjlUngUfOSGfjJZ9OD6D0upCfaqf25QY2Ugl6c4vQNJGSUxl4VVU8KauhzgH8xRfnD/
         /0lK/Y2ajyNs6KQd/K0NSEURkXcF8517OEeNwbMVISRxGfXoDXagO6C8dsPznd0t+6dt
         iK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881816; x=1796486616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=;
        b=b+XS1c8UHo/KY+xakxpnpQb6YVo2AxxTaEFijMfMF9zNUx7S/rIVBFBLvmYtkvuJcR
         KzDCe37004aSpxUEIcQ14PBWJN4s+JiYW3ww8rIkMHtnKMweQGvY4uPl2PvnQUSA9heZ
         57DcIGOt9f9d0MPHvtzUEkS1KYKs8ehs1ChCD9aOSzwRb9DgMcEHAIw6cdaVdGQJVCOe
         f1kXXNRR4uWpfbNcam4wfL1QK2ep0usRmDxHrH+XpUwWWK9/ripzfVPUTCOPgJZL/Gkd
         MBEzzo/GXJL72ZAZ2sEgA8+2F3WYxL5ufui6WPDnBDE2Ow7Ik1nalVe9APyZcgM/iAHF
         oINw==
X-Forwarded-Encrypted: i=1; AL+hErH4NKvKaKHgZNzvoCPTNpOVYgdzBgz5k5MvyFZaTThQtI5pH3ZG9JChehVsTf5NNkuaGwK4tSM=@lists.infradead.org
X-Gm-Message-State: APuU4Z/ALqRCM3fOFQpn0NLAjEoGvmX0D7KQOvuPx8oJhKx70/el01N1
	Mfr/bMMHxS7ny5Z8NOJKyAmj2WuHvrU1N7U72ZheTfsJQzwk1gZY+xxYggaNDBVhtA==
X-Gm-Gg: AZFdTZdghGQ4BDrwi/GLLeOgZIlKv9lA5okb/PLEPS2I9MOn22AWKyoiiSxJ22R+IB2
	9NAafs5bpKaIgqXW3FruLb2yvDtrB9g7g5PBE9kOX7AH3SBZvEg23wl3aXv5pNmCyaUEsO4ueA8
	cYLBId8DWbIbjvDWnYFETR9g6P3ABCkKMO7/Zq3u17dNlG58y+Kcjgak4Pu5IettPjt15G/cSVR
	znKlm1rnNJscwdLkD2GNVoOB71iIYxY1AhsXCNmcBmNuU3zP5fHyqe9/ZIYcmOCAFx9AD0LnZIB
	u7ksS683PhkuApOHmWIgvkRIFKTNZGFtOvsjmci/LzXjwlSV6o4PbG33umQExz91A3koVD8dun1
	HRojTzgu60FYNq8Th36m7CmL7/WKaL8klIND65R3QNqqQw299ioBu7ywL3THvPNbrmpmTHGEvUN
	+g6BxN0x5sa2VBJRv4jUrjqvqHAeHStMLGvu0Zb1VoGl2OiEWTNXDc5VlS/018JCS4l0UmcTa/y
	EPiwPSGsipor1lw3mk4/btSgGSw6kUc5YzEYujV577hVKZJCREiSohNWNtzZSRJasVDgga0e/3t
	IExlA/KJy4ww/6doPe/XLrWBiFzfBx/O+sR95vs+FoF1dzVyJPI38ze/9nPv44dNikGhfuFzVFk
	cnoWSdW8zpQs1jQflekdqHUt58Z6jg5qyCsYtvdUEATI6dnDk7ODZrVe+HHb665GM06c4cPHGbZ
	cvr0fSDv6wcUVaUTknHB656igEQpCLvn0aA66SlwoUTXp2oQAzBD2Cgwsnuz3kUiyyJ5fclQr0m
	9iRhakzsJSOgC78sB7pUvqQ9c51fSGnYEuTWvg8svDumGJVTSmXPS+IaHJORwyBdiUN/rmBH7p5
	IIhTRotwwJ3USMyW+W8x83kOFuLDfmij32s=
X-Received: by 2002:a17:906:27cb:b0:c51:3acc:9f86 with SMTP id a640c23a62f3a-c513acca092mr1932323666b.39.1795881815705;
        Sat, 28 Nov 2026 08:03:35 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:35 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 3/7] wifi: mac80211: clamp the AQL airtime estimate before narrowing it
Date: Sat, 28 Nov 2026 17:03:31 +0100
Message-ID: <20261128160335.1815537-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080337_673619_D91F5917 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ieee80211_info_set_tx_time_est() takes the estimate as u16 and clamps it
to 4095 us, but ieee80211_tx_dequeue() passes a u32. An estimate of
65536 us or more loses its upper bits before the clamp: 65540 us is
charged as 4 us.

Take the estimate as u32.

Found by an LLM review (Claude) of the airtime code.

Fixes: 7a89233ac504 ("mac80211: Use Airtime-based Queue Limits (AQL) on packet dequeue")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New.

 include/net/mac80211.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index f768ef9184eb..ba16096fea3a 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1425,12 +1425,12 @@ struct ieee80211_tx_info {
 };
 
 static inline u16
-ieee80211_info_set_tx_time_est(struct ieee80211_tx_info *info, u16 tx_time_est)
+ieee80211_info_set_tx_time_est(struct ieee80211_tx_info *info, u32 tx_time_est)
 {
 	/* We only have 10 bits in tx_time_est, so store airtime
 	 * in increments of 4us and clamp the maximum to 2**12-1
 	 */
-	info->tx_time_est = min_t(u16, tx_time_est, 4095) >> 2;
+	info->tx_time_est = min_t(u32, tx_time_est, 4095) >> 2;
 	return info->tx_time_est << 2;
 }
 
-- 
2.53.0


