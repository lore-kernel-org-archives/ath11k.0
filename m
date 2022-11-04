Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B263AC43217
	for <ath11k@archiver.kernel.org>; Fri,  4 Nov 2022 10:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beH6nh58PAzpTosiDDN6UDpTDyRJDi3fX4/FMGJDq6A=; b=vPiSxAhKp7Zi1f
	rESeJzV6XfawDiJ0AHQ5yR0YojUeJIHqgGNzR2F+sUK51QfTPOS2M3ppU9qTCleziOUmJYjX1o1Ph
	K/0vv17qXudOuk2tjuKvKydVbmvyAM9UfTNDhF7FVGjMyXAA1fecnIufdAOK6n2uXrahgvNnsZI+o
	wDx8Gt67TYZz5y3e4C3N8yMqplSfwxJ3pW3yfb+fLWFn4DQ5uEBrQ/o715i/mMxjtI3m1ZRjuBSl4
	jMLaFHuRHit+1Tb/G9Xyk1dtlzPjY/BjZV/ESQ1RksDgV87zvRKw6L+HEb+zeCEinFho3Tf5y4Oli
	BhMtrlhCtYtiOKJppYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oquHv-003Gga-G8; Fri, 04 Nov 2022 10:51:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oquHn-003GbD-2U
	for ath11k@lists.infradead.org; Fri, 04 Nov 2022 10:50:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A4AOC3j013740;
	Fri, 4 Nov 2022 10:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=A9giptHeWqvr+ADTpesZYe1XkQ6LUW6iP/WTxkN+epo=;
 b=EALXttxRlgQ2YaNw73CqA+RdkEDfOWHG0Q31evrdFdGQaGlRF4GrsAdC+UQiHwymdPjM
 jFtDsiltl1qYs8SruyiBrZbqjEEgYLiCxd/BtWviEoRcS4i0P50Gestzrd5m0GCYvq/Y
 MI0E/NHZt0kZS4ls74MYjb/tnbwygZEC4r0R8+lpagAYMpCVBfkXQKAdxU+EnoO85jLQ
 dlGvuZPimUzD0YCCOqw8MqD6A/fi3SorXcyEVA4YI6fz0xiAO+lRnkkDpKkyD1kNdkaM
 nfv/pPrFYsyJKEs9ps6ClbB1CAC5Mxw+tpJO6TxliLjb7AFiq+wKw9NKsBbMOtIJ8/oi 0Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kmvgk8m87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 10:50:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A4AohMu000518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Nov 2022 10:50:43 GMT
Received: from [10.206.64.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 4 Nov 2022
 03:50:41 -0700
Message-ID: <eb549cdc-01ef-2f9b-719c-3c2857e43313@quicinc.com>
Date: Fri, 4 Nov 2022 16:20:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2] wifi: ath11k: Trigger sta disconnect on hardware
 restart
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
References: <20221104085403.11025-1-quic_youghand@quicinc.com>
 <166755883456.9892.7557940279708188243.kvalo@kernel.org>
Content-Language: en-US
From: "Youghandhar Chintala (Temp)" <quic_youghand@quicinc.com>
In-Reply-To: <166755883456.9892.7557940279708188243.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6YEEfO5i_0bg_y_rdCcZG6yrRNg9Ft6S
X-Proofpoint-GUID: 6YEEfO5i_0bg_y_rdCcZG6yrRNg9Ft6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_07,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_035055_291669_52EBBE6E 
X-CRM114-Status: GOOD (  14.20  )
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


On 11/4/2022 4:17 PM, Kalle Valo wrote:
> Youghandhar Chintala <quic_youghand@quicinc.com> wrote:
>
>> Currently after the hardware restart triggered from the driver, the
>> station interface connection remains intact, since a disconnect trigger
>> is not sent to userspace. This can lead to a problem in targets where
>> the wifi mac sequence is added by the firmware.
>>
>> After the target restart, its wifi mac sequence number gets reset to
>> zero. Hence AP to which our device is connected will receive frames with
>> a  wifi mac sequence number jump to the past, thereby resulting in the
>> AP dropping all these frames, until the frame arrives with a wifi mac
>> sequence number which AP was expecting.
>>
>> To avoid such frame drops, its better to trigger a station disconnect
>> upon target hardware restart which can be done with API
>> ieee80211_reconfig_disconnect exposed to mac80211.
>>
>> The other targets are not affected by this change, since the hardware
>> params flag is not set.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>>
>> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> This had a new warning:
>
> drivers/net/wireless/ath/ath11k/mac.c:8056: Blank lines aren't necessary before a close brace '}'
>
> I fixed it in the pending branch.

Thank you Kalle.

Regards,

Youghandhar


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
