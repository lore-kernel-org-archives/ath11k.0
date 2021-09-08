Return-Path: <SRS0=P3pu=N6=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BF4C433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Sep 2021 09:21:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98FBA61104
	for <ath11k@archiver.kernel.org>; Wed,  8 Sep 2021 09:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98FBA61104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2nxAMoANINbrm2xOnlFWGvM9gLENhThOlQj2fdWxTBw=; b=LuSO69+shhI7IT
	CEc2CLOkwNxxEliY+lYCFxY4zEW1NbSA1J13bkiWZ9E+ZDE6N8KzqIuj2k5LxjMhAAiL84ODqNKql
	FVz1Uvs9L129yJnDenhi15FKvkjioS1+152VDqKZtK04hMmmO+lYGhz6frVbHfGHyK5pmwvOF6D/Q
	vD2Kx5By2vxAiUOcP2jEOzumcZz4jnfbBNBWCRSyL/qJU3zNfD8L0YW4vEDCZy1gqf7BhDqWihsXq
	szJxuWoMAojBAcD5XOvPFvKDTixNmX9FLIBE6N9Tsh9nPsnjpxj7Y4Rxm4oyVH3ehfJ5n71ligTGS
	3nIuidedlgH9iXo96IpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNtlq-006HKQ-HC; Wed, 08 Sep 2021 09:21:30 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNtln-006HJU-5g
 for ath11k@lists.infradead.org; Wed, 08 Sep 2021 09:21:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631092887; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=YL/HKKRBnTTqUSAY8JwDqXetSifEeQ2qUezVr7j1D7Q=;
 b=MWzbiT7zUPDbmTlAVWSY1zDR6VEBvQJwj+UYFADS5lWUZ9cfasWhjITkGKRNNk6kDDxHSJe7
 KXcClrnfm2Xk1M3mNdvBBOywgxfbPXeC1OqdeSFawLRmHFX2l4BZNs2NR0oJNvSH4lrKjWOq
 Jw6kzsHZ9B9kdrh5rGkX4mpQuds=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 613880956fc2cf7ad9194395 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 09:21:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2DBC2C43460; Wed,  8 Sep 2021 09:21:24 +0000 (UTC)
Received: from blr-ubuntu-subratm.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: subratm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E836C4338F;
 Wed,  8 Sep 2021 09:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9E836C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Subrat Mishra <subratm@codeaurora.org>
To: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: Subrat Mishra <subratm@codeaurora.org>
Subject: [PATCH v2] cfg80211: AP mode driver offload for FILS association
 crypto
Date: Wed,  8 Sep 2021 14:51:06 +0530
Message-Id: <1631092866-4530-1-git-send-email-subratm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_022127_692319_0C14A9AA 
X-CRM114-Status: GOOD (  23.88  )
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

Add a driver FILS crypto offload extended capability flag to indicate
that the driver running in AP mode is capable of handling encryption
and decryption of (Re)Association request and response frames.
Add a command to set FILS AAD data to driver.

This feature is supported on drivers running in AP mode only.
This extended capability is exchanged with hostapd during cfg80211
init. If the driver indicates this capability, then before sending the
Authentication response frame, hostapd sets FILS AAD data to the
driver. This allows the driver to decrypt (Re)Association Request
frame and encrypt (Re)Association Response frame. FILS Key derivation
will still be done in hostapd.

Signed-off-by: Subrat Mishra <subratm@codeaurora.org>

v2:
- NL80211_FLAG_NEED_RTNL flag removed from internal_flags of command NL80211_FLAG_NEED_RTNL
- Fixed alignment in include/net/cfg80211.h set_fils_aad() comments
- Fixed alignment in net/wireless/trace.h rdev_set_fils_aad Trace event

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 62dd842..621e3b2 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -740,6 +740,22 @@ struct cfg80211_tid_config {
 };
 
 /**
+ * struct cfg80211_fils_aad - FILS AAD data
+ * @macaddr: STA MAC address
+ * @kek: FILS KEK
+ * @kek_len: FILS KEK length
+ * @snonce: STA Nonce
+ * @anonce: AP Nonce
+ */
+struct cfg80211_fils_aad {
+	const u8 *macaddr;
+	const u8 *kek;
+	u8 kek_len;
+	const u8 *snonce;
+	const u8 *anonce;
+}
+
+/**
  * cfg80211_get_chandef_type - return old channel type from chandef
  * @chandef: the channel definition
  *
@@ -4018,6 +4034,10 @@ struct mgmt_frame_regs {
  * @set_sar_specs: Update the SAR (TX power) settings.
  *
  * @color_change: Initiate a color change.
+ *
+ * @set_fils_aad: Set FILS AAD data to the AP driver so that the driver can use
+ *	those to decrypt (Re)Association Request and encrypt (Re)Association
+ *	Response frame.
  */
 struct cfg80211_ops {
 	int	(*suspend)(struct wiphy *wiphy, struct cfg80211_wowlan *wow);
@@ -4348,6 +4368,8 @@ struct cfg80211_ops {
 	int	(*color_change)(struct wiphy *wiphy,
 				struct net_device *dev,
 				struct cfg80211_color_change_settings *params);
+	int     (*set_fils_aad)(struct wiphy *wiphy, struct net_device *dev,
+				struct cfg80211_fils_aad *fils_aad);
 };
 
 /*
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index c2efea9..e89bbf8 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -301,6 +301,29 @@
  */
 
 /**
+ * DOC: FILS shared key crypto offload
+ *
+ * This feature is applicable to drivers running in AP mode.
+ *
+ * FILS shared key crypto offload can be advertised by drivers by setting
+ * @NL80211_EXT_FEATURE_FILS_CRYPTO_OFFLOAD flag. The drivers that support
+ * FILS shared key crypto offload should be able to encrypt and decrypt
+ * association frames for FILS shared key authentication as per IEEE 802.11ai.
+ * With this capability, for FILS key derivation, drivers depend on userspace.
+ *
+ * After FILS key derivation, userspace shares the FILS AAD details with the
+ * driver and the driver stores the same to use in decryption of association
+ * request and in encryption of association response. The below parameters
+ * should be given to the driver in %NL80211_CMD_SET_FILS_AAD.
+ *	%NL80211_ATTR_MAC - STA MAC address, used for storing FILS AAD per STA
+ *	%NL80211_ATTR_FILS_KEK - Used for encryption or decryption
+ *	%NL80211_ATTR_FILS_NONCES - Used for encryption or decryption
+ *			(STA Nonce 16 bytes followed by AP Nonce 16 bytes)
+ *
+ * Once the association is done, the driver cleans the FILS AAD data.
+ */
+
+/**
  * enum nl80211_commands - supported nl80211 commands
  *
  * @NL80211_CMD_UNSPEC: unspecified command to catch errors
@@ -1200,6 +1223,12 @@
  * @NL80211_CMD_COLOR_CHANGE_COMPLETED: Notify userland that the color change
  *	has completed
  *
+ * @NL80211_CMD_SET_FILS_AAD: Set FILS AAD data to the driver using -
+ *	&NL80211_ATTR_MAC - for STA MAC address
+ *	&NL80211_ATTR_FILS_KEK - for KEK
+ *	&NL80211_ATTR_FILS_NONCES - for FILS Nonces
+ *		(STA Nonce 16 bytes followed by AP Nonce 16 bytes)
+ *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
  */
@@ -1440,6 +1469,8 @@ enum nl80211_commands {
 	NL80211_CMD_COLOR_CHANGE_ABORTED,
 	NL80211_CMD_COLOR_CHANGE_COMPLETED,
 
+	NL80211_CMD_SET_FILS_AAD,
+
 	/* add new commands above here */
 
 	/* used to define NL80211_CMD_MAX below */
@@ -5995,6 +6026,11 @@ enum nl80211_feature_flags {
  * @NL80211_EXT_FEATURE_BSS_COLOR: The driver supports BSS color collision
  *	detection and change announcemnts.
  *
+ * @NL80211_EXT_FEATURE_FILS_CRYPTO_OFFLOAD: Driver running in AP mode supports
+ *	FILS encryption and decryption for (Re)Association Request and Response
+ *	frames. Userspace has to share FILS AAD details to the driver by using
+ *	@NL80211_CMD_SET_FILS_AAD.
+ *
  * @NUM_NL80211_EXT_FEATURES: number of extended features.
  * @MAX_NL80211_EXT_FEATURES: highest extended feature index.
  */
@@ -6060,6 +6096,7 @@ enum nl80211_ext_feature_index {
 	NL80211_EXT_FEATURE_SECURE_RTT,
 	NL80211_EXT_FEATURE_PROT_RANGE_NEGO_AND_MEASURE,
 	NL80211_EXT_FEATURE_BSS_COLOR,
+	NL80211_EXT_FEATURE_FILS_CRYPTO_OFFLOAD,
 
 	/* add new features before the definition below */
 	NUM_NL80211_EXT_FEATURES,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index bf7cd47..761760a 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -14904,6 +14904,29 @@ static int nl80211_color_change(struct sk_buff *skb, struct genl_info *info)
 	return err;
 }
 
+static int nl80211_set_fils_aad(struct sk_buff *skb,
+				struct genl_info *info)
+{
+	struct cfg80211_registered_device *rdev = info->user_ptr[0];
+	struct net_device *dev = info->user_ptr[1];
+	struct cfg80211_fils_aad fils_aad = {};
+	u8 *nonces;
+
+	if (!info->attrs[NL80211_ATTR_MAC] ||
+	    !info->attrs[NL80211_ATTR_FILS_KEK] ||
+	    !info->attrs[NL80211_ATTR_FILS_NONCES])
+		return -EINVAL;
+
+	fils_aad.macaddr = nla_data(info->attrs[NL80211_ATTR_MAC]);
+	fils_aad.kek_len = nla_len(info->attrs[NL80211_ATTR_FILS_KEK]);
+	fils_aad.kek = nla_data(info->attrs[NL80211_ATTR_FILS_KEK]);
+	nonces = nla_data(info->attrs[NL80211_ATTR_FILS_NONCES]);
+	fils_aad.snonce = nonces;
+	fils_aad.anonce = nonces + FILS_NONCE_LEN;
+
+	return rdev_set_fils_aad(rdev, dev, &fils_aad);
+}
+
 #define NL80211_FLAG_NEED_WIPHY		0x01
 #define NL80211_FLAG_NEED_NETDEV	0x02
 #define NL80211_FLAG_NEED_RTNL		0x04
@@ -15907,6 +15930,13 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.internal_flags = NL80211_FLAG_NEED_NETDEV_UP |
 				  NL80211_FLAG_NEED_RTNL,
 	},
+	{
+		.cmd = NL80211_CMD_SET_FILS_AAD,
+		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
+		.doit = nl80211_set_fils_aad,
+		.flags = GENL_UNS_ADMIN_PERM,
+		.internal_flags = NL80211_FLAG_NEED_NETDEV_UP,
+	},
 };
 
 static struct genl_family nl80211_fam __ro_after_init = {
diff --git a/net/wireless/rdev-ops.h b/net/wireless/rdev-ops.h
index ce6bf21..cc1efec 100644
--- a/net/wireless/rdev-ops.h
+++ b/net/wireless/rdev-ops.h
@@ -1381,4 +1381,18 @@ static inline int rdev_color_change(struct cfg80211_registered_device *rdev,
 	return ret;
 }
 
+static inline int
+rdev_set_fils_aad(struct cfg80211_registered_device *rdev,
+		  struct net_device *dev, struct cfg80211_fils_aad *fils_aad)
+{
+	int ret = -EOPNOTSUPP;
+
+	trace_rdev_set_fils_aad(&rdev->wiphy, dev, fils_aad);
+	if (rdev->ops->set_fils_aad)
+		ret = rdev->ops->set_fils_aad(&rdev->wiphy, dev, fils_aad);
+	trace_rdev_return_int(&rdev->wiphy, ret);
+
+	return ret;
+}
+
 #endif /* __CFG80211_RDEV_OPS */
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 19b78d4..88cd694 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -167,6 +167,19 @@
 			__entry->center_freq1, __entry->freq1_offset,	\
 			__entry->center_freq2
 
+#define FILS_AAD_ASSIGN(fa)                                                  \
+	do {                                                                 \
+		if (fa) {                                                    \
+			ether_addr_copy(__entry->macaddr, fa->macaddr);      \
+			__entry->kek_len = fa->kek_len;                      \
+		} else {                                                     \
+			eth_zero_addr(__entry->macaddr);                     \
+			__entry->kek_len = 0;                                \
+		}                                                            \
+	} while (0)
+#define FILS_AAD_PR_FMT                                                      \
+	"macaddr: %pM, kek_len: %d"
+
 #define SINFO_ENTRY __field(int, generation)	    \
 		    __field(u32, connected_time)    \
 		    __field(u32, inactive_time)	    \
@@ -2614,6 +2627,24 @@ DEFINE_EVENT(wiphy_wdev_cookie_evt, rdev_abort_pmsr,
 	TP_ARGS(wiphy, wdev, cookie)
 );
 
+TRACE_EVENT(rdev_set_fils_aad,
+	TP_PROTO(struct wiphy *wiphy, struct net_device *netdev,
+		 struct cfg80211_fils_aad *fils_aad),
+	TP_ARGS(wiphy, netdev, fils_aad),
+	TP_STRUCT__entry(WIPHY_ENTRY
+		NETDEV_ENTRY
+		__array(u8, macaddr, ETH_ALEN)
+		__field(u8, kek_len)
+	),
+	TP_fast_assign(WIPHY_ASSIGN;
+		NETDEV_ASSIGN;
+		FILS_AAD_ASSIGN(fils_aad);
+	),
+	TP_printk(WIPHY_PR_FMT ", " NETDEV_PR_FMT ", " FILS_AAD_PR_FMT,
+		  WIPHY_PR_ARG, NETDEV_PR_ARG, __entry->macaddr,
+		  __entry->kek_len)
+);
+
 /*************************************************************
  *	     cfg80211 exported functions traces		     *
  *************************************************************/
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
