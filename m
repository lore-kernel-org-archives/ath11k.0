Return-Path: <SRS0=tQ0v=LC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863DCC47082
	for <ath11k@archiver.kernel.org>; Tue,  8 Jun 2021 15:08:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A40E60231
	for <ath11k@archiver.kernel.org>; Tue,  8 Jun 2021 15:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A40E60231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBxIixU+M3wKTcsWDhBuz7RNdQJMltr3bMweovtjV/Q=; b=Mca24WiiE0FMJN
	F7lN8UzJ8kQb5M+VZQLcOAUQd06xuL3mvGv1QbeuZCd2NLwr+9oSM1d3ov/0MntGDxUQTHyiP7mNx
	DKDk0ceDtOPHej012s29t1yN3PPPTalRIKn45MNdgYgZ58xvEXhw0IeNayWatSMHQINa9xF0Mr/dT
	ehZ18yYaiaSVCcUkFNUK7958Ln/DRdD4rgv7YsvE8vkLjqVkewyWCWHEvdbwjaYXN5TKBInHAB11l
	itHUb2Z0Hg4tIZeRtMn7vlsNWVSLSKenKVIoq1mBnO4wCY3c6c7HgWYLC8HiNDwic3C9mKApHSmzB
	gl4WpIpF2bwBFJNWO7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqdKz-0096Mx-5T; Tue, 08 Jun 2021 15:08:17 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqdKp-0096HV-7O
 for ath11k@lists.infradead.org; Tue, 08 Jun 2021 15:08:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623164894; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=t5CHvQYjEMkHJFa488MQBARpVpjFpm0SGQTgSs3E0ik=;
 b=O7l/4MfalD5CKLZEJ2ekLUYZC5yKpEDdHEKy2roy7+imCfnssmXWFWM2X3CW/8r/g4A2wsEM
 GrElD3fxH4njle5EjZhc0uECQnHwlJmVVptpGYQkK+bVj+8AU1uxogPlsThozS0+23T5k+JL
 PXgxI/kH8EgWML5f67Pfu++q0o4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60bf87c5b6ccaab753e521cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 15:07:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 85450C4338A; Tue,  8 Jun 2021 15:07:49 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4BAAAC43460;
 Tue,  8 Jun 2021 15:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4BAAAC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=mkenna@codeaurora.org
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH v4 1/3] nl80211: Add support for beacon tx mode
Date: Tue,  8 Jun 2021 20:37:33 +0530
Message-Id: <1623164855-15910-2-git-send-email-mkenna@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623164855-15910-1-git-send-email-mkenna@codeaurora.org>
References: <1623164855-15910-1-git-send-email-mkenna@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_080814_864043_2E5BDBE6 
X-CRM114-Status: GOOD (  19.36  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

User can configure the below beacon tx mode
1. Staggered mode and 2. Burst mode while bring-up the AP
or MESH.

Beacons can be sent out in burst(continuously in a single shot
one after another) or staggered (equally spread out over beacon
interval) mode.

Set the beacon_tx_mode as 1 for Staggered mode and 2 for
burst mode.

Hence, added the support in the nl80211/cfg80211
layer to honour the beacon tx mode configuration and pass
this value to the driver.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00630-QCAHKSWPL_SILICONZ-2

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---

V3: Addressed Johnson's comment on v2 patch.

V2: Addressed Johannes's comment on v1 patch.

 include/net/cfg80211.h       |  4 ++++
 include/uapi/linux/nl80211.h | 16 ++++++++++++++++
 net/wireless/nl80211.c       |  9 +++++++++
 3 files changed, 29 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 58c2cd4..65161fd 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1182,6 +1182,7 @@ enum cfg80211_ap_settings_flags {
  * @he_oper: HE operation IE (or %NULL if HE isn't enabled)
  * @fils_discovery: FILS discovery transmission parameters
  * @unsol_bcast_probe_resp: Unsolicited broadcast probe response parameters
+ * @beacon_tx_mode: Beacon Tx Mode setting
  */
 struct cfg80211_ap_settings {
 	struct cfg80211_chan_def chandef;
@@ -1214,6 +1215,7 @@ struct cfg80211_ap_settings {
 	struct cfg80211_he_bss_color he_bss_color;
 	struct cfg80211_fils_discovery fils_discovery;
 	struct cfg80211_unsol_bcast_probe_resp unsol_bcast_probe_resp;
+	enum nl80211_beacon_tx_mode beacon_tx_mode;
 };
 
 /**
@@ -2061,6 +2063,7 @@ struct mesh_config {
  *	to operate on DFS channels.
  * @control_port_over_nl80211: TRUE if userspace expects to exchange control
  *	port frames over NL80211 instead of the network interface.
+ * @beacon_tx_mode: Beacon Tx Mode setting.
  *
  * These parameters are fixed when the mesh is created.
  */
@@ -2084,6 +2087,7 @@ struct mesh_setup {
 	struct cfg80211_bitrate_mask beacon_rate;
 	bool userspace_handles_dfs;
 	bool control_port_over_nl80211;
+	enum nl80211_beacon_tx_mode beacon_tx_mode;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index f962c06..a86b32e 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -2560,6 +2560,10 @@ enum nl80211_commands {
  *	disassoc events to indicate that an immediate reconnect to the AP
  *	is desired.
  *
+ * @NL80211_ATTR_BEACON_TX_MODE: used to configure the beacon tx mode as
+ *      staggered mode = 1 or burst mode = 2 in %NL80211_CMD_START_AP or
+ *      %NL80211_CMD_JOIN_MESH from user-space.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3057,6 +3061,8 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_DISABLE_HE,
 
+	NL80211_ATTR_BEACON_TX_MODE,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -7299,4 +7305,14 @@ enum nl80211_sar_specs_attrs {
 	NL80211_SAR_ATTR_SPECS_MAX = __NL80211_SAR_ATTR_SPECS_LAST - 1,
 };
 
+/**
+ * enum nl80211_beacon_tx_mode - Beacon Tx Mode enum.
+ *      Used to configure beacon staggered mode or beacon burst mode.
+ */
+enum nl80211_beacon_tx_mode {
+	NL80211_BEACON_DEFAULT_MODE = 0,
+	NL80211_BEACON_STAGGERED_MODE = 1,
+	NL80211_BEACON_BURST_MODE = 2,
+};
+
 #endif /* __LINUX_NL80211_H */
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index fc9286a..6076d00 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -759,6 +759,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_RECONNECT_REQUESTED] = { .type = NLA_REJECT },
 	[NL80211_ATTR_SAR_SPEC] = NLA_POLICY_NESTED(sar_policy),
 	[NL80211_ATTR_DISABLE_HE] = { .type = NLA_FLAG },
+	[NL80211_ATTR_BEACON_TX_MODE] = NLA_POLICY_RANGE(NLA_U32, 1, 2),
 };
 
 /* policy for the key attributes */
@@ -5342,6 +5343,10 @@ static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 	params.dtim_period =
 		nla_get_u32(info->attrs[NL80211_ATTR_DTIM_PERIOD]);
 
+	if (info->attrs[NL80211_ATTR_BEACON_TX_MODE])
+		params.beacon_tx_mode =
+			nla_get_u32(info->attrs[NL80211_ATTR_BEACON_TX_MODE]);
+
 	err = cfg80211_validate_beacon_int(rdev, dev->ieee80211_ptr->iftype,
 					   params.beacon_interval);
 	if (err)
@@ -11896,6 +11901,10 @@ static int nl80211_join_mesh(struct sk_buff *skb, struct genl_info *info)
 			return -EINVAL;
 	}
 
+	if (info->attrs[NL80211_ATTR_BEACON_TX_MODE])
+		setup.beacon_tx_mode =
+			nla_get_u32(info->attrs[NL80211_ATTR_BEACON_TX_MODE]);
+
 	if (info->attrs[NL80211_ATTR_MESH_SETUP]) {
 		/* parse additional setup parameters if given */
 		err = nl80211_parse_mesh_setup(info, &setup);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
