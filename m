Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA5DC433EF
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/1KbWHKsv13V5MY6jnFbCzZjD/MOcPlatLhsidYyXE=; b=NSOaAMqWiasp12
	KuyGeJqEVBlfeuwOIYAC2hjHYtqeOeuWp5MDCclXI/1CsbVl9M6HRNcuQ+NHXVv46QIzPDhPtC/4G
	fXD6i9JThgE5YCgxEBdVWwGOs1EcXXNDFvtMHa1d4ep9XRYwlKCpX9y5FjTplmEiv0jffQmI3NPIb
	u8RCSWEIxQfnmp7Nyi1UZH/ahw3nXmMBEqRX2M/cCFbx/OVyFNG49yUs9R9bWygrLPFNnJBcReQoX
	m89RG9E2779dvSgMSE8JtFPGgGCxQ4YglKjkqmVOxKbzVirluuTJTKbec24O1ifn0QuIUunKwTIv6
	yRx6blblLDyBqVlqg2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4K8-002pDz-Ei; Mon, 23 May 2022 09:26:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2op-002A7b-4C
 for ath11k@bombadil.infradead.org; Mon, 23 May 2022 07:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=e1kLWLSUVFdxvFvWDCxq9Din9yErolP4oSReUQ0Ke0A=; b=InA2NW+V3nJUbs8c4KOAOJfj9n
 Nj4reEz4DdAf2XiP0z1vaqH/6SnsBbPjDr3Xw9AsOawAEEXeHaC7HZpL74PQX6FZtfFTfJqlVeVx1
 CWjPgjGXngQY+e0AdfrtY7sNkfc5K37oyM9wJWV70jYhjJ+Rfd0s5g5hsjHkGcsGMY7MMU0g9Y4F5
 qeJp7nr4jkyu5WQzucpCGPDY0Ak9VbgPX+6j4CDbi26liSDevtgtSrMC3Sz1Zslq9HsPwaqBBJz2m
 nO9Fj1XKo3lRWcZHc6+i2WUObB6SFAQQJCb/HfkdELW2WXzLwpgBvM5iKO9zYdorwoFAL3AnN1xY+
 DPCgfM1A==;
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt19S-000seG-K2
 for ath11k@lists.infradead.org; Mon, 23 May 2022 06:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653285766; x=1684821766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e1kLWLSUVFdxvFvWDCxq9Din9yErolP4oSReUQ0Ke0A=;
 b=xj/FUYe2/HRNTnBVkKahQU+jJm9xSeYiTStk02lXrP/yVNpoQOAFqgbg
 8xQi2tpj9Vh4yDEV/zNcszdb0aQf/iAQLh+eGugu6g7RjyjPud079gnld
 D7HsDTIeB85CxW2qLZL73xcjrm1O+xhS8OUGs+7Km+fB9T1ozmjutpuJR Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 May 2022 23:01:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 23:01:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:27 -0700
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:26 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>, John Crispin <john@phrozen.org>
Subject: [PATCH 3/9] ath11k: set MBSSID and EMA driver capabilities
Date: Sun, 22 May 2022 23:01:02 -0700
Message-ID: <20220523060108.23982-4-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220523060108.23982-1-quic_alokad@quicinc.com>
References: <20220523060108.23982-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070247_597014_5311CF1E 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

Set extended capability bits in ath11k_if_types_ext_capa,
ath11k_if_types_ext_capa_sta and ath11k_if_types_ext_capa_ap structures
to indicate the driver support for MBSSID and EMA.

Configure mbssid_max_interfaces and ema_max_profile_periodicity
fields in structure wiphy which are used to advertise maximum number
of interfaces and profile periodicity supported by the driver.

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Co-developed-by: John Crispin <john@phrozen.org>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ee1590b16eff..075a307797d8 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8705,19 +8705,23 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 
 static const u8 ath11k_if_types_ext_capa[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 };
 
 static const u8 ath11k_if_types_ext_capa_sta[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 	[9] = WLAN_EXT_CAPA10_TWT_REQUESTER_SUPPORT,
 };
 
 static const u8 ath11k_if_types_ext_capa_ap[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 	[9] = WLAN_EXT_CAPA10_TWT_RESPONDER_SUPPORT,
+	[10] = WLAN_EXT_CAPA11_EMA_SUPPORT,
 };
 
 static const struct wiphy_iftype_ext_capab ath11k_iftypes_ext_capa[] = {
@@ -8938,6 +8942,9 @@ static int __ath11k_mac_register(struct ath11k *ar)
 				      NL80211_EXT_FEATURE_UNSOL_BCAST_PROBE_RESP);
 	}
 
+	ar->hw->wiphy->mbssid_max_interfaces = TARGET_NUM_VDEVS(ab);
+	ar->hw->wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
+
 	ath11k_reg_init(ar);
 
 	if (!test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags)) {
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
