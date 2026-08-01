Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73705C55172
	for <ath11k@archiver.kernel.org>; Sat,  1 Aug 2026 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y/htim8H+8x9oNbHl26vDUAIesN+LBlNBvkdejEDGrc=; b=cTJozdzxmXuvti0gxYToMjy8vZ
	vnSaF0zeAq2QzkwXrYOr/hw4flsDE07A3VrLU6wuax4Pwz6tbQ2lRSTK5oafMVlxLUYXPy0YcJxRw
	YsBEzoAj6Wfa8xRcZN2DlrsBmFoDYA5b1fOucYIo1QpVUY/V1CCQl+sgg5aoJtFFTKp7TwtphJDxN
	u6+sg1ERKcBkdtWkR3g168kQ2qflPxo1Ev6jJM+J1FOTCkiAim2jNJVxIAfagC8s4MpyigjUdpHeh
	BvcuHn9KN266icF1ITgBhPn+Mq9xxkmfe99aeZL+gIL3yFMtIOYK+i7tFZ0IkYK2cOu+8SSHGqR7D
	yqeGGS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq8DU-0000000EIE5-1krd;
	Sat, 01 Aug 2026 11:49:24 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq8DR-0000000EIDR-2SGa
	for ath11k@lists.infradead.org;
	Sat, 01 Aug 2026 11:49:23 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cc61541f8cso30868455ad.0
        for <ath11k@lists.infradead.org>; Sat, 01 Aug 2026 04:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1785584960; x=1786189760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/htim8H+8x9oNbHl26vDUAIesN+LBlNBvkdejEDGrc=;
        b=WToWFSZbwu5TUXxYcOF57EYfe92rWHY+ZjB4I6+uvNAPHmKRPCG56M4ItOZhNVGGzf
         9LrBuBNeEEyKYOrZarXtciZpdgq4ecD+XaLma0ZOwDFIYKL2HC7SWZ6va3n3w4okk031
         4P3bN0pzqZVeYdPcn+O51zWijeA8X0iJ/fMqoYBKWizbYKhqHCgFa+ZQUPB85ChI1Opz
         PwQrlVyz744Gkb4ZPG+OUS33N0QN5OT5IHzwWQs53JVBTs2fNaPKOIM2Eg2Q4W4TYvEu
         All2HuSN7yOa4p/O8aXqOldTEw1gmT9DZZY2ssSflQ7K32beE988XDpTeTRFtq3zxywI
         qpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785584960; x=1786189760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/htim8H+8x9oNbHl26vDUAIesN+LBlNBvkdejEDGrc=;
        b=cokllk4Fz+FY+ojbE6jVqvwj7OV8rHrPeZuPXktLiPnGjtwJXuvTNweJKnJgjMMyfs
         3zWlngr00/p49Rks31B0qSQZ3tt7b+jfopOJLVRYOvoq3XgyTv0r24oRGsyKxYbxKVB2
         oMaA+/LDJDzubvjLjE1LmvkGjMudo1Wy3ESG2pJ/4Ykh53zURxryaV5i8KMw5FaGbEBC
         DoUJCJGde3w9hdPoLO+Kf1HN+SyQaq0xv5pP4GCn0fz3w810Zs+fgGiLMJw7eB+F0G7b
         lIZ8iRvqoW3CsZlgjE/RnY9Ef9fm6UZhFTViyJ1UDha5BzL+1AwpdG2hM3OPj+8gxCF4
         DWpg==
X-Forwarded-Encrypted: i=1; AHgh+Rpe8SAjmH/q3pJU1JD5aGMp0+yrZtqKP/wVgvXoe7M2TGWUQLq5ZEkdZ3CAgsOmR763NuIEQ6Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNge+LDRGm3fCUSsSnGL0b1IAqH0k3Xgirg18zqxXQM2HfLK7+
	UqYZnHEAYpJryCKNjiqi6dNAakNmk9t/tMGqIbtVc90DBGWu9ipLcNR4oHGAmdmYA08=
X-Gm-Gg: AR+sD11oFRcpG4nElxsTIvSEmj9y2ZSe9/6laFfm41i7nHqxVtlChtAU0szDsdHlTtj
	Vl8BzXkHX53JKLBVrdBwRT19UQ6wMTY4jkogBr6g2gcIfoCrT+en5DYMgYl54QRC1kSvXff61J+
	kOYI86KBKhjyG7sGIBJWsWs80klKAN9bs9JEJnT3fMf0bCK+OMc0TBmZ/l7JH104+ekq+IE/peN
	uFR34q7AMj0CGol/r2n/sitzGbvgJEnK0lwfCKwRhcTzB9r6VXeTIP5kBbHQqjuMxj8mIMmqaEm
	hCGYXbyvyOvmHkFR5IzG1BfrGOvLZmp+zYB/ulmkEBntLvdl23zzddStc4d7Vmh4xG9p5ke3sHG
	C8vMZ2yFGLktbI1KkLieP98ANJlTHuvKEA1yoIpPeKqXufV8+24pz6lCiHqloPCCBUtfvXgMBzG
	vpLOHO757FUSJ2gmsgtCYGNbRw6ja0F5sbjOshy2YLe3I078FhGpigzdXe2xZpn7BjtlypbyT+o
	3ccr1ntNxBQx18xxRpR7/DEtsRBovOa1Dz847//L0G2q2aJ2sPciEQUIgUM6HH1C+a6SGAI3KUO
	FXqRFrDZlvJoF5c=
X-Received: by 2002:a17:903:350f:b0:2cf:461a:3863 with SMTP id d9443c01a7336-2d047e6fe24mr51267725ad.22.1785584960370;
        Sat, 01 Aug 2026 04:49:20 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3153e06f8dbsm16967624eec.22.2026.08.01.04.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 04:49:19 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: jjohnson@kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	baochen.qiang@oss.qualcomm.com,
	stable@vger.kernel.org
Subject: [PATCH v2] wifi: ath11k: Fix possible memory leak in ath11k_dp_srng_setup()
Date: Sat,  1 Aug 2026 17:19:09 +0530
Message-ID: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_044921_648014_053E6EE3 
X-CRM114-Status: GOOD (  11.23  )
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

In ath11k_dp_srng_setup(), the memory allocated for
ring->vaddr_unaligned is not freed in the error paths that follow.
Fix that by calling ath11k_dp_srng_cleanup() in those error paths.

Compile tested only. Issue found using a prototype static analysis tool
built on the LLVM compiler infrastructure.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---

v1->v2:
- Moved the information about compile testing, and how the issue was
  detected to the commit message, as suggested by Baochen Qiang.
- Add the release function in the switch default case as well, as
  pointed out by Jeff Johnson. Also add Assisted-by tag.

v1 link: https://patchwork.kernel.org/project/linux-wireless/patch/20260727105532.118164-1-nihaal@cse.iitm.ac.in/

 drivers/net/wireless/ath/ath11k/dp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index f389b97acbdd..be65d73b904b 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -313,6 +313,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 	case HAL_RXDMA_DIR_BUF:
 		break;
 	default:
+		ath11k_dp_srng_cleanup(ab, ring);
 		ath11k_warn(ab, "Not a valid ring type in dp :%d\n", type);
 		return -EINVAL;
 	}
@@ -324,6 +325,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 
 	ret = ath11k_hal_srng_setup(ab, type, ring_num, mac_id, &params);
 	if (ret < 0) {
+		ath11k_dp_srng_cleanup(ab, ring);
 		ath11k_warn(ab, "failed to setup srng: %d ring_id %d\n",
 			    ret, ring_num);
 		return ret;
-- 
2.43.0


