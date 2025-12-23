Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440FEE6F078
	for <ath11k@archiver.kernel.org>; Tue, 23 Dec 2025 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sA7ngjkfqjCvpKQrWQGnrkcySyteAKpErgKaNVQMmk=; b=LgQO8GQbnKI9Yx7jN7sg4S2sp1
	17jMEjNbY9yIa+k+ALRcZjoFcDVYeWUZrV+F1gKRQP+NW/18bHZ0gh9S+pGp2S6BSOoSCLPUN8AbY
	jbCr0WM1GEydEKR0CnUkzwUkwbsPRR3i/M/K8xmLKj0ayYG1py8dJ5CSOYEynOO6Z66Feoyq9zrrX
	gi3f22IbKOEKehwwF9hkRkdXtw3OufHVbu2LNIZqf+mfoHE2u/EbTBmXQCgjlo+5ezAIv+jigaAz1
	ubXWtYvI1JRU7Vyh7PdhW1Suc0wQiMsupUelK/mVq64P1iXGU1TAL2YYocERw/gvhRQxDJUwsniM5
	c/j/q02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXygE-0000000Ekej-3y51;
	Tue, 23 Dec 2025 09:27:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXygD-0000000Ekcp-0KQg
	for ath11k@lists.infradead.org;
	Tue, 23 Dec 2025 09:27:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7xfUx4044452
	for <ath11k@lists.infradead.org>; Tue, 23 Dec 2025 09:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sA7ngjkfqjCvpKQrWQGnrkcySyteAKpErgKaNVQMmk=; b=GroaLiCfBdY4gPCw
	wkULyxkSeq+91NPeQ1mVMICvfEv95Nc+jLfVklCe8qD4izFh+eXtVPpM+ni+PmZD
	osHll/fbGQdw8OOKxLzqnDyeyAo3iR4aGEmfTRHKGLdqy90x6Cu+N08u5SWIxL9F
	VK79kmjfu1WTq55lVErEXQVPv867bFOqLVk7eb90bmofBHmtcuu3ULP9uIIlleRI
	SOHt9hanllnAMHST8+Cq8EaX7yMrUvDpOAvA0mz7LC0BXmsakCjqygEcCRw1fxrB
	4A/O3hq4dKWH3hf8IT++mdTl94yscQ1g0wYQ7PeSoqk/w/wcJgmWJW5nYiCvLtyq
	WIjdWw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha26f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 23 Dec 2025 09:27:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso13381806a91.0
        for <ath11k@lists.infradead.org>; Tue, 23 Dec 2025 01:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766482064; x=1767086864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sA7ngjkfqjCvpKQrWQGnrkcySyteAKpErgKaNVQMmk=;
        b=BPeDrf8Z9Ota2/qty79eGejUNG40wrgE6KCR5B8SKkehIuZ4pKJIaVHYeTUgzTMUL+
         CeVF60F72nfeOAnbUPPIndLIjixY5wDhnxB2SrLC6jAWLXu17ylrolbg3sUuoHsQEoVW
         JFvbv3qWTra7P4A9Twx73bItrT6IpS7VfCGv7EbOeKPv10savNMl1eih+KSkBscZvebn
         Qiwmanex5/kuqLNK5GNVNGqXN11nxMoNpuYAPLlg0sGxcO4dgfDIM5NGeEzCQ1ubGtZo
         iWwmnbnzdlR9UZa8w5SclIqOml9OocsBQEfrFW7QMeI2wL4WUit8EtccIkiCJGHoPLS0
         0PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482064; x=1767086864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9sA7ngjkfqjCvpKQrWQGnrkcySyteAKpErgKaNVQMmk=;
        b=jEuuuPNF0IqYaB6qo+06tGHerMOAPv/tvoBmqk+Mn3zWV6DmGR95eAWTHGiYEOX6Fo
         tXAx4qDC4WREjxbr2HMn5OZj9a19MTH9dqbUShEVF+1ppidH0JmxVPIXTh3nkbO77Zqd
         ZrouRSrZIaNBz93lBJekKJELCBha/GJY9ktrqveXrX9zXXUUIK0Vy96yHfR83e7A/UZb
         iCTqPsMn8xLRAtsatQcviw9Kk+u2xsD6QLzJ61BJ7VvBhhiDJTUdxpIRrSGOgdZpZgfI
         MLALfWHTlhEU88/NcidL/iTz1RAVQDEq/s500uy/P2DrVbgHW8soa7Ue9mvNCjlLF9pE
         bOJA==
X-Gm-Message-State: AOJu0Yysa5QzcLcJC78GIs0sSCy3J1h3ErBRMEE5OUbUsWTQV9/bE0mp
	CxzQ5I0HEOO6nPRkHdaWRLmMAPRe6DuZ5HoKz6niKoJqjtZDHfB+b38FjLjLMnIg8AmIAd2vQV4
	pFKOO1buEqyKMlUCJpAnumxrq6WxrGTbls8xavAwgfl5TXXeoCN8Bqz71q/evcCSSd6yHVcGqez
	8kFg==
X-Gm-Gg: AY/fxX4px86rqV61Q8Fx+Bn3wn8Q+75w1zb25PHjBxwAGBn8dMHed0cDzL6STL45fAP
	OdrhY4ZDGUDwdAyh3v2iBNgjKnjFvyc7WGNvSrYVXXNhOPhd3Vrfxb31alVZx0M1B5tgF60ZSSX
	5dyFSzll48Co81KYTi2Ekj5mX5zQAFi7o8xWonljQK9kxnnWRWzl/9Sygh/W0yQkTFNdnIU9fBe
	a44L6fBUdKzPlMQHQvhA+s7Hnirb+i4chLnBqcl9eLyrbHlF4zo/4H1PQQQHZoca8sKE7e+Ss3j
	6+MsNnkYVtcmgwuPIr7cf+L4+nAVRFK2dKfjLBqUMn+lzGvN0KmyqVNeD6GaghDFQ/JE7Yt+fcS
	rYRGJZLXqtMqwfbSBFpw7NwDbcVJvOcgF3og=
X-Received: by 2002:a05:7022:248c:b0:11b:3742:1257 with SMTP id a92af1059eb24-121722f63fdmr19424909c88.34.1766482063565;
        Tue, 23 Dec 2025 01:27:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoop4puHcTO88/9MOO4dasPj9+R95R6xf+dXaUX9QmYVwiLEszYwuL2P2+qABfbOlqJ8Ma8A==
X-Received: by 2002:a05:7022:248c:b0:11b:3742:1257 with SMTP id a92af1059eb24-121722f63fdmr19424884c88.34.1766482062936;
        Tue, 23 Dec 2025 01:27:42 -0800 (PST)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217243bbe3sm56130940c88.0.2025.12.23.01.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:27:42 -0800 (PST)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Qian Zhang <qian.zhang@oss.qualcomm.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH ath-next v4 3/6] wifi: ath11k: Add support unassociated client CFR
Date: Tue, 23 Dec 2025 14:57:25 +0530
Message-Id: <20251223092728.1950017-4-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com>
References: <20251223092728.1950017-1-qian.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2_bw01vQMy6uNsNhri084Sl9z4SpCftP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NSBTYWx0ZWRfX9JjKPVXDV82n
 TQ2EU8fE9U495cIEf7j3st/YINVvjlQ85D0Bt8p2FBAoMTI65Dt6JbKGnaTsdU38v1B/4tJR1ok
 TemzRZlbO0zpXRQ4chSmlZNMYmbZZBFXiQdD3b3gOYkofDpnzi1BGR2FJwigkPlHj8J1v702NoB
 xQ0pZXk3HlsyP4XD5vjFpzbqUqJwc40raFmKOHsJyXlAn2Ia5ntVIYwVe4X2zSYC/ja9pIV2FQb
 QRx5rEyIuLA0j9OAHWsVoz0JZkYXZwVgY19pCpO5XkObKr7vT0NuBUq8sm9AEHUPOAZI52zpJZr
 IDDnbyMvHZzLQVzJsBM59czi1SJ0Tvk2GQjMwT80w0VTnxQR7i6pmsPoMHibEcpnyiUK1k/pk5S
 IugLyGgLWw9VjJ1RGLX4UDZDCFfGLzHqunKJH3QcaYJlwluHS/nIPK6ZNV1lYK94Ymwcm8Kc8Kl
 jH1VY7rCnrqRAl3xFlw==
X-Proofpoint-GUID: 2_bw01vQMy6uNsNhri084Sl9z4SpCftP
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a6090 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=J6nKnfFvHuu1lZMax6MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_012745_146524_AF9302C7 
X-CRM114-Status: GOOD (  21.95  )
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

Provide debugfs interfaces support to config unassociated client CFR
from the user space.

To enable CFR capture for unassociated clients,

echo “<mac address> <val> <periodicity>”
 > /sys/kernel/debug/ieee80211/phyX/ath11k/cfr_unassoc

Mac address: mac address of the client.
Val: 0 - start CFR capture
     1 – stop CFR capture
Periodicity: Periodicity at which hardware is expected to collect CFR
dump.
     0 - single shot capture.
     non zero - for Periodic captures (value must be multiple of 10 ms)

Tested-on: IPQ8074 hw2.0 PCI IPQ8074 WLAN.HK.2.5.0.1-00991-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Co-developed-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: qian Zhang <qian.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/cfr.c | 228 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h |  33 ++++
 drivers/net/wireless/ath/ath11k/mac.c |  15 +-
 drivers/net/wireless/ath/ath11k/wmi.c |  16 +-
 drivers/net/wireless/ath/ath11k/wmi.h |   2 +-
 5 files changed, 290 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
index bf0b880e8746..e22b0151833c 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.c
+++ b/drivers/net/wireless/ath/ath11k/cfr.c
@@ -14,6 +14,60 @@ static int ath11k_cfr_process_data(struct ath11k *ar,
 	return 0;
 }
 
+/* Helper function to check whether the given peer mac address
+ * is in unassociated peer pool or not.
+ */
+bool ath11k_cfr_peer_is_in_cfr_unassoc_pool(struct ath11k *ar, const u8 *peer_mac)
+{
+	struct ath11k_cfr *cfr = &ar->cfr;
+	struct cfr_unassoc_pool_entry *entry;
+	int i;
+
+	if (!ar->cfr_enabled)
+		return false;
+
+	spin_lock_bh(&cfr->lock);
+	for (i = 0; i < ATH11K_MAX_CFR_ENABLED_CLIENTS; i++) {
+		entry = &cfr->unassoc_pool[i];
+		if (!entry->is_valid)
+			continue;
+
+		if (ether_addr_equal(peer_mac, entry->peer_mac)) {
+			spin_unlock_bh(&cfr->lock);
+			return true;
+		}
+	}
+
+	spin_unlock_bh(&cfr->lock);
+
+	return false;
+}
+
+void ath11k_cfr_update_unassoc_pool_entry(struct ath11k *ar,
+					  const u8 *peer_mac)
+{
+	struct ath11k_cfr *cfr = &ar->cfr;
+	struct cfr_unassoc_pool_entry *entry;
+	int i;
+
+	spin_lock_bh(&cfr->lock);
+	for (i = 0; i < ATH11K_MAX_CFR_ENABLED_CLIENTS; i++) {
+		entry = &cfr->unassoc_pool[i];
+		if (!entry->is_valid)
+			continue;
+
+		if (ether_addr_equal(peer_mac, entry->peer_mac) &&
+		    entry->period == 0) {
+			memset(entry->peer_mac, 0, ETH_ALEN);
+			entry->is_valid = false;
+			cfr->cfr_enabled_peer_cnt--;
+			break;
+		}
+	}
+
+	spin_unlock_bh(&cfr->lock);
+}
+
 void ath11k_cfr_decrement_peer_count(struct ath11k *ar,
 				     struct ath11k_sta *arsta)
 {
@@ -130,6 +184,59 @@ int ath11k_cfr_send_peer_cfr_capture_cmd(struct ath11k *ar,
 	return ret;
 }
 
+void ath11k_cfr_update_unassoc_pool(struct ath11k *ar,
+				    struct ath11k_per_peer_cfr_capture *params,
+				    u8 *peer_mac)
+{
+	struct ath11k_cfr *cfr = &ar->cfr;
+	struct cfr_unassoc_pool_entry *entry;
+	int available_idx = -1;
+	int i;
+
+	guard(spinlock_bh)(&cfr->lock);
+
+	if (!params->cfr_enable) {
+		for (i = 0; i < ATH11K_MAX_CFR_ENABLED_CLIENTS; i++) {
+			entry = &cfr->unassoc_pool[i];
+			if (ether_addr_equal(peer_mac, entry->peer_mac)) {
+				memset(entry->peer_mac, 0, ETH_ALEN);
+				entry->is_valid = false;
+				cfr->cfr_enabled_peer_cnt--;
+				break;
+			}
+		}
+		return;
+	}
+
+	if (cfr->cfr_enabled_peer_cnt >= ATH11K_MAX_CFR_ENABLED_CLIENTS) {
+		ath11k_info(ar->ab, "Max cfr peer threshold reached\n");
+		return;
+	}
+
+	for (i = 0; i < ATH11K_MAX_CFR_ENABLED_CLIENTS; i++) {
+		entry = &cfr->unassoc_pool[i];
+
+		if (ether_addr_equal(peer_mac, entry->peer_mac)) {
+			ath11k_info(ar->ab,
+				    "peer entry already present updating params\n");
+			entry->period = params->cfr_period;
+			available_idx = -1;
+			break;
+		}
+
+		if (available_idx < 0 && !entry->is_valid)
+			available_idx = i;
+	}
+
+	if (available_idx >= 0) {
+		entry = &cfr->unassoc_pool[available_idx];
+		ether_addr_copy(entry->peer_mac, peer_mac);
+		entry->period = params->cfr_period;
+		entry->is_valid = true;
+		cfr->cfr_enabled_peer_cnt++;
+	}
+}
+
 static ssize_t ath11k_read_file_enable_cfr(struct file *file,
 					   char __user *user_buf,
 					   size_t count, loff_t *ppos)
@@ -188,10 +295,127 @@ static const struct file_operations fops_enable_cfr = {
 	.llseek = default_llseek,
 };
 
+static ssize_t ath11k_write_file_cfr_unassoc(struct file *file,
+					     const char __user *ubuf,
+					     size_t count, loff_t *ppos)
+{
+	struct ath11k *ar = file->private_data;
+	struct ath11k_cfr *cfr = &ar->cfr;
+	struct cfr_unassoc_pool_entry *entry;
+	char buf[64] = {};
+	u8 peer_mac[6];
+	u32 cfr_capture_enable;
+	u32 cfr_capture_period;
+	int available_idx = -1;
+	int ret, i;
+
+	simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+
+	guard(mutex)(&ar->conf_mutex);
+	guard(spinlock_bh)(&cfr->lock);
+
+	if (ar->state != ATH11K_STATE_ON)
+		return -ENETDOWN;
+
+	if (!ar->cfr_enabled) {
+		ath11k_err(ar->ab, "CFR is not enabled on this pdev %d\n",
+			   ar->pdev_idx);
+		return -EINVAL;
+	}
+
+	ret = sscanf(buf, "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx %u %u",
+		     &peer_mac[0], &peer_mac[1], &peer_mac[2], &peer_mac[3],
+		     &peer_mac[4], &peer_mac[5], &cfr_capture_enable,
+		     &cfr_capture_period);
+
+	if (ret < 1)
+		return -EINVAL;
+
+	if (cfr_capture_enable && ret != 8)
+		return -EINVAL;
+
+	if (!cfr_capture_enable) {
+		for (i = 0; i < ATH11K_MAX_CFR_ENABLED_CLIENTS; i++) {
+			entry = &cfr->unassoc_pool[i];
+			if (ether_addr_equal(peer_mac, entry->peer_mac)) {
+				memset(entry->peer_mac, 0, ETH_ALEN);
+				entry->is_valid = false;
+				cfr->cfr_enabled_peer_cnt--;
+			}
+		}
+
+		return count;
+	}
+
+	if (cfr->cfr_enabled_peer_cnt >= ATH11K_MAX_CFR_ENABLED_CLIENTS) {
+		ath11k_info(ar->ab, "Max cfr peer threshold reached\n");
+		return count;
+	}
+
+	for (i = 0; i < ATH11K_MAX_CFR_ENABLED_CLIENTS; i++) {
+		entry = &cfr->unassoc_pool[i];
+
+		if (available_idx < 0 && !entry->is_valid)
+			available_idx = i;
+
+		if (ether_addr_equal(peer_mac, entry->peer_mac)) {
+			ath11k_info(ar->ab,
+				    "peer entry already present updating params\n");
+			entry->period = cfr_capture_period;
+			return count;
+		}
+	}
+
+	if (available_idx >= 0) {
+		entry = &cfr->unassoc_pool[available_idx];
+		ether_addr_copy(entry->peer_mac, peer_mac);
+		entry->period = cfr_capture_period;
+		entry->is_valid = true;
+		cfr->cfr_enabled_peer_cnt++;
+	}
+
+	return count;
+}
+
+static ssize_t ath11k_read_file_cfr_unassoc(struct file *file,
+					    char __user *ubuf,
+					    size_t count, loff_t *ppos)
+{
+	struct ath11k *ar = file->private_data;
+	struct ath11k_cfr *cfr = &ar->cfr;
+	struct cfr_unassoc_pool_entry *entry;
+	char buf[512] = {};
+	int len = 0, i;
+
+	spin_lock_bh(&cfr->lock);
+
+	for (i = 0; i < ATH11K_MAX_CFR_ENABLED_CLIENTS; i++) {
+		entry = &cfr->unassoc_pool[i];
+		if (entry->is_valid)
+			len += scnprintf(buf + len, sizeof(buf) - len,
+					 "peer: %pM period: %u\n",
+					 entry->peer_mac, entry->period);
+	}
+
+	spin_unlock_bh(&cfr->lock);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations fops_configure_cfr_unassoc = {
+	.write = ath11k_write_file_cfr_unassoc,
+	.read = ath11k_read_file_cfr_unassoc,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 static void ath11k_cfr_debug_unregister(struct ath11k *ar)
 {
 	debugfs_remove(ar->cfr.enable_cfr);
 	ar->cfr.enable_cfr = NULL;
+	debugfs_remove(ar->cfr.cfr_unassoc);
+	ar->cfr.cfr_unassoc = NULL;
 }
 
 static void ath11k_cfr_debug_register(struct ath11k *ar)
@@ -199,6 +423,10 @@ static void ath11k_cfr_debug_register(struct ath11k *ar)
 	ar->cfr.enable_cfr = debugfs_create_file("enable_cfr", 0600,
 						 ar->debug.debugfs_pdev, ar,
 						 &fops_enable_cfr);
+
+	ar->cfr.cfr_unassoc = debugfs_create_file("cfr_unassoc", 0600,
+						  ar->debug.debugfs_pdev, ar,
+						  &fops_configure_cfr_unassoc);
 }
 
 void ath11k_cfr_lut_update_paddr(struct ath11k *ar, dma_addr_t paddr,
diff --git a/drivers/net/wireless/ath/ath11k/cfr.h b/drivers/net/wireless/ath/ath11k/cfr.h
index 7d161f7f7be8..e7b69e98cbf5 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.h
+++ b/drivers/net/wireless/ath/ath11k/cfr.h
@@ -45,6 +45,12 @@ struct ath11k_look_up_table {
 	struct ath11k_dbring_element *buff;
 };
 
+struct cfr_unassoc_pool_entry {
+	u8 peer_mac[ETH_ALEN];
+	u32 period;
+	bool is_valid;
+};
+
 struct ath11k_cfr {
 	struct ath11k_dbring rx_ring;
 	/* Protects cfr data */
@@ -53,6 +59,7 @@ struct ath11k_cfr {
 	spinlock_t lut_lock;
 	struct ath11k_look_up_table *lut;
 	struct dentry *enable_cfr;
+	struct dentry *cfr_unassoc;
 	u8 cfr_enabled_peer_cnt;
 	u32 lut_num;
 	u64 tx_evt_cnt;
@@ -66,6 +73,7 @@ struct ath11k_cfr {
 	u64 clear_txrx_event;
 	u64 cfr_dma_aborts;
 	bool enabled;
+	struct cfr_unassoc_pool_entry unassoc_pool[ATH11K_MAX_CFR_ENABLED_CLIENTS];
 };
 
 enum ath11k_cfr_capture_method {
@@ -89,6 +97,13 @@ void ath11k_cfr_lut_update_paddr(struct ath11k *ar, dma_addr_t paddr,
 				 u32 buf_id);
 void ath11k_cfr_decrement_peer_count(struct ath11k *ar,
 				     struct ath11k_sta *arsta);
+void ath11k_cfr_update_unassoc_pool_entry(struct ath11k *ar,
+					  const u8 *peer_mac);
+bool ath11k_cfr_peer_is_in_cfr_unassoc_pool(struct ath11k *ar,
+					    const u8 *peer_mac);
+void ath11k_cfr_update_unassoc_pool(struct ath11k *ar,
+				    struct ath11k_per_peer_cfr_capture *params,
+				    u8 *peer_mac);
 int ath11k_cfr_send_peer_cfr_capture_cmd(struct ath11k *ar,
 					 struct ath11k_sta *arsta,
 					 struct ath11k_per_peer_cfr_capture *params,
@@ -114,6 +129,24 @@ static inline void ath11k_cfr_decrement_peer_count(struct ath11k *ar,
 {
 }
 
+static inline void ath11k_cfr_update_unassoc_pool_entry(struct ath11k *ar,
+							const u8 *peer_mac)
+{
+}
+
+static inline bool
+ath11k_cfr_peer_is_in_cfr_unassoc_pool(struct ath11k *ar, const u8 *peer_mac)
+{
+	return false;
+}
+
+static inline void
+ath11k_cfr_update_unassoc_pool(struct ath11k *ar,
+			       struct ath11k_per_peer_cfr_capture *params,
+			       u8 *peer_mac)
+{
+}
+
 static inline int
 ath11k_cfr_send_peer_cfr_capture_cmd(struct ath11k *ar,
 				     struct ath11k_sta *arsta,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4a9db5a6aee2..aeea58f3fac0 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6186,6 +6186,8 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
 	dma_addr_t paddr;
 	int buf_id;
 	int ret;
+	bool tx_params_valid = false;
+	bool peer_in_unassoc_pool;
 
 	ATH11K_SKB_CB(skb)->ar = ar;
 
@@ -6224,7 +6226,18 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	ATH11K_SKB_CB(skb)->paddr = paddr;
 
-	ret = ath11k_wmi_mgmt_send(ar, arvif->vdev_id, buf_id, skb);
+	peer_in_unassoc_pool = ath11k_cfr_peer_is_in_cfr_unassoc_pool(ar, hdr->addr1);
+
+	if (ar->cfr_enabled &&
+	    ieee80211_is_probe_resp(hdr->frame_control) &&
+	    peer_in_unassoc_pool)
+		tx_params_valid = true;
+
+	if (peer_in_unassoc_pool)
+		ath11k_cfr_update_unassoc_pool_entry(ar, hdr->addr1);
+
+	ret = ath11k_wmi_mgmt_send(ar, arvif->vdev_id, buf_id, skb,
+				   tx_params_valid);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to send mgmt frame: %d\n", ret);
 		goto err_unmap_buf;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index b14edc0820a2..b40a31414a47 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -651,11 +651,12 @@ static u32 ath11k_wmi_mgmt_get_freq(struct ath11k *ar,
 }
 
 int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
-			 struct sk_buff *frame)
+			 struct sk_buff *frame, bool tx_params_valid)
 {
 	struct ath11k_pdev_wmi *wmi = ar->wmi;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(frame);
 	struct wmi_mgmt_send_cmd *cmd;
+	struct wmi_mgmt_send_params *params;
 	struct wmi_tlv *frame_tlv;
 	struct sk_buff *skb;
 	u32 buf_len;
@@ -665,6 +666,8 @@ int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
 		  frame->len : WMI_MGMT_SEND_DOWNLD_LEN;
 
 	len = sizeof(*cmd) + sizeof(*frame_tlv) + roundup(buf_len, 4);
+	if (tx_params_valid)
+		len += sizeof(*params);
 
 	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
@@ -680,7 +683,7 @@ int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
 	cmd->paddr_hi = upper_32_bits(ATH11K_SKB_CB(frame)->paddr);
 	cmd->frame_len = frame->len;
 	cmd->buf_len = buf_len;
-	cmd->tx_params_valid = 0;
+	cmd->tx_params_valid = !!tx_params_valid;
 
 	frame_tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
 	frame_tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
@@ -690,6 +693,15 @@ int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
 
 	ath11k_ce_byte_swap(frame_tlv->value, buf_len);
 
+	if (tx_params_valid) {
+		params =
+		(struct wmi_mgmt_send_params *)(skb->data + (len - sizeof(*params)));
+		params->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TX_SEND_PARAMS) |
+				     FIELD_PREP(WMI_TLV_LEN,
+						sizeof(*params) - TLV_HDR_SIZE);
+		params->tx_params_dword1 |= WMI_TX_PARAMS_DWORD1_CFR_CAPTURE;
+	}
+
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_MGMT_TX_SEND_CMDID);
 	if (ret) {
 		ath11k_warn(ar->ab,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 1562d169ba9a..afc78fa4389b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -6391,7 +6391,7 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			u32 cmd_id);
 struct sk_buff *ath11k_wmi_alloc_skb(struct ath11k_wmi_base *wmi_sc, u32 len);
 int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
-			 struct sk_buff *frame);
+			 struct sk_buff *frame, bool tx_params_valid);
 int ath11k_wmi_p2p_go_bcn_ie(struct ath11k *ar, u32 vdev_id,
 			     const u8 *p2p_ie);
 int ath11k_wmi_bcn_tmpl(struct ath11k *ar, u32 vdev_id,
-- 
2.34.1


