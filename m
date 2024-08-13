Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A982AC52D7F
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmBoucqjTdVU4jvEzoHxwH39US3sy0JsoE2UfuwSyKg=; b=xAoM0p5pl11WHLxGM/nBga+VQM
	aoJAa+Laf4YhCIDFSGMwNshiCxiBpKSSzrYqqkoFNTj6KUvPqAmb8ExslcrCQSATHnOiQKcxfqD6d
	eIH1lI+NVdWSTHw0OythzlC1jlYt7MRLxCuJevuHA6TscpuLpQGrNrfBPa0s6VhyIkZvG0fZeCK3H
	PlPJ6Fbg6Zc8XS5q7mBy3rjGELpXllKNvv+FP3Xgc3pYbnRlxITpCoMwbTSRJk+gMbpD4qclJtVzY
	+NzjDyXkhFi20L2xgvoY0jRzvM2yxpRMooRLLtxnMNL64BRg0ez2pWVy75Nv1cx3Pa8rftkB8pZZD
	plHFdK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdt4e-000000048P5-14yS;
	Tue, 13 Aug 2024 15:04:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdt4Q-000000048MP-2qeA
	for ath11k@lists.infradead.org;
	Tue, 13 Aug 2024 15:04:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D8XbAh026741;
	Tue, 13 Aug 2024 15:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmBoucqjTdVU4jvEzoHxwH39US3sy0JsoE2UfuwSyKg=; b=kHf0qKYU+tOCw2fC
	yJMy5xYoN6iAYEdCaRESs0BCS7QuhnaFhOYBP8+EcIaYwjMQoWmf35ZlN4yWftgh
	p7Hy0XljiQqFJW6YzTJWdQSos6D/kSA8y1fJu+qxYaTE/EwO8O04zhZJw9wbFwUk
	ymxJ+Bc14U7GtCYczbVkmZyRyxbAmYXmLqy1I3oyweoi3RLe2z4GtgBCugY4SSdI
	xeb6G3B3rVF6rxrlnRSAZ+S8Y42cfP+ADNtKGOD1yaU1t4BkEC85+6G3MRgLpYsx
	yKpqga2GG5D0RHaaudKDFrflnePO0HJXBru0b3Q30xzG2QOtnPNKI6el6Vh7siDz
	mByCmA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410437s9ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 15:04:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47DF4Kse012715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 15:04:20 GMT
Received: from [10.111.178.117] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 08:04:19 -0700
Message-ID: <b995936c-484e-4a31-85be-decba7e47845@quicinc.com>
Date: Tue, 13 Aug 2024 08:04:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath11k: fix NULL pointer dereference in
 ath11k_mac_get_eirp_power()
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240813083808.9224-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240813083808.9224-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7Bu9DKsTaCesbnodz10kqvsWE5CUkVPu
X-Proofpoint-GUID: 7Bu9DKsTaCesbnodz10kqvsWE5CUkVPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_06,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408130108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_080422_980655_E41A9496 
X-CRM114-Status: GOOD (  12.36  )
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

On 8/13/2024 1:38 AM, Baochen Qiang wrote:
> Commit 39dc8b8ea387 ("wifi: mac80211: pass parsed TPE data to drivers") breaks
> ath11k, leading to kernel crash:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000018
> RIP: 0010:ath11k_mac_get_eirp_power.isra.0+0x5b/0x80 [ath11k]
> Call Trace:
>  <TASK>
>  ath11k_mac_fill_reg_tpc_info+0x3d6/0x800 [ath11k]
>  ath11k_mac_vdev_start_restart+0x412/0x4d0 [ath11k]
>  ath11k_mac_op_sta_state+0x7bc/0xbb0 [ath11k]
>  drv_sta_state+0xf1/0x5f0 [mac80211]
>  sta_info_insert_rcu+0x28d/0x530 [mac80211]
>  sta_info_insert+0xf/0x20 [mac80211]
>  ieee80211_prep_connection+0x3b4/0x4c0 [mac80211]
>  ieee80211_mgd_auth+0x363/0x600 [mac80211]
> 
> The issue scenario is, AP advertises power spectral density (PSD) values in its
> transmit power envelope (TPE) IE and supports 160 MHz bandwidth in 6 GHz. When
> connecting to this AP, in ath11k_mac_parse_tx_pwr_env(), the local variable
> psd is true and then reg_tpc_info.num_pwr_levels is set to 8 due to 160 MHz
> bandwidth. Note here ath11k fails to set reg_tpc_info.is_psd_power as TRUE due
> to above commit. Then in ath11k_mac_fill_reg_tpc_info(), for each of the 8
> power levels, for a PSD channel, ath11k_mac_get_psd_channel() is expected to
> be called to get required information. However due to invalid
> reg_tpc_info.is_psd_power, it is ath11k_mac_get_eirp_power() that gets called
> and passed with pwr_lvl_idx as one of the arguments. Note this function
> implicitly requires pwr_lvl_idx to be no more than 3. So when pwr_lvl_idx is
> larger than that ath11k_mac_get_seg_freq() returns invalid center frequency,
> with which as the input ieee80211_get_channel() returns NULL, then kernel
> crashes due to NULL pointer dereference.
> 
> Fix it by setting reg_tpc_info.is_psd_power properly.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Fixes: 39dc8b8ea387 ("wifi: mac80211: pass parsed TPE data to drivers")
> Reported-by: Mikko Tiihonen <mikko.tiihonen@iki.fi>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219131
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



