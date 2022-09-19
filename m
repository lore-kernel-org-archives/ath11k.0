Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601AFC6FA82
	for <ath11k@archiver.kernel.org>; Mon, 19 Sep 2022 23:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0Jb0mj26P1w2de6Q51q5HW/0F7wjETHGhpisKghUxc=; b=mIXgIWV3Uk58p9
	48oixF5/P/txp8dNPhZ2KxMHXK3J6FXRx3560cSrlKYtlxF8alTFr6i2B+MG/ZFsPwrVhTZB070vp
	AuX5WkdZY0s6TVjh0mJko4IM6lqSKROMbIKGDuj5tQAbDy8hd6HiFGUgf+z6qtclWjk+g2aPXSYRz
	ju3AukUiqIqJ4nYZCf82m8dopYBXzqsZ9UdtdWLUR+VqrXtkCYU6PVCx7p8XonnDeOL1bAptGgPsm
	t+T7Cw2N/O/vawH2u7vu12DYWH+c5xnmFnJPXgSuCokKXkOWi1yIAtHM0ev8QMPkKDhDFkSlEfC+y
	I79kY+rczP/inZSTZ93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaQCC-00GJQf-5u; Mon, 19 Sep 2022 23:29:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaQC6-00GJP7-8F
	for ath11k@lists.infradead.org; Mon, 19 Sep 2022 23:28:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JNDiER016722;
	Mon, 19 Sep 2022 23:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+JQ7W81fJLeXGAc/5OMEqLXZvEH/GOCC6VvHQZtM5kw=;
 b=nPU9gxDAqZFGDEaaK72mpEPeT2O8M3EjCHyfnBN28n2gsPVQwO1VeSbVoYa5SoMKZlBu
 OPNMVBqY+xkbU/RkaJumTBlu/TkcpjVKKfVe70Mabbke85ku8q+9i753SKVMSgykw6ba
 DkqB+SXVtB2rpu3qV35dqx422ND7q36RNn0Bh1ZCZ8tLQxQStkSLo5Nm41AW4YCvO8gj
 EtZ1ZyE5sXb9mmHTzbqDp+Xz/XUvx7/SClbzs/hO4j2ACy3a/HQ7WOMgw9stTNirOQkg
 f2CcCjQhx9EQCweYtRz6izZanJGY6xSYL5vipyyoL5CQIyaLJ2HhrB7Q+9QLK0Ms51Q8 8Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jpt21hsys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 23:28:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28JNSlQK022286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 23:28:47 GMT
Received: from [10.110.44.78] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 19 Sep
 2022 16:28:47 -0700
Message-ID: <a6b7588b-21f3-5ad3-8ad9-cd39e415ce32@quicinc.com>
Date: Mon, 19 Sep 2022 16:28:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] wifi: ath11k: retrieve MAC address from system
 firmware if provided
Content-Language: en-US
To: Jun Yu <junyuu@chromium.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220919185448.545399-1-junyuu@chromium.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220919185448.545399-1-junyuu@chromium.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: p67-acICJ9NM6sg5ovGqiO-GqYCEv1bg
X-Proofpoint-GUID: p67-acICJ9NM6sg5ovGqiO-GqYCEv1bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 mlxlogscore=985
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_162854_324502_89D1E03F 
X-CRM114-Status: GOOD (  13.90  )
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

On 9/19/2022 11:54 AM, Jun Yu wrote:
> Devices may provide their own MAC address via system firmware (e.g.,
> device tree), especially in the case where the device doesn't have a
> useful EEPROM on which to store its MAC address (e.g., for integrated
> ahb WCN6750).
> 
> Use the generic device helper to retrieve the MAC address, and (if
> present) honor it above the MAC address advertised by the card.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Jun Yu <junyuu@chromium.org>
> ---

v2 but no changelog?

>   drivers/net/wireless/ath/ath11k/mac.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
