Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D94C6377A
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1F2B61208
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1F2B61208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysh/mY5MV4tV3z1/BOcbOZPeMQ6TWzHFGhuYobivF/I=; b=lln8DAwbXEhBEB
	u82BmKOUtPM+nAZtvAQwgB5ejp3unUP0fTBbWjN6PRbRDl6tlha4Bpfc//stcomzCC4aI5/T0oNk2
	lTsf77daIzafElVXxqdHZgFbUX81WulYcbglskPFI/e4f9wxcAwFAMQmmicRuFUYeAX/i3JiuDjzU
	N3bXtXGfY1784qmRdMxaEVmF+MMPLnlByoe3fzAmOsz+tt4LxiWFfVrZcpr5fx+bVPlTChMorvssm
	VclZTJjQbVkSQDiSPWisc0bRX+DYaEaopuhSzM0BK8jVq0RA5HtWvEdutpaj4Rx0HGT9i6vCwnAWz
	EiZQ6RjnH2WFoxCv3cpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Jeb-00HIer-KA; Wed, 21 Jul 2021 21:21:21 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6JeV-00HIMr-OT
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 21:21:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626902478; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zjV4jmZT73UwCRIovvhGz/A7dljJJOvqTPpXAp2qC80=;
 b=EBdhKSPrAjHGpnRoukTk+fBY8/8FcN3ONeWBHzoZkD3xosFmx98/YUVgXir7L2Yc/3tRL3Wl
 ZyfcsvkyrMXxkNIph64CWqdWhnw0iF7qv4GN5g+YWdXawN7v6cd0fJ/+5hJdMGSpzGfMkLvD
 ooL88pPwrs1+5WQlskALuQR0X40=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60f88fc1b653fbdadd8edb39 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 21:21:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C5481C43145; Wed, 21 Jul 2021 21:21:04 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 49F98C4360C;
 Wed, 21 Jul 2021 21:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 49F98C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 09/12] ath11k: Add wmi peer create conf event in
 wmi_tlv_event_id
Date: Thu, 22 Jul 2021 00:20:26 +0300
Message-Id: <20210721212029.142388-9-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721212029.142388-1-jouni@codeaurora.org>
References: <20210721212029.142388-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_142119_093536_EEBB5B90 
X-CRM114-Status: GOOD (  13.07  )
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

From: P Praneesh <ppranees@codeaurora.org>

When the driver sends a peer create cmd, the firmware responds with
WMI_PEER_CREATE_CONF_EVENTID to confirm the firmware received
WMI_PEER_CREATE_CMDID. Since the peer create conf event is not handled
in ath11k_wmi_tlv_op_rx, we are getting unknown event id warning prints
during peer creation.

Add WMI_PEER_CREATE_CONF_EVENTID in wmi_tlv_event_id and handle
the same as unsupported event id under wmi logs.

warning prints:
[ 4382.230817] ath11k_pci 0000:01:00.0: Unknown eventid: 0x601a

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1

Signed-off-by: P Praneesh <ppranees@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 1 +
 drivers/net/wireless/ath/ath11k/wmi.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 020b2b7ee3c8..6d2696db1e07 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7130,6 +7130,7 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	case WMI_TWT_ENABLE_EVENTID:
 	case WMI_TWT_DISABLE_EVENTID:
 	case WMI_PDEV_DMA_RING_CFG_RSP_EVENTID:
+	case WMI_PEER_CREATE_CONF_EVENTID:
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "ignoring unsupported event 0x%x\n", id);
 		break;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 16b3f48bb378..2587d22f42ce 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -663,6 +663,9 @@ enum wmi_tlv_event_id {
 	WMI_PEER_RESERVED9_EVENTID,
 	WMI_PEER_RESERVED10_EVENTID,
 	WMI_PEER_OPER_MODE_CHANGE_EVENTID,
+	WMI_PEER_TX_PN_RESPONSE_EVENTID,
+	WMI_PEER_CFR_CAPTURE_EVENTID,
+	WMI_PEER_CREATE_CONF_EVENTID,
 	WMI_MGMT_RX_EVENTID = WMI_TLV_CMD(WMI_GRP_MGMT),
 	WMI_HOST_SWBA_EVENTID,
 	WMI_TBTTOFFSET_UPDATE_EVENTID,
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
