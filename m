Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54EAC4345F
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 18:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPJENQpcbZlHnfUCdMnZpgnWPlFpmzv57A7pRq6zI5c=; b=sorNXtO16qqtYhJV5buR8sGw1F
	sR6KCt7CssD1RFOpBnDCeo54n/8x0yhdf0Re3X0t5K1Y1V9nIORjMSDUorTjm3+1jEChE/i8fWMre
	uRp+GF/t7hYBKa1nBTigLAzRHAuB5E8474nYADPTAF7O46jTHytr3DTxH8PWLwUMvCr/eMLLz5LWj
	tQAo3QzBVyShl4FtA1qMkFowxiDlS/9QvP0HSzps9gu4qnEV16UP8vPqxdwYV/lpVoTXid14o5D5a
	DpfmSc2X0R8BJuzq2uOSRxbePoqoZNeekR4+SjH+RegvjJsuayKB9wO+oIFxz1xMSl4B1LZnAmwy5
	YgPxiiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyoq-0000000DZW9-3ajj;
	Thu, 11 Apr 2024 18:06:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyog-0000000DZRa-49aQ
	for ath11k@lists.infradead.org;
	Thu, 11 Apr 2024 18:06:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BBJJx7023143;
	Thu, 11 Apr 2024 18:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=oPJENQpcbZlHnfUCdMnZpgnWPlFpmzv57A7pRq6zI5c=; b=Kn
	qPfonDpJotl8diKfct6qQAkPiRpzJRVDZ2Q/SfCCO4dB9V1IB5FBvrkOIJffs/aW
	AC/VJj8q9F7QgsAbxZdGszhq1GdY6+ydToHlcaItCyhEHGea+OZJuWkT2yPfYTqv
	6RW9Gt1HOgOqpP4Q5yoYtRumsCdyy1wq4QZk89h8KkNJptt4Z4hIlp5hu5wkJmT0
	1MwFYaXWA1eyN3tiFy/xRqAYtIl83hr0kdr8fqS+YX8PaJIn8dFG/eg4TnuusXFE
	Ul9eEdd5jmt1opDISvm8+c2JfwVPm4YexqKXiq3lKyga+aveIuEPP52IZr79asaC
	fdDgEuo7b4X0U1C4un/A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xedugsctk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 18:06:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BI6QA3015263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 18:06:26 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Apr
 2024 11:06:25 -0700
Message-ID: <21398952-062e-44f4-85e2-c3d13ec46c44@quicinc.com>
Date: Thu, 11 Apr 2024 11:06:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: use RCU when accessing struct
 inet6_dev::ac_list
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240411165516.4070649-1-kvalo@kernel.org>
 <20240411165516.4070649-2-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240411165516.4070649-2-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wdvaH-cUKOymmOrQEeVqNBzrfgKV6MGA
X-Proofpoint-ORIG-GUID: wdvaH-cUKOymmOrQEeVqNBzrfgKV6MGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_110631_232856_6DFE6E13 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

On 4/11/2024 9:55 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Commit c3718936ec47 ("ipv6: anycast: complete RCU handling of struct
> ifacaddr6") converted struct inet6_dev::ac_list to use RCU but missed that
> ath11k also accesses this list. Now sparse warns:
> 
> drivers/net/wireless/ath/ath11k/mac.c:9145:21: warning: incorrect type in assignment (different address spaces)
> drivers/net/wireless/ath/ath11k/mac.c:9145:21:    expected struct ifacaddr6 *ifaca6
> drivers/net/wireless/ath/ath11k/mac.c:9145:21:    got struct ifacaddr6 [noderef] __rcu *ac_list
> drivers/net/wireless/ath/ath11k/mac.c:9145:53: warning: incorrect type in assignment (different address spaces)
> drivers/net/wireless/ath/ath11k/mac.c:9145:53:    expected struct ifacaddr6 *ifaca6
> drivers/net/wireless/ath/ath11k/mac.c:9145:53:    got struct ifacaddr6 [noderef] __rcu *aca_next
> 
> Fix it by using rtnl_dereference(). Also add a note that read_lock_bh() calls
> rcu_read_lock() which I was not aware of.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> 
> Fixes: c3718936ec47 ("ipv6: anycast: complete RCU handling of struct ifacaddr6")
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


