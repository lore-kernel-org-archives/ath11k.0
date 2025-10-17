Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8766CCD199
	for <ath11k@archiver.kernel.org>; Fri, 17 Oct 2025 04:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF1qbmeFyQyWyqzjkXpojfq3u9UdcWSnsZnd7x6nRMQ=; b=CIzi164fEIys+mcVAbYssNB7ku
	O15SZbRNgghL61Buy6wNicGNuBJhaG8iCqiowWmYYvkeA70JFfVuSQEtqgUbVkBF27p74bX+5XulX
	sfErvE9xRa5j3pqSZV/WuQqNEtt1GKtprMvna4+mBoJIUhmCFaM6dJeb8ohfigIbNcydel4kWgA0C
	AFMx/wB22VN0h+yHDBmcajQuB3odeUDoQB1s9ZdDUmyjcLZuYgzleb2jFVrCpfAAR94HILX7RDTij
	YumwuzsqMi4w+YkF/AvyIn4IRCcE6kimnSmOsuCFpVa/jXO6nGDu0tSnuTgpApDsf7ldmCPNKwULD
	R/nlHUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9blI-00000006Uu4-0SRq;
	Fri, 17 Oct 2025 04:08:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9blF-00000006Usr-04BH
	for ath11k@lists.infradead.org;
	Fri, 17 Oct 2025 04:08:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLPpF025253
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 04:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EF1qbmeFyQyWyqzjkXpojfq3u9UdcWSnsZnd7x6nRMQ=; b=hIrBQLWhlXI2+hFb
	Yfr++9gdu9hA3LLr9JBgB+obUI7iEK3+B5mIZCOSghrAq7Spm8MJmHVvunnygSAl
	dwjnrCkb7AVmD0gIqpJy6CDhQ8G1Oy2ujNmSGG+Rl5DfNMga2W3Cmo6mvCdYAssi
	Svsw6ltLLMUA7Tn5uElpaujOcIvlQcBBirB4GnJrZjsJ5+BeDWAF4rm8tDuCqBp6
	TuSFooFc1+xdjKBxQplTnDyeYLRJj2kAHUNkr7WxINB0f52E/YOmQSr43qN2yfs9
	ARL7h848ptaZsZ+I7AmnIUa42yEFYUcqoUT3Es/kox75juEC1ZKBHEC+KHCYlj5I
	tO3gUg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkjrgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 04:08:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26985173d8eso32631475ad.1
        for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 21:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760674091; x=1761278891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EF1qbmeFyQyWyqzjkXpojfq3u9UdcWSnsZnd7x6nRMQ=;
        b=fiMk2cVSW2XVNuBCQnNLuOwupWir0AI4e4c8FvpAp9luQTIgpTV79S7MjSNhpBq/El
         udQkHgyiF3QrKV0oreHi33u7q4y3g3agbLnor+BYrySL7J9sHQHtaljyg1bFtq6OZ2M7
         EYQWy9rLXhpoyE1AC4dglbIGTRNY3OuytfyHHzc2En0zFzPk58DVCx3sZj+Dnm1wKXBV
         WQhzymUJsWANglDwavgvvvRqi7cLjCygD4I76wsnOaz0TsCw0b4dymSiyTnX4vFerDV5
         uZx9nxzldsNAyFRmvs+q42He24BdbQkQFB7SAn8aro5EVzIRNS6n6YQVg3zMMWYE4iPu
         2Xgg==
X-Forwarded-Encrypted: i=1; AJvYcCXvuiwULz5WhLXPsonrcXHsPMOAQgRaQ1Hen6eichBNbjQhsybBCMALbPURObNpSaio5glvzkM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOMdtqal0tZRCiBJtm7oUDY5Gfix2vjdHpSaQVdotHL0dpsT8j
	DA+OayY+sLCQAaXVu/PGQDgosrMxTX1hkb5J13/T77+O9Vk0VUkNpHDE6spkOpG4JbKtYFngS63
	LLUHUwx4BP1Np1jwfiw0cwkQiNzoAAaF3jwCCSVhXZIsKC2SdX/E0tuSsknoFTDIH
X-Gm-Gg: ASbGncu8wcZ/P5FWBqnxqcnpIZjDYWXxn0jFVcYUCroXMIb4oJeg/IyW8duH5q6n71j
	vaM2kUjUocYK3kEltYt9JPlY6OKwD3zG///zc7G4XmCE+U1SkUvFCsn2pHmsvbmWw1v7Eo6LTKv
	93zRsUuElPeshQlb72HJSEJqkRcyuy691T9P5LQbfk8/Ni9tUaGLPLhFf+X5WKYV1G9JISI9jBK
	EZ7d4Ru53NhcFxQFZWnsLYa5SXq3Nbdf445iefK5l8ax2fVZQNn2Prr7EUKY4zcLNtFdgscb5HZ
	2az0sGNN1OPj01tc66z59SMt1jwqK2DCNqnvgn6zC/jk98l+qGieu+Ocl6Alq0fT+O0nzf8zaWo
	+95iSTwWk9g7waHSuL3T71j5ZIaHb6N68g0qtVfqMALpIBc5RjE3nJOyr4CCOdc8sgO6XzIspL6
	dgf9XvbZYGSTnQiX6e7n7IvbA=
X-Received: by 2002:a17:903:46c7:b0:274:aab9:4ed4 with SMTP id d9443c01a7336-290cb65f861mr28662205ad.57.1760674090709;
        Thu, 16 Oct 2025 21:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYZ//wDhpZNdjOOqwxCLJUlSkjpBoq4u/LLVBhCq3t3hCocjGsXJZenz8XfT/xsP0zsVXQ/Q==
X-Received: by 2002:a17:903:46c7:b0:274:aab9:4ed4 with SMTP id d9443c01a7336-290cb65f861mr28661925ad.57.1760674090279;
        Thu, 16 Oct 2025 21:08:10 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7afcbsm47635345ad.76.2025.10.16.21.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:08:09 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 09:37:57 +0530
Subject: [PATCH ath-next 1/4] wifi: ath11k: relocate some Tx power related
 functions in mac.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-add_tx_power_insertion_support-v1-1-f08feacfca93@oss.qualcomm.com>
References: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
In-Reply-To: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: vlESBg4wVEQWlCnvlvx7REALatkWuNDz
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f1c12c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xoC9ZPpSTKSxfhOel_IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vlESBg4wVEQWlCnvlvx7REALatkWuNDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwzJntalvGr5S
 zCoEmv7pbrSKDDxiHNa3qs+J7Er0p+a2g2WtzJGtt4ZolNrRrj3gt67o0/s09H4GLBmTCB1K2Xd
 x2L7J+xc5Qhfx8E52Md5d77hBacZ5SqyI90B+1mkOBvVoPwLDcin4HJnveQcBcP9P9sUMuoE7Lv
 8QnMkcwR5IKjCpdii9fPheTMh7lbd99lvyGfNdtR26/G0VLh9sZsCnlviNLgpbEkUlg5JL3RvdZ
 oPXqEK94xbQIBporZ/xFL3qi3t9yDYNNbxyBmeH0ET2bVhFRbm0nSOFRmrR8u6Sttlx0ygUkLky
 I0gunbkL1TRV4tf6RCcVRYoVAHLBYgZeh6DB1q+jdkS7tU2kd+MWS/21Q01AQhMJbrdNQPNmxVQ
 2fl1G5hEEok87VSyD/I0NmtiL3HQ3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1011 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_210813_182493_6C08B3FB 
X-CRM114-Status: GOOD (  20.47  )
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

A forthcoming change necessitates that these functions be defined prior to
their usage. Therefore, relocate them now as a preparatory step for the
upcoming modifications.

Compile tested only.

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 270 +++++++++++++++++-----------------
 1 file changed, 135 insertions(+), 135 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 0e41b5a91d66..a7bd0ddf5fdf 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4028,6 +4028,141 @@ static int ath11k_start_scan(struct ath11k *ar,
 	return 0;
 }
 
+static void ath11k_mac_fw_stats_reset(struct ath11k *ar)
+{
+	spin_lock_bh(&ar->data_lock);
+	ath11k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
+	ath11k_fw_stats_vdevs_free(&ar->fw_stats.vdevs);
+	ar->fw_stats.num_vdev_recvd = 0;
+	ar->fw_stats.num_bcn_recvd = 0;
+	spin_unlock_bh(&ar->data_lock);
+}
+
+int ath11k_mac_fw_stats_request(struct ath11k *ar,
+				struct stats_request_params *req_param)
+{
+	struct ath11k_base *ab = ar->ab;
+	unsigned long time_left;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	ath11k_mac_fw_stats_reset(ar);
+
+	reinit_completion(&ar->fw_stats_complete);
+	reinit_completion(&ar->fw_stats_done);
+
+	ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
+
+	if (ret) {
+		ath11k_warn(ab, "could not request fw stats (%d)\n",
+			    ret);
+		return ret;
+	}
+
+	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
+	if (!time_left)
+		return -ETIMEDOUT;
+
+	/* FW stats can get split when exceeding the stats data buffer limit.
+	 * In that case, since there is no end marking for the back-to-back
+	 * received 'update stats' event, we keep a 3 seconds timeout in case,
+	 * fw_stats_done is not marked yet
+	 */
+	time_left = wait_for_completion_timeout(&ar->fw_stats_done, 3 * HZ);
+	if (!time_left)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int ath11k_mac_get_fw_stats(struct ath11k *ar, u32 pdev_id,
+				   u32 vdev_id, u32 stats_id)
+{
+	struct ath11k_base *ab = ar->ab;
+	struct stats_request_params req_param;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (ar->state != ATH11K_STATE_ON)
+		return -ENETDOWN;
+
+	req_param.pdev_id = pdev_id;
+	req_param.vdev_id = vdev_id;
+	req_param.stats_id = stats_id;
+
+	ret = ath11k_mac_fw_stats_request(ar, &req_param);
+	if (ret)
+		ath11k_warn(ab, "failed to request fw stats: %d\n", ret);
+
+	ath11k_dbg(ab, ATH11K_DBG_WMI,
+		   "debug get fw stat pdev id %d vdev id %d stats id 0x%x\n",
+		   pdev_id, vdev_id, stats_id);
+
+	return ret;
+}
+
+static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
+				     struct ieee80211_vif *vif,
+				     unsigned int link_id,
+				     int *dbm)
+{
+	struct ath11k *ar = hw->priv;
+	struct ath11k_base *ab = ar->ab;
+	struct ath11k_fw_stats_pdev *pdev;
+	int ret;
+
+	/* Final Tx power is minimum of Target Power, CTL power, Regulatory
+	 * Power, PSD EIRP Power. We just know the Regulatory power from the
+	 * regulatory rules obtained. FW knows all these power and sets the min
+	 * of these. Hence, we request the FW pdev stats in which FW reports
+	 * the minimum of all vdev's channel Tx power.
+	 */
+	mutex_lock(&ar->conf_mutex);
+
+	/* Firmware doesn't provide Tx power during CAC hence no need to fetch
+	 * the stats.
+	 */
+	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
+		mutex_unlock(&ar->conf_mutex);
+		return -EAGAIN;
+	}
+
+	ret = ath11k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
+				      WMI_REQUEST_PDEV_STAT);
+	if (ret) {
+		ath11k_warn(ab, "failed to request fw pdev stats: %d\n", ret);
+		goto err_fallback;
+	}
+
+	spin_lock_bh(&ar->data_lock);
+	pdev = list_first_entry_or_null(&ar->fw_stats.pdevs,
+					struct ath11k_fw_stats_pdev, list);
+	if (!pdev) {
+		spin_unlock_bh(&ar->data_lock);
+		goto err_fallback;
+	}
+
+	/* tx power is set as 2 units per dBm in FW. */
+	*dbm = pdev->chan_tx_power / 2;
+
+	spin_unlock_bh(&ar->data_lock);
+	mutex_unlock(&ar->conf_mutex);
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "txpower from firmware %d, reported %d dBm\n",
+		   pdev->chan_tx_power, *dbm);
+	return 0;
+
+err_fallback:
+	mutex_unlock(&ar->conf_mutex);
+	/* We didn't get txpower from FW. Hence, relying on vif->bss_conf.txpower */
+	*dbm = vif->bss_conf.txpower;
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "txpower from firmware NaN, reported %d dBm\n",
+		   *dbm);
+	return 0;
+}
+
 static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 				 struct ieee80211_vif *vif,
 				 struct ieee80211_scan_request *hw_req)
@@ -9079,81 +9214,6 @@ static void ath11k_mac_put_chain_rssi(struct station_info *sinfo,
 	}
 }
 
-static void ath11k_mac_fw_stats_reset(struct ath11k *ar)
-{
-	spin_lock_bh(&ar->data_lock);
-	ath11k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
-	ath11k_fw_stats_vdevs_free(&ar->fw_stats.vdevs);
-	ar->fw_stats.num_vdev_recvd = 0;
-	ar->fw_stats.num_bcn_recvd = 0;
-	spin_unlock_bh(&ar->data_lock);
-}
-
-int ath11k_mac_fw_stats_request(struct ath11k *ar,
-				struct stats_request_params *req_param)
-{
-	struct ath11k_base *ab = ar->ab;
-	unsigned long time_left;
-	int ret;
-
-	lockdep_assert_held(&ar->conf_mutex);
-
-	ath11k_mac_fw_stats_reset(ar);
-
-	reinit_completion(&ar->fw_stats_complete);
-	reinit_completion(&ar->fw_stats_done);
-
-	ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
-
-	if (ret) {
-		ath11k_warn(ab, "could not request fw stats (%d)\n",
-			    ret);
-		return ret;
-	}
-
-	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
-	if (!time_left)
-		return -ETIMEDOUT;
-
-	/* FW stats can get split when exceeding the stats data buffer limit.
-	 * In that case, since there is no end marking for the back-to-back
-	 * received 'update stats' event, we keep a 3 seconds timeout in case,
-	 * fw_stats_done is not marked yet
-	 */
-	time_left = wait_for_completion_timeout(&ar->fw_stats_done, 3 * HZ);
-	if (!time_left)
-		return -ETIMEDOUT;
-
-	return 0;
-}
-
-static int ath11k_mac_get_fw_stats(struct ath11k *ar, u32 pdev_id,
-				   u32 vdev_id, u32 stats_id)
-{
-	struct ath11k_base *ab = ar->ab;
-	struct stats_request_params req_param;
-	int ret;
-
-	lockdep_assert_held(&ar->conf_mutex);
-
-	if (ar->state != ATH11K_STATE_ON)
-		return -ENETDOWN;
-
-	req_param.pdev_id = pdev_id;
-	req_param.vdev_id = vdev_id;
-	req_param.stats_id = stats_id;
-
-	ret = ath11k_mac_fw_stats_request(ar, &req_param);
-	if (ret)
-		ath11k_warn(ab, "failed to request fw stats: %d\n", ret);
-
-	ath11k_dbg(ab, ATH11K_DBG_WMI,
-		   "debug get fw stat pdev id %d vdev id %d stats id 0x%x\n",
-		   pdev_id, vdev_id, stats_id);
-
-	return ret;
-}
-
 static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 					 struct ieee80211_vif *vif,
 					 struct ieee80211_sta *sta,
@@ -9539,66 +9599,6 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	return ret;
 }
 
-static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
-				     struct ieee80211_vif *vif,
-				     unsigned int link_id,
-				     int *dbm)
-{
-	struct ath11k *ar = hw->priv;
-	struct ath11k_base *ab = ar->ab;
-	struct ath11k_fw_stats_pdev *pdev;
-	int ret;
-
-	/* Final Tx power is minimum of Target Power, CTL power, Regulatory
-	 * Power, PSD EIRP Power. We just know the Regulatory power from the
-	 * regulatory rules obtained. FW knows all these power and sets the min
-	 * of these. Hence, we request the FW pdev stats in which FW reports
-	 * the minimum of all vdev's channel Tx power.
-	 */
-	mutex_lock(&ar->conf_mutex);
-
-	/* Firmware doesn't provide Tx power during CAC hence no need to fetch
-	 * the stats.
-	 */
-	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
-		mutex_unlock(&ar->conf_mutex);
-		return -EAGAIN;
-	}
-
-	ret = ath11k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
-				      WMI_REQUEST_PDEV_STAT);
-	if (ret) {
-		ath11k_warn(ab, "failed to request fw pdev stats: %d\n", ret);
-		goto err_fallback;
-	}
-
-	spin_lock_bh(&ar->data_lock);
-	pdev = list_first_entry_or_null(&ar->fw_stats.pdevs,
-					struct ath11k_fw_stats_pdev, list);
-	if (!pdev) {
-		spin_unlock_bh(&ar->data_lock);
-		goto err_fallback;
-	}
-
-	/* tx power is set as 2 units per dBm in FW. */
-	*dbm = pdev->chan_tx_power / 2;
-
-	spin_unlock_bh(&ar->data_lock);
-	mutex_unlock(&ar->conf_mutex);
-
-	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "txpower from firmware %d, reported %d dBm\n",
-		   pdev->chan_tx_power, *dbm);
-	return 0;
-
-err_fallback:
-	mutex_unlock(&ar->conf_mutex);
-	/* We didn't get txpower from FW. Hence, relying on vif->bss_conf.txpower */
-	*dbm = vif->bss_conf.txpower;
-	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "txpower from firmware NaN, reported %d dBm\n",
-		   *dbm);
-	return 0;
-}
-
 static int ath11k_mac_station_add(struct ath11k *ar,
 				  struct ieee80211_vif *vif,
 				  struct ieee80211_sta *sta)

-- 
2.34.1


