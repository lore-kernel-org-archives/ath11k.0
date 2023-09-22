Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77044CD4F43
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 09:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/zgNtl55RitE+qhVcobOIyc1h1c6UQw8An225rao+E=; b=lpvDkC98SOGcCO
	8pics6NvldK0p6daK0OvIBQjHsNwGACfweEERs/ODYL1e+6OPlhtvXou8KgjcCnQnNrJOZNqNzL84
	PzjjAIjHQbkFoTqN+0rMG2vD+KtHnjYCeKCQUJ8aazqQBN0+Rj4WaY55KJf7C2I9dckmYYd+RQvuq
	Uk+aThhfsvvtQtf2ixkdxztNAqPqB1Lj8JpzsMHbkFuIiBkH7OBwGF+6HRce5RGzVxfxEP7oVmkHa
	uH4EO+kMGgUOD8GF0iRqTEJ4mP8nGwSbdyzvRYSyRYtpAJ2BA+XA0wMQMhgmZYcIppWl6lewOAQk/
	SimPN8sXeTJdTtrnJD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcdt-008bjY-0h;
	Fri, 22 Sep 2023 09:40:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcdq-008bif-08
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 09:40:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38M9CIf1013527;
	Fri, 22 Sep 2023 09:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=o0Nr3JaK4ACHBQ9cEw/9pzJX41KNkkCuXnAmbNGduk4=;
 b=ErEjijGhgGDc/zgm1giHPDP72cbwISdaqqpr6rzn7MbfoT+FmRi8XftbREQYeHKjPWSz
 TAbGKRMiNhVU05kGuMdMOYuttOSEamH1vId5l6h6L/3QlcEK+AqxjtspVNehF0ZOg8Cr
 oX25DQXBu+z/SBaQC6sBW+tQXAGcuDbG9DTJ3ro0hLI+tgyyTPCpXeDckbOruuaW4btQ
 QfDnS3cUiMW9KxxtNMK55SS1fEWm/yihYBcIS5pkCsY0UZMkUUjpThMRiWABuYfzdAtr
 +D9RHNlBDT6wwoj3Oochr0qVNy0JSvZ7vFGe7D5q2co2iY0D6GPIxV5Skq9PLVYDk8ue HA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u5n1hpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:40:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38M9e0XZ014369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:40:00 GMT
Received: from [10.216.13.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 02:39:57 -0700
Message-ID: <5e9439c5-fc02-4a18-8cc8-c76998bfcbc6@quicinc.com>
Date: Fri, 22 Sep 2023 15:09:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] wifi: ath11k: update regulatory rules when
 connect to AP on 6 GHz band for station
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-6-quic_wgong@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20230920082349.29111-6-quic_wgong@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2cd1UFnGnZkTrFlOnNJOA_Kc7zB3VbG5
X-Proofpoint-GUID: 2cd1UFnGnZkTrFlOnNJOA_Kc7zB3VbG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_024006_089592_91B06338 
X-CRM114-Status: GOOD (  12.44  )
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

On 9/20/23 13:53, Wen Gong wrote:

> +	if (ath11k_mac_supports_6ghz_cc_ext(ar) &&
> +	    ctx->def.chan->band == NL80211_BAND_6GHZ &&
> +	    arvif->vdev_type == WMI_VDEV_TYPE_STA) {
> +		reg_info = &ab->reg_info_store[ar->pdev_idx];
> +		power_type = vif->bss_conf.power_type;
> +		ath11k_dbg(ab, ATH11K_DBG_MAC, "mac chanctx power type %d\n",
> +			   power_type);
> +		if (power_type == IEEE80211_REG_UNSET_AP)
> +			power_type = IEEE80211_REG_LPI_AP;
Why having _UNSET_ power type in vif->bss_conf.power_type is fine? 
Typically, during association, we would be setting this from the 
beacon/association response frame's HE 6 GHz Operation Info Field. So is 
it fine if the field is carrying some info which we don't know (or may 
be don't support it yet)? Why are we masking it with _LPI_ mode?

Also, I see that currently mac80211 only sets LPI or SP. So let's say 
STA is trying to connect to VLP AP, mac80211 will set it as _UNSET_. And 
then here, we will be treating it as LPI AP. Is that fine?




-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
