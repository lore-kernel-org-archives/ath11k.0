Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55722C52D7C
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I8wIVfjXOOTwLUjPgTAScnKaFhW7VjbjyVT+ndBv61A=; b=dGceHXsTUHqwcV+V3tK+KonHH+
	bI001OibtDUucHyYYDx6s4A6YCzcaMRRq7tMaEXRNF8HV97nPAr+ksY1FbWruonGz7gJWY4qSLjtM
	I+aV/PwxcKJKNE6uJuVmUPizwQGV5UdCbIMjQXlcnnRNNh/lH3u/Hp5Bq7F97czQh8Cc65boJyGRx
	sIRHkZp6Qow1zixbi8BHsOCqnrKpuQ3RMu0QRNAbSxjQv6KHTdVLnB6Yd3lOol5k9JHM02YT5Lvkg
	FIPNO4yWlBp0RIlvUeuZFJn9nbHlohoHCyDd82VQuoeoVNNcBCgcV8vX2oSomZN4S8XLzNjwaBy2y
	4eMiTnvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdn3W-00000002wCG-0m6s;
	Tue, 13 Aug 2024 08:39:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdn2u-00000002w5C-1R7a
	for ath11k@lists.infradead.org;
	Tue, 13 Aug 2024 08:38:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D3tprC003693;
	Tue, 13 Aug 2024 08:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I8wIVfjXOOTwLUjPgTAScn
	KaFhW7VjbjyVT+ndBv61A=; b=SnNYeaPal24E2YYgrwl+juK4IhkWRif1dRSlAp
	NnXPNvkxMT+d9Qs5rDD38f9rt40kA6VpzT+qL6wKknEM6RH+kxVFtbOc2S9jmqKy
	U8Q9lS7rvHQbweFtugSUjwYNz9uEPkPXDvPI1x92oNTzr1BCvQeLKguwmVPoRAlB
	aYXWsXX6tw0VMaGMwu+QTknJd8l/FC3ot69HcY/hTWxuTUf15uqmJSe7zDjuFnnl
	M1+9HvGmszRccrPGAAwDBVwZgXhXfWbB26/XWKYw98YS6bSTTAXYJw6+z/zbXQGY
	vhwRC22Jrcl89TfnO3sxTUQrmajolyI7lMZ76qAYzF0TstxQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x17sewhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 08:38:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47D8cLxB007036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 08:38:21 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 01:38:19 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH ath-current] wifi: ath11k: fix NULL pointer dereference in ath11k_mac_get_eirp_power()
Date: Tue, 13 Aug 2024 16:38:08 +0800
Message-ID: <20240813083808.9224-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pYwA4Wm6ejphJ6t_sV8NHhjZoMggwEFf
X-Proofpoint-ORIG-GUID: pYwA4Wm6ejphJ6t_sV8NHhjZoMggwEFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_01,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_013824_422448_799E0A73 
X-CRM114-Status: GOOD (  12.80  )
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

Commit 39dc8b8ea387 ("wifi: mac80211: pass parsed TPE data to drivers") breaks
ath11k, leading to kernel crash:

BUG: kernel NULL pointer dereference, address: 0000000000000018
RIP: 0010:ath11k_mac_get_eirp_power.isra.0+0x5b/0x80 [ath11k]
Call Trace:
 <TASK>
 ath11k_mac_fill_reg_tpc_info+0x3d6/0x800 [ath11k]
 ath11k_mac_vdev_start_restart+0x412/0x4d0 [ath11k]
 ath11k_mac_op_sta_state+0x7bc/0xbb0 [ath11k]
 drv_sta_state+0xf1/0x5f0 [mac80211]
 sta_info_insert_rcu+0x28d/0x530 [mac80211]
 sta_info_insert+0xf/0x20 [mac80211]
 ieee80211_prep_connection+0x3b4/0x4c0 [mac80211]
 ieee80211_mgd_auth+0x363/0x600 [mac80211]

The issue scenario is, AP advertises power spectral density (PSD) values in its
transmit power envelope (TPE) IE and supports 160 MHz bandwidth in 6 GHz. When
connecting to this AP, in ath11k_mac_parse_tx_pwr_env(), the local variable
psd is true and then reg_tpc_info.num_pwr_levels is set to 8 due to 160 MHz
bandwidth. Note here ath11k fails to set reg_tpc_info.is_psd_power as TRUE due
to above commit. Then in ath11k_mac_fill_reg_tpc_info(), for each of the 8
power levels, for a PSD channel, ath11k_mac_get_psd_channel() is expected to
be called to get required information. However due to invalid
reg_tpc_info.is_psd_power, it is ath11k_mac_get_eirp_power() that gets called
and passed with pwr_lvl_idx as one of the arguments. Note this function
implicitly requires pwr_lvl_idx to be no more than 3. So when pwr_lvl_idx is
larger than that ath11k_mac_get_seg_freq() returns invalid center frequency,
with which as the input ieee80211_get_channel() returns NULL, then kernel
crashes due to NULL pointer dereference.

Fix it by setting reg_tpc_info.is_psd_power properly.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Fixes: 39dc8b8ea387 ("wifi: mac80211: pass parsed TPE data to drivers")
Reported-by: Mikko Tiihonen <mikko.tiihonen@iki.fi>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219131
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 71ef89be823b..f8068d2e848c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7912,6 +7912,7 @@ static void ath11k_mac_parse_tx_pwr_env(struct ath11k *ar,
 	}
 
 	if (psd) {
+		arvif->reg_tpc_info.is_psd_power = true;
 		arvif->reg_tpc_info.num_pwr_levels = psd->count;
 
 		for (i = 0; i < arvif->reg_tpc_info.num_pwr_levels; i++) {

base-commit: 1462e8e1c93ecb96b5820ec28f7cbbb8a5aeb732
-- 
2.25.1


