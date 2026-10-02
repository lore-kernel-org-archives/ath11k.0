Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9524CA5FD4
	for <ath11k@archiver.kernel.org>; Fri,  2 Oct 2026 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CUSQwQ8vAjSojfF/giLhvIKYInkvHMUZuOWv7KAxxtE=; b=aa4EIo1zGHJgc0b98b4+r1YiFn
	nW83fyxhcGdRWGTISd1nQc1c5ZmCtkUvv3AXh/vewivUeUEoAOKXh9wLSFdZCJts3L3/RFs67Zjax
	xroXnSA2X2npEdEJFWhW2ormF9PLNvJUOD/NCcFR9DUCsnqcqpAVgAs4nrdRWhoNckVJvJCe7jXWu
	BGMrJ5tb9FgQbCFo+pLDimS2MO2MZTA2rQiFyGukWWnUMJ+bi6tryDhV8VZQ5AeFW8c6dk9LOxrM0
	IcoEN/hj2hk9HoyweJhIB7T2fUwjSnw9uO1yODRdXpceFxwobxklcudrxEw+/ILjVbBC7/+NJHqx2
	QSz88M5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcEd-0000000BYHs-2Q8B;
	Fri, 02 Oct 2026 12:19:31 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcEa-0000000BYH8-2i99
	for ath11k@lists.infradead.org;
	Fri, 02 Oct 2026 12:19:30 +0000
Received: from MAILGW-BIG.big.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id B127DB35C;
	Fri, 02 Oct 2026 15:19:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=sig1; bh=CUSQwQ8vAjSojfF/giLhvIKYInkvHMUZuOWv7KAxxtE=; b=
	h9DX/AVQtCNoVfzwftVQCwuZRgsaw62AnCKRowXTBJnhF055xAYjh/JxAl6otQWn
	ySk5hnQ0+CGCOJhgLMAyfWCuxGEUblna5j+Mju0QtxfRIoAgnEskLyrcDP8Q0vKH
	EzsHsmEeP0ZJl9DgEPApJYvhEDR4tccbTy1Pb1nUsuxERcrToBKRgc1P3q/Xnk7i
	mFpQ2nC2t/H0/FV7+bUCTMJuLVf49DYq1ZJt13Bsis7U2tRLBovnscDJEw0/vhgc
	Rxp2GxsyjiKYvdMFEyjfH5DEIYDU+rEjFPGoi+/sqChq79fYB32iQI2i+RIO+Rtv
	chmucIWA1gzUlj7vWoJ36w==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 3F131B273;
	Fri, 02 Oct 2026 15:19:20 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 15:19:19 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath11k: handle HTT PPDU ID format indication
Date: Fri, 2 Oct 2026 15:19:14 +0300
Message-ID: <20261002121914.994458-1-me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_051928_892661_34F4B721 
X-CRM114-Status: GOOD (  12.22  )
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

Firmware from WLAN.HK 2.8 onwards sends HTT_T2H_PPDU_ID_FMT_IND (0x30)
once per radio at bring-up. It describes how the firmware packs a PPDU
ID: for each field (HW scheduler command id, ring, sequence index,
link, command type, TQM command, MAC id and CRC) whether it is present,
its width and its bit offset.

ath11k only ever compares PPDU IDs and never decodes them, so it has no
use for this layout, but the unknown message type ends up in the
default case and logs

  htt event 48 not handled

at warning level on every boot. Add the message type and dump the
message at the ATH11K_DBG_DP_HTT debug level instead.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
Found and fixed with an AI coding assistant (Claude Code), which also
drafted this changelog. Tested on a Ubiquiti UniFi U6 Enterprise
(IPQ5018 + 2x QCN9074) running 7.2.8 with the OpenWrt backports ath11k:
the warning is gone from both QCN9074 radios. On ath-next the patch is
compile-tested (W=1) only.

 drivers/net/wireless/ath/ath11k/dp.h    | 1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6..bace81c453e1 100644
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
index 6d95f7b343a5..a22cf1b9f43a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1747,6 +1747,11 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 	case HTT_T2H_MSG_TYPE_BKPRESSURE_EVENT_IND:
 		ath11k_htt_backpressure_event_handler(ab, skb);
 		break;
+	case HTT_T2H_MSG_TYPE_PPDU_ID_FMT_IND:
+		/* The bit layout of the firmware's PPDU IDs; ath11k only compares them. */
+		ath11k_dbg_dump(ab, ATH11K_DBG_DP_HTT, NULL, "htt ppdu id format: ",
+				skb->data, skb->len);
+		break;
 	default:
 		ath11k_warn(ab, "htt event %d not handled\n", type);
 		break;
-- 
2.47.3



