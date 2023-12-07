Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C260C4167B
	for <ath11k@archiver.kernel.org>; Thu,  7 Dec 2023 03:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIA+ZnNaGmgLnZm9jrOoD4FcK/drU2Lm16D28iGXia4=; b=xnBEjtX14WYqTJDqe3jqEw6yAh
	PNxgcMItBxHubzNrarCwYiFDH8alAF6bE75Pf1gibpX1qIkX2m2esxDg1pvJldRm27QKNYnah63mO
	E1sRCDdxg5j0duSAXqdqwqJFVKTQ5CEGmvVHa125wKTQV6+mgeZMgY6gduINXFCY9uexjHmkHrFEp
	VavU8+zzwtvLzas/oqcmcut1O8nltS1G7k/9FZAc2EbV5AquuUpOQXC2yxMOAi3YZ3hKxHhKF7t/f
	yTaRLmpeBultNlzetMeDdLbSw/nMGPLlJee2f7i7xEC4zQM+pEAtOZNSg4l4do9eyvF2BKGy5joDX
	4Mlaqp9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB57D-00Blk5-0g;
	Thu, 07 Dec 2023 03:31:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB57A-00Blja-1J
	for ath11k@lists.infradead.org;
	Thu, 07 Dec 2023 03:31:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B6MTOv8032380;
	Thu, 7 Dec 2023 03:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zIA+ZnNaGmgLnZm9jrOoD4FcK/drU2Lm16D28iGXia4=;
 b=EqB2DJHl3qy//yNYzi4TCKSDfM2CLxBRUxLKtbRBFocapdYS9SOCiZkyT7TIxgdmNhak
 Hm8B9Oydi29zAJI5vU3XXnPK4HeMTawPDWu9ErYTjiHatXfnYpZ7rQBBs8YbNodwUn/z
 yW7quXNUC4Mxw9ElkloikmG9DeQXcs8e7JvfdqPjaX/zMNwLAEp/BZlBsd2Pslv+vjhp
 i5P/n/Y5Vda1bH2UET5xqGpdK/bNqu5hBnIhnl+VbRZv9odk88ey7LQQy8KJILddW/go
 xx5GpD2b5yF3cRDhtnDVJwRKijurT09zUQOnYSHxZHuKaQ4AAuQFsAMc5ej2KebmiFpc ew== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utrwq20cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 03:31:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B73Voq3005712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Dec 2023 03:31:50 GMT
Received: from [10.216.30.117] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 19:31:49 -0800
Message-ID: <189b7768-4783-48e9-9a3d-a986b70a2508@quicinc.com>
Date: Thu, 7 Dec 2023 09:01:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/12] wifi: ath11k: discard BSS_CHANGED_TXPOWER when
 EXT_TPC_REG_SUPPORT for 6 GHz
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231204081323.5582-1-quic_bqiang@quicinc.com>
 <20231204081323.5582-13-quic_bqiang@quicinc.com>
 <33d629b1-674e-42c1-8969-18fa636d370c@quicinc.com>
 <2337a414-4aa2-47ad-8cc4-a631de15ea6f@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <2337a414-4aa2-47ad-8cc4-a631de15ea6f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: toB7FczcEyzUP4YmLTo_vocQuwRlTUi4
X-Proofpoint-GUID: toB7FczcEyzUP4YmLTo_vocQuwRlTUi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_22,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312070027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_193152_464863_1D1EC514 
X-CRM114-Status: GOOD (  18.45  )
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

On 12/6/23 11:04, Baochen Qiang wrote:
> 
> 
> On 12/4/2023 11:53 PM, Aditya Kumar Singh wrote:
>> On 12/4/23 13:43, Baochen Qiang wrote:
>>> From: Wen Gong <quic_wgong@quicinc.com>
>>>
>>> When station is connected to a 6 GHz AP, it has 2 ways to configure
>>> the power limit to firmware. The first way is to send 2 WMI commands
>>> WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G to
>>> firmware, the second way is to send WMI_VDEV_SET_TPC_POWER_CMDID to
>>> firmware which include more parameters for power control.
>>>
>>> When firmware support SERVICE_EXT_TPC_REG, it means firmware support
>>> the second way for WMI_VDEV_SET_TPC_POWER_CMDID, then ath11k discard
>>> BSS_CHANGED_TXPOWER flag from mac80211 which is used to the first way
>>> for 6 GHz band and select the second way.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI 
>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>>>
>>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>>> ---
>> ...snip...
>>> @@ -3596,9 +3608,13 @@ static void 
>>> ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>>>       if (changed & BSS_CHANGED_TXPOWER) {
>>>           ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "vdev_id %i txpower %d\n",
>>>                  arvif->vdev_id, info->txpower);
>>> -
>>> -        arvif->txpower = info->txpower;
>>> -        ath11k_mac_txpower_recalc(ar);
>>> +        if (ath11k_mac_supports_station_tpc(ar, arvif, 
>>> &info->chandef)) {
>>> +            ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
>>> +                   "discard tx power, change to set TPC power\n");
>>> +        } else {
>>> +            arvif->txpower = info->txpower;
>>> +            ath11k_mac_txpower_recalc(ar);
>>> +        }
>>
>> Could you check v6 once? I remember Wen told he would drop this check 
>> and let FW take the min value. If we do like this, then user could not 
>> set his own desired value even if that is well inside the reg limits.
> I did notice this comment in V6, but came out of a different opinion: it 
> is OK to discard the TX power here, because that will be sent to 
> firmware using WMI_VDEV_SET_TPC_POWER_CMDID command in another patch. 
> Please correct me if wrong.
Yeah that is correct but applies only during initial bring up. What if 
after client gets connected and user still wants to lower power level by 
giving command "iw wlanX set txpower fixed 1000" something like this? 
This time again it will be ignored but it won't be sent to FW.


