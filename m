Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5E5CCD1A2
	for <ath11k@archiver.kernel.org>; Fri, 17 Oct 2025 04:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWolfLazVFYT84mp58WCfAKVs/5R8s1zPglUdTg+gis=; b=bfkFw/l6HJ73YWGqXBPEPeVPXk
	AQGjoyaw9tA/jIT8TP3W68MccJkcMN7RNJSM/2fDxY2g+YKULiVM4syyzDjPJ4vq1b7XTyWUDCcr+
	bYjct57H6/cienj/hJ5LUDBlHYY3rAA0B3QSBbTDVGTYGkPzipvWOAMTsszYvBEiO4Pbjzr8nc8+M
	atqXmTiL7MK4fRx0NhYhuQ/5KEiJ0ofVnaThZAyuqgWhNvN+BsCW5JUpx1AZCKikXze+VoC0seA73
	zfE7R1rMT5LOC2Sq4lBuM3oXyRyjB7KgMs8zhjpe5lKje57Cyi08a7pmOcSlDk2OuaaeqKtTqscBS
	s/VVmTsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9blI-00000006UuU-2dMx;
	Fri, 17 Oct 2025 04:08:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9blG-00000006UtK-1voD
	for ath11k@lists.infradead.org;
	Fri, 17 Oct 2025 04:08:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLThM028682
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 04:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWolfLazVFYT84mp58WCfAKVs/5R8s1zPglUdTg+gis=; b=F1ZXj4GrM3fQPJjk
	7g331XXg15LcXc21lt/oKyWMFI3ecoFwHEWcIYJdR8Um0Mav7jhvX8Vox/PnqxxM
	ItfTIquI/zS464lt2wFloU3nAKdOTssQwIv2bP5PIgAV/E4P+gYZxP17yeo5f36x
	gHOhet6a4g//2be958W8eqqnGNl0cnm/XWRgObW3YbhMEph5xK7ubI0L3O+eJJ6K
	AXhaarQguSlLQT3ImgXPw0qhpDSyRkLZlYd/ILb9f3A9x2R0T3y909cGg0hM7meh
	uJ5AgzMLzXcX+R77X193YPDCAB6xe3KB1SkasGmP/1St6waPCWgC1xLJMKq6pmXR
	hUPxgA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49u1h0tdwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 04:08:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2909e6471a9so11964365ad.0
        for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 21:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760674093; x=1761278893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWolfLazVFYT84mp58WCfAKVs/5R8s1zPglUdTg+gis=;
        b=BOmfVgH510vOYEPDFRUf6KZWg2TVi35aJpKkE6yo1A51P/yRXsvEcqQvR5Qmk0YLlP
         XySLfrO+fC5pzU+OYqF0t9d80Il27Hypdiz8IrkdKgHFT8xC7WlD3yc2ACXfI4kKLPOk
         bjwU/DGDXjaKBgzyoKeiQlEKk/mhIkXR4y+92Wh8nCnwjgp9x3LizsQ+hoUqdp1AN+ax
         Y5qdJSTcu18Yba0mgOyTsiEdlVviErq3/0nb4SQMUWHB6/4A5he/iMMXS5YrUqq2OQUr
         5ihIJJD1nFLWApSmgH3+VCdsBSUmHasoQhsPej4VQZyNpqMjLXRvg/34xNbKKf9+79jX
         39MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFtfqA4GiVk6vqUaeh1yPmDmH7ivZA4rOz8bsQRJQa0ExqAPk8KgJBMM1CIWr5ZTItTAcVyMg=@lists.infradead.org
X-Gm-Message-State: AOJu0YysFlXZNl8SsmppdIbcdxu0RUq0SJ1KOFXva7YWBNLP4F+4Es5w
	dKjjJPInUzkMGzkU2B6yEI/wTvTnQAwMPgPtmA94CdFGwTNNfbWT8UF1yE6id2JvpK/NR71mQnr
	jcmpbfqWPJWohUTHU1fp/Cfteq7mdsjYyWcaemPtk52MR+GGZJtXe5RxeJarjPQjU
X-Gm-Gg: ASbGncuB+OlQXJQp91YbyX9hVmnf6UZ9urP22J19FMtMr7tzmbQnVU2gIJT9R821Cyq
	Q3qIJgV89uthfE1IW/MSr4D8U11pa3kpMzcSoChyZ4opR0yStBwMeRpgBP+GCDlF6oHzLqG9FtQ
	nFzIphqY0dPcmXYnN3q2nmgAEnx4r75/CKYoTJ9QpofwUaE3wNIprALM0ZO1dGZmkuNeRVTHJzl
	cVM/25fYO0I5fVREZLhgRJB2qo9uaWuUgPVamNe5+5k9MTeu5FSegdp2g02NNutDgREhSJY7SJp
	4UcY4eVJDvxYgENNjgTXkGFm+0A35AY3mqou4hsIgPHoCn+p6F77cUcvDj1OnQtu6X4VIL4qqBf
	23Rp8Ug1iB2qU0w1InfMx5rEHAyqD5w01sxw6W+irv759IUkpUjtIMXvIh9NOMXBQNusuSd4TRD
	kLaf2rCM6v6EKZs1bCZRwulfU=
X-Received: by 2002:a17:902:ec87:b0:264:70e9:dcb1 with SMTP id d9443c01a7336-290cba481bemr29330365ad.56.1760674092883;
        Thu, 16 Oct 2025 21:08:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXQc/rF6+4aCLOlalhTrIqG/9+ZR208dHO2zKfTlxMoTdojrxoUaPi3LlK1PsMdL9w63V5vA==
X-Received: by 2002:a17:902:ec87:b0:264:70e9:dcb1 with SMTP id d9443c01a7336-290cba481bemr29330005ad.56.1760674092376;
        Thu, 16 Oct 2025 21:08:12 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7afcbsm47635345ad.76.2025.10.16.21.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:08:12 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 09:37:58 +0530
Subject: [PATCH ath-next 2/4] wifi: ath11k: wrap
 ath11k_mac_op_get_txpower() with lock-aware internal helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-add_tx_power_insertion_support-v1-2-f08feacfca93@oss.qualcomm.com>
References: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
In-Reply-To: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=esXSD4pX c=1 sm=1 tr=0 ts=68f1c12d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HHL2EbrfMguBWQQB2GUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Wg3U9bPbqdHocCwBOkWj_FQeub0RNuKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA5OSBTYWx0ZWRfXyjM+MUVivBY9
 aCvA6UKfjJlPHLZUNS281GUcHQf2QO6DS1JCRffKmC/ePsW+PIuQaru3eovSf1KC7mTyvXPTvqZ
 nfe7ECYBmoPfTit9CA/c+RkBoorh2pCV09KDxddzrqabrpBqiADPw1y9lIhduFNJgvAO1iKtOh3
 AGsZWfX4o8YbKF93zI9oqhgThSw8vbcX/F/xhNrLw7eDIGnyBOGXl71xdTCF1HKHRitlI+6xCME
 NOIOf1QWLD6BrQQhRih2zUiidh6sv9HCHOuz3aetFiRnVhgWEOQCM5alLYOIVggYtT4arSfgGn8
 RuHPCuK7psmlHVxmZBL6y2slMCjeYz7xN5x6qU/7gs+T9+ZG98UP/qnVd/5BNATR8YLzCY5k1VW
 mBooHG78Fq7C5ooifxLnS4qBHcXP4A==
X-Proofpoint-ORIG-GUID: Wg3U9bPbqdHocCwBOkWj_FQeub0RNuKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510160099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_210814_654580_582BB4B0 
X-CRM114-Status: GOOD (  13.20  )
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

Refactor ath11k_mac_op_get_txpower() by introducing a new internal function
ath11k_mac_handle_get_txpower(), which assumes the caller holds the
appropriate lock. This prepares the codebase for future change where the
internal function may be invoked directly with the lock already acquired,
improving modularity and lock handling consistency.

No functional change intended.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a7bd0ddf5fdf..cd6e98ee1232 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4103,12 +4103,10 @@ static int ath11k_mac_get_fw_stats(struct ath11k *ar, u32 pdev_id,
 	return ret;
 }
 
-static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
-				     struct ieee80211_vif *vif,
-				     unsigned int link_id,
-				     int *dbm)
+static int ath11k_mac_handle_get_txpower(struct ath11k *ar,
+					 struct ieee80211_vif *vif,
+					 int *dbm)
 {
-	struct ath11k *ar = hw->priv;
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_fw_stats_pdev *pdev;
 	int ret;
@@ -4119,15 +4117,13 @@ static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
 	 * of these. Hence, we request the FW pdev stats in which FW reports
 	 * the minimum of all vdev's channel Tx power.
 	 */
-	mutex_lock(&ar->conf_mutex);
+	lockdep_assert_held(&ar->conf_mutex);
 
 	/* Firmware doesn't provide Tx power during CAC hence no need to fetch
 	 * the stats.
 	 */
-	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
-		mutex_unlock(&ar->conf_mutex);
+	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags))
 		return -EAGAIN;
-	}
 
 	ret = ath11k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
 				      WMI_REQUEST_PDEV_STAT);
@@ -4148,14 +4144,12 @@ static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
 	*dbm = pdev->chan_tx_power / 2;
 
 	spin_unlock_bh(&ar->data_lock);
-	mutex_unlock(&ar->conf_mutex);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "txpower from firmware %d, reported %d dBm\n",
 		   pdev->chan_tx_power, *dbm);
 	return 0;
 
 err_fallback:
-	mutex_unlock(&ar->conf_mutex);
 	/* We didn't get txpower from FW. Hence, relying on vif->bss_conf.txpower */
 	*dbm = vif->bss_conf.txpower;
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "txpower from firmware NaN, reported %d dBm\n",
@@ -4163,6 +4157,21 @@ static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
 	return 0;
 }
 
+static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
+				     struct ieee80211_vif *vif,
+				     unsigned int link_id,
+				     int *dbm)
+{
+	struct ath11k *ar = hw->priv;
+	int ret;
+
+	mutex_lock(&ar->conf_mutex);
+	ret = ath11k_mac_handle_get_txpower(ar, vif, dbm);
+	mutex_unlock(&ar->conf_mutex);
+
+	return ret;
+}
+
 static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 				 struct ieee80211_vif *vif,
 				 struct ieee80211_scan_request *hw_req)

-- 
2.34.1


