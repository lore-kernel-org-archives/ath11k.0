Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403CAC64ED6
	for <ath11k@archiver.kernel.org>; Mon, 27 Feb 2023 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=op+LZeGjMMpixABDNTXTJZNa1GonQyVQromToM13WLo=; b=cbsRH3IKSu0ON5
	Uqh9qA0XSKsoL7GqkTJjOcieZUDlDp9pY4ZAETxE/zAcpOHGsy0pybPoCjx9BpQDFc60srCCRnMjb
	PjiqVl2kXLWZVRr8xoB6u9vSK9ToQnG6x5yNF6mvRQ8TFih9XFYOz7Hh2GNnJc31MMZhJpVQRYMsA
	7tvDZWf29mQdmguQX5L9pyztbLCALJem/I36a/+d4nAaVp+r5dvFag6/zOygyfqeDPAlzIUQIvf7W
	Nm8SCQ83bchEbmVCyblNDncVaFNZA1hcAi9dlfQrQuB5Y0MAOQwbhi2oyhfQg2Pu6A46C3TMRaSSv
	Wkyb1tOWXOZzMbAVNzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWb4M-009HxD-Tx; Mon, 27 Feb 2023 10:49:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWb4I-009Hw6-B0
	for ath11k@lists.infradead.org; Mon, 27 Feb 2023 10:49:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R7rIGA024285;
	Mon, 27 Feb 2023 10:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JDFuaKQWUZNcCm302JgXwZ3jPZ2XVcfcpGsT1XU/cL0=;
 b=Uqhba/WIQNjpVpFh8uPTS/fBoXLO57/FKiVlQidW5XhxSWaDKN//M7mjU2mz2+lq85Dd
 QefoCkE85nWUtXtCeYxsbluGL9Dc+I1C4T/nDgHG1sy6fY0HThczNIUBNNn2kCE3Lyb7
 ru27JFT5VZVg7O+vt0A4S9sNI2suyC8hnV8do0Kf6msquLZkJd9i1HnmUO4PMqCJ6Ove
 wqzizVEZdRY64MdhK75v+mD4qhwNzWpgAlP9C7E4aNsFiavcGux4DDQ02uD0ebOn0t4F
 ejURvio5xvcWpu5Wg24f9QG2rABMHhXSjEp/Ur8pwfOAr3l1nCVXCY0gIuU91yaJF0J2 yg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny9nuvn72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 10:49:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31RAnDe3015262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 10:49:13 GMT
Received: from [10.206.66.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 27 Feb
 2023 02:49:12 -0800
Message-ID: <9efc2082-d46d-5d57-d275-1cb47277f639@quicinc.com>
Date: Mon, 27 Feb 2023 16:19:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 3/3] ath11k: Enable low power mode when WLAN is not
 active
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230203060128.19625-1-quic_mpubbise@quicinc.com>
 <20230203060128.19625-4-quic_mpubbise@quicinc.com>
 <87cz5zruc6.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87cz5zruc6.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wE4GSn03VrcfQcRmnMxyHJBJpZNBX9jc
X-Proofpoint-GUID: wE4GSn03VrcfQcRmnMxyHJBJpZNBX9jc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=896 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_024918_540643_C12DDF7C 
X-CRM114-Status: GOOD (  23.97  )
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


On 2/24/2023 8:20 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> Currently, WLAN chip is powered once during driver probe and is kept
>> ON (powered) always even when WLAN is not active; keeping the chip
>> powered ON all the time will consume extra power which is not
>> desirable for a battery operated device. Same is the case with non-WoW
>> suspend, chip will never be put into low power mode when the system is
>> suspended resulting in higher battery drain.
>>
>> As per the recommendation, sending a PDEV suspend WMI command followed
>> by a QMI MODE OFF command will cease all WLAN activity and put the device
>> in low power mode. When WLAN interfaces are brought up, sending a QMI
>> MISSION MODE command would be sufficient to bring the chip out of low
>> power. This is a better approach than doing hif_power_down()/hif_power_up()
>> for every WiFi ON/OFF sequence since the turnaround time for entry/exit of
>> low power mode is much less. Overhead is just the time taken for sending
>> QMI MODE OFF & QMI MISSION MODE commands instead of going through the
>> entire chip boot & QMI init sequence.
>>
>> Currently the changes are applicable only for WCN6750. This can be
>> extended to other targets with a future patch.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> [...]
> 
>> +static int ath11k_ahb_core_start_ipq8074(struct ath11k_base *ab)
>> +{
>> +	/* TODO: Currently initializing the hardware/firmware only
>> +	 * during hardware recovery. Support to shutdown/turn-on
>> +	 * the hardware during Wi-Fi OFF/ON will be added later.
>> +	 */
>> +	if (!test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags))
>> +		return 0;
>> +
>> +	return ath11k_core_start_device(ab);
>> +}
>> +
>> +static void ath11k_ahb_core_stop_ipq8074(struct ath11k_base *ab)
>> +{
>> +	/* TODO: Currently stopping the hardware/firmware only
>> +	 * during driver unload. Support to shutdown/turn-on
>> +	 * the hardware during Wi-Fi OFF/ON will be added later.
>> +	 */
>> +	if (!test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags))
>> +		return;
>> +
>> +	return ath11k_core_stop_device(ab);
>> +}
> 
> Please clarify what Wi-Fi OFF/ON exactly means on these two comments,
> it's not clear for me.
>

  By Wi-Fi OFF/ON I mean is the bringing the last wlan interface down/up
which is nothing but the non-WoW suspend/resume.


> Also I want to mention that I suspect eventually we have to always power
> off the firmware during suspend to get hibernation working:
> 

This patch will power off the firmware for WCN6750. I'm not sure how to 
get that working for other ath11k devices.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
