Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BEBFA373F
	for <ath11k@archiver.kernel.org>; Sat, 22 Oct 2022 04:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yn5ysishPKksRHJY5xORfXoCjx8IazbVY1FSzVpq+Qs=; b=Rpu5jR5AWlbUjw
	tmLnlbK+kcqekKkUzjcTLgQ3chdsyEXTsiK0EtzK+wzvCzgSrB3NfA06noykxSwiRM0B49zdenDYz
	EtKv6KisrcQu7rDChtO8GksZF+9ePbv1RS23kibwvElptSX3nOqMlnxKzOdKdCTGZkb5Xt0MYG2Mv
	7WM2+bP9rSlXxlit2rLp4lAlBSIq/lMCMCECOXgitGnFQH8pkw7H1kkbXARRyN8HMTh85MIvSsSr4
	A8934bZb8RMiquwYX0+aWPqTV8fSwBQlbivA341/ZFvYIVki82NpGXoPHFDq1rlls9zZN6ztAj+uO
	LWy4qguh9nrIHXdMBwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om66Y-00B70o-9w; Sat, 22 Oct 2022 04:27:26 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om66V-00B6zz-VA
	for ath11k@lists.infradead.org; Sat, 22 Oct 2022 04:27:25 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id u7so3144596qvn.13
        for <ath11k@lists.infradead.org>; Fri, 21 Oct 2022 21:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IHBmQcvSONp1skndlop+2zNlLfEhZ9bZQFsTspZ9/YM=;
        b=dsuAqmmKrNx2KZNnpyKAM2O3haJys8sggQelTM8E66lsLPDTL15aJpuLat3P9yA9ib
         7tzTAOkTBi6L8dz4CLbm21v8Ne2z6czqj4P0sZM1xrvPNaLJFMHpylL+xe6za33Pc+JP
         I5kcinzg2BeVMClilZ04I+bts32JnAsjipup6AOQpe6hMQ9yWB3fnaWW8DwX/pmU2Q+p
         ZlmAArD0HoRPy0J0fxIOvmrjsCRIMQLicSc+ugcqsT0cI5VAgMcTBGOAQdRtgM2d0zJZ
         +wsdRRK0wcsRs0u6OgqDPV0Depg8D8XGhGW1oAxQ2PtePhR9ZiEnGeAGI+mbjLdhDIai
         LnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHBmQcvSONp1skndlop+2zNlLfEhZ9bZQFsTspZ9/YM=;
        b=JZyee1rsCLnnPRzj5rlxZfcazfljpwgmbpHcad8/1SaxnMMBgAc37k9yNcZUAKhOo5
         7uWcXmXABkdghP1SBBqpbVXCulp2HpxnttfAVv2SH2ga9xQq9CEujDNtkZMacFhuYZq/
         b1Vxx10gCrms71hki7fwkNnTayePhfBTOERs4OwUKNu9LeBOsriW8MxkeC36hvDISOxN
         UcAYELDFjDqwS51cE4yVjoIFcyg8pOT5vkJN+gDoR7Zk1cxVM1rp37p/7DfDwdfj9sLg
         Tzw14lJ8KPPfzMt/jyU0XmXwnXxPEvlLp498YLxQk0CiwfiN/i7Tn0jvywbgl6uGneAh
         wQcg==
X-Gm-Message-State: ACrzQf1Z2S9h+P3bd8FJNG7YNrtjPMEyXPrEJs1YLYhfpi5jVwIbodIw
	anFj0uN7IP3O4/7b+NhUG9vhGJXfopuRzQ==
X-Google-Smtp-Source: AMsMyM47/wrt+mpOghumH6l58S+MyIEdVkmrP+cqy4Oyr5XtY3JcbauDeH4fb0CuhlVVOHmJpcQ4ug==
X-Received: by 2002:a0c:b295:0:b0:4ba:b9b4:5159 with SMTP id r21-20020a0cb295000000b004bab9b45159mr6290441qve.19.1666412840868;
        Fri, 21 Oct 2022 21:27:20 -0700 (PDT)
Received: from luigi.ops.stachecki.net (pool-98-113-41-201.nycmny.fios.verizon.net. [98.113.41.201])
        by smtp.gmail.com with ESMTPSA id s3-20020a05620a29c300b006d1d8fdea8asm11234988qkp.85.2022.10.21.21.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 21:27:20 -0700 (PDT)
From: "Tyler J. Stachecki" <stachecki.tyler@gmail.com>
To: 
Cc: "Tyler J. Stachecki" <stachecki.tyler@gmail.com>,
	Kalle Valo <kvalo@codeaurora.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ath11k: Fix QCN9074 firmware boot on x86
Date: Sat, 22 Oct 2022 00:27:28 -0400
Message-Id: <20221022042728.43015-1-stachecki.tyler@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_212724_038558_812A3665 
X-CRM114-Status: GOOD (  11.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The 2.7.0 series of QCN9074's firmware requests 5 segments
of memory instead of 3 (as in the 2.5.0 series).

The first segment (11M) is too large to be kalloc'd in one
go on x86 and requires piecemeal 1MB allocations, as was
the case with the prior public firmware (2.5.0, 15M).

Since f6f92968e1e5, ath11k will break the memory requests,
but only if there were fewer than 3 segments requested by
the firmware. It seems that 5 segments works fine and
allows QCN9074 to boot on x86 with firmware 2.7.0, so
change things accordingly.

Signed-off-by: Tyler J. Stachecki <stachecki.tyler@gmail.com>
---
 drivers/net/wireless/ath/ath11k/qmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 2ec56a34fa81..0909d53cefeb 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -27,7 +27,7 @@
 #define ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
 #define ATH11K_QMI_CALDB_SIZE			0x480000
 #define ATH11K_QMI_BDF_EXT_STR_LENGTH		0x20
-#define ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT	3
+#define ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT	5
 
 #define QMI_WLFW_REQUEST_MEM_IND_V01		0x0035
 #define QMI_WLFW_FW_MEM_READY_IND_V01		0x0037
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
