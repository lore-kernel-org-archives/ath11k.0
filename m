Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703E6E7D0AA
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 20:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5sAudU3/ljbh4GVHr0QGYmGtDmXoNpd8M8jNXzWqVQc=; b=vT44v7ds7MtxIe
	DxrNL3/cVkMh8tf8m3RBNwCxq4mx77QffG88J2gvufB0ppTouUZNGFewAN7BgKit9yTIclLfwBddR
	Gak9snlxVgsh9CuhoLAZLkVFNlUqHP0LggtaOEQ6IhSRzbJcmrtt+/oJH7oOsSXyLEk0lqU2IH0Kk
	TYOH8a0LLO9o+1oaoyLQcugVedzFS/6MrM4mRpt5VRT6jwLWf76iSjeNC3cXsJYupH941NGM3gV+G
	z1KGSnEPFVdDzmPgmypHX6jITYZM0GFiw/DV3c4EBEqltRlsDldsHC0t4692BuyDGQpa308t48xvf
	oxFJZkQj26Ydrsw9opBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQRn-0076gq-0Y;
	Thu, 21 Sep 2023 20:38:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQRj-0076gE-2U
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 20:38:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LKO0jk030532;
	Thu, 21 Sep 2023 20:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=z2VIJcORkGlcuCfmFQrCGRVHfX/7S4x0N3z2O/ndP0I=;
 b=EmfcH/WZGHi5hwAKZfzuw+1oOq1PiSKhJkM/g5RLUy4/hx/lrC9Dq3vb9pfIZfNKYp3B
 lSBKSacjLvX963v0yZSTS/TnKJqx35VI2QVijE5F2qe55jSiWGSBdfiGlKmH9QpU1kJy
 fxDkng3L1+9EbuceGKoA/szrPFmuXm0MEw6Ir84YGOaCwHJEoED8a6Luc3/sx8eZNsTu
 lWb3FqU9deb58REYo3QsD2Tn9/RywTKZwLK9VQrOe1Zd0k2vE1X2Nwj5LvxUw7ED5dZ1
 8IW61kOK9fNJMYkvB8EVTfPMjR7QN9mmuh5iToYuGn6YxikV/hAnFZglkbUPt+rKt60J xQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u9h87cu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:38:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LKcg2x019026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:38:42 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 13:38:42 -0700
Message-ID: <dd770693-b090-434c-921d-f1c171a0c28e@quicinc.com>
Date: Thu, 21 Sep 2023 13:38:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] wifi: ath11k: send TPC power to firmware for 6
 GHz station
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-14-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920082349.29111-14-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 83R6LyjDsvzfZ4lb-XPm0IaIIbCeqIVd
X-Proofpoint-ORIG-GUID: 83R6LyjDsvzfZ4lb-XPm0IaIIbCeqIVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_18,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 mlxlogscore=950 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_133847_923560_CB7C6ABA 
X-CRM114-Status: GOOD (  14.46  )
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

On 9/20/2023 1:23 AM, Wen Gong wrote:
> When station is connected to a 6 GHz AP, it has 2 way to configure
> the power limit to firmware. The first way is to send 2 wmi command
> WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G to
> firmware, the second way is to send WMI_VDEV_SET_TPC_POWER_CMDID to
> firmware which include more parameters for power control.
> 
> The first way is disabled in previous patch
> "ath11k: discard BSS_CHANGED_TXPOWER when EXT_TPC_REG_SUPPORT for 6 GHz".
> 
> Prepare the parameter for wmi command WMI_VDEV_SET_TPC_POWER_CMDID and
> send the firmware after vdev start response success from firmware, it
> is for the second way of power control.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

As previously mentioned I'd squash this with patch 11


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
