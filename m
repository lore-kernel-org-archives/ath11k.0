Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AD8C61DA4
	for <ath11k@archiver.kernel.org>; Wed, 15 Mar 2023 11:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8a89pae/FsjRt/cLiGWpECV6glTCs0HwPt2yraCnZQ=; b=M6fNS7lJCid9E7
	KiCvqMyx23z7LNvwoH/lGusAzOb6MV354BOvvrjFkGsIlGytjwhVvu2a3JF5VcEfTgizWe9Xdi+/i
	y98tsYPMJcqaUYq62T4Pntt+9a//DmN9CeXP/HtGnqF6yg3o9bVrJYPaf0oM9u1G0TxMNVBSdPF7V
	2RDzMYcXyOIMpDzmpuCAo0XS2QeC052KuDR6ENDjZ/KLw05dGfywpVgyMzdlneO2Aiq/xkP/VLwhe
	KpkJ2WC18CPs5uZvJXEPBQGog4hx/vAhztMHARldmD+UrCnk5HqNLgiteHbM1D9J1DOW1hPoMComj
	z5gNgLu2i7gqFh8q2K+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcOtW-00D8fx-09;
	Wed, 15 Mar 2023 11:02:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcOtT-00D8er-0b
	for ath11k@lists.infradead.org;
	Wed, 15 Mar 2023 11:02:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FALCOn007841;
	Wed, 15 Mar 2023 11:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jBcGdPD2nuIq4VuYEIiG3QkizwNeq1/wZcMM04tQNbg=;
 b=FWj3aN6HpFVS9crXJ+LkjIssDXisg/RmT8Vh4bd45K1z/ZMECkC6OAPLSMw1FM3jHS67
 oh4B/6ucAC7H3H/2ASuQcYWebARE3r4cw5u42FKCiEtGwjGTiZXrIt1Ub0/wRg50LbOW
 2Bn+nvy+d8fbaah3IRX83TDBWSE7xD9KF8iQsZV1QU7LEam+a5kvN3L7de0Hnr6Sv2kI
 9cn71MYPFRw3MXWnOsc/F7iHLhvtFoy0CwPszOPLAN2YuJiKW0KIbK3Pb9J2F23gbaSr
 156I1zT+rj3ImTdYgzdur+wDZoIcl8qZQgS6KpI93UWRZQW13nXvLUZP5u+fEGDk6Gd6 HQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pb2cr19u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 11:02:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32FB20Ze003942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 11:02:00 GMT
Received: from [10.252.219.228] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 15 Mar
 2023 04:01:25 -0700
Message-ID: <85d25269-fc1a-37dc-bbfb-632df54da696@quicinc.com>
Date: Wed, 15 Mar 2023 16:31:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] wifi: ath11k: Optimize 6 GHz scan time
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230309095220.1495-1-quic_mpubbise@quicinc.com>
 <167887615209.12266.424609891131575348.kvalo@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <167887615209.12266.424609891131575348.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aII5u28Z3uV6AtN97j5yGtdWgj4avfSL
X-Proofpoint-GUID: aII5u28Z3uV6AtN97j5yGtdWgj4avfSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_04,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_040207_340329_09D0C612 
X-CRM114-Status: GOOD (  15.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 3/15/2023 3:59 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:
> 
>> Currently, time taken to scan all supported channels on WCN6750
>> is ~8 seconds and connection time is almost 10 seconds. WCN6750
>> supports three Wi-Fi bands (i.e., 2.4/5/6 GHz) and the numbers of
>> channels for scan come around ~100 channels (default case).
>> Since the chip doesn't have support for DBS (Dual Band Simultaneous),
>> scans cannot be parallelized resulting in longer scan times.
>>
>> Among the 100 odd channels, ~60 channels are in 6 GHz band. Therefore,
>> optimizing the scan for 6 GHz channels will bring down the overall
>> scan time.
>>
>> WCN6750 firmware has support to scan a 6 GHz channel based on co-located
>> AP information i.e., RNR IE which is found in the legacy 2.4/5 GHz scan
>> results. When a scan request with all supported channel list is enqueued
>> to the firmware, then based on WMI_SCAN_CHAN_FLAG_SCAN_ONLY_IF_RNR_FOUND
>> scan channel flag, firmware will scan only those 6 GHz channels for which
>> RNR IEs are found in the legacy scan results.
>>
>> In the proposed design, based on NL80211_SCAN_FLAG_COLOCATED_6GHZ scan
>> flag, driver will set the WMI_SCAN_CHAN_FLAG_SCAN_ONLY_IF_RNR_FOUND flag
>> for non-PSC channels. Since there is high probability to find 6 GHz APs
>> on PSC channels, these channels are always scanned. Only non-PSC channels
>> are selectively scanned based on cached RNR information from the legacy
>> scan results.
>>
>> If NL80211_SCAN_FLAG_COLOCATED_6GHZ is not set in the scan flags,
>> then scan will happen on all supported channels (default behavior).
>>
>> With these optimizations, scan time is improved by 1.5-1.8 seconds on
>> WCN6750. Similar savings have been observed on WCN6855.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> Fails to apply, please rebase.
> 
> error: patch failed: drivers/net/wireless/ath/ath11k/wmi.h:2097
> error: drivers/net/wireless/ath/ath11k/wmi.h: patch does not apply
> stg import: Diff does not apply cleanly
> 
> Patch set to Changes Requested.

I'll rebase the patch and send v3.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
