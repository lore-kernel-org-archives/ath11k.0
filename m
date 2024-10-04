Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B126CF8853
	for <ath11k@archiver.kernel.org>; Fri,  4 Oct 2024 17:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IDXKvHiiMKFVRpUotWikxBR65niyfjG6UUhlpbZnmk=; b=SdJ0RHI+Ecg8vgsv+dGkA3LhJA
	e+AXms9eqITWDFDZSUGpfbqibtHgL94dZz4sWs4l6xYzJ9xpWFsHY7AAkKiWUg/Jfg2GobYPSQa8Z
	3keGPUB4HwpUhCWLGO26TM7kKAWfdnORjk/3KfK5XAAbWux3xfDM42CmpXrcGI5a0jgCTlGGCNUXH
	SBWQGPoiO2vkUbqXwA5IPFD2Ewit42mRQ84C6Al178vLBsEbHuWBu9tc4mFeXvoEKVby4PI63/T09
	LkAijRztBY8OVye4mkVVqOSofjHE3o5huzSRhzTWdfpf1ctSyk9Pw23uQS/pYNnziLrhPmZzVjfCC
	I6zsS76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swls3-0000000DTKC-3HiR;
	Fri, 04 Oct 2024 17:13:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swlPq-0000000DJmG-26tV
	for ath11k@lists.infradead.org;
	Fri, 04 Oct 2024 16:44:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494ACDRa021335;
	Fri, 4 Oct 2024 16:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0IDXKvHiiMKFVRpUotWikxBR65niyfjG6UUhlpbZnmk=; b=N9bG6iZfQQBhgZMW
	Yglb4fPEL6w3uH6shomBkQJh0JdjdPq6bIXJp7vl+R4q/qFqstC/SbtqTEtaBAiM
	tfO1W40u6CWFKSfX2398N94hBwJZmceVwowYautl9e6g9LIROIqNMD0E8bPxPBun
	XQL+obf5a+SbwFUxwtckS8eaSeCprXS7ISF8GbuJvmmivJmOWoVsxbuF4jGyvjEk
	yEa0SV/s54m/7pD7HpY/3oM/j5crIgJlHpa0uL49vyDzvNKbc3fHvD39C0a5F1Vh
	C3X8BS50wjE3s4DnnpOjq5BLAw/wih0NiKGDR99LJ3snt9ZaKjKnRpcNpNVNDGrw
	n2mN4A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205parbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 16:44:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494GiRFc017070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 16:44:27 GMT
Received: from [10.111.183.136] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 09:44:27 -0700
Message-ID: <892bc362-9faf-45d8-ac8a-994e8c4bd19c@quicinc.com>
Date: Fri, 4 Oct 2024 09:44:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Fix CE offset address calculation for
 WCN6750 in SSR
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240927095825.22317-1-quic_bpothuno@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240927095825.22317-1-quic_bpothuno@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vop3Qs5sqe1Aof_SYKq_sAP29wqORJ8z
X-Proofpoint-ORIG-GUID: vop3Qs5sqe1Aof_SYKq_sAP29wqORJ8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_094430_706349_6066FF67 
X-CRM114-Status: GOOD (  23.93  )
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

On 9/27/2024 2:58 AM, Balaji Pothunoori wrote:
> Currently, mem_ce and mem iomem addresses are used to calculate the
> CE offset address. mem_ce is initialized with mem address, and for
> targets where ce_remap is needed, mem_ce is remapped to a new address
> space during AHB probe.
> 
> For targets such as WCN6750 in which CE address space is same as WCSS
> address space (i.e. "ce_remap" hw_param is set to false), mem_ce and
> mem iomem addresses are same. In the initial SRNG setup for such targets,
> the CE offset address and hence CE register base addresses are
> calculated correctly in ath11k_hal_srng_init() as both mem and mem_ce
> are initialized with same iomem address.
> 
> Later, after the firmware download, mem is initialized with BAR address
> received in qmi_wlanfw_device_info_resp_msg_v01 QMI message, while mem_ce
> is not updated.
> 
> After initial setup success, during Subsystem Restart (SSR), as part
> of reinitialization, ath11k_hal_srng_init() will be called again,
> and CE offset address will be calculated incorrectly this time as mem_ce
> address was not updated. Due to the incorrect CE offset address,
> APPS accesses an invalid CE register address which leads to improper
> behavior in firmware after SSR is triggered.
> 
> To fix the above issue, update mem_ce to mem iomem address in
> ath11k_qmi_request_device_info() for targets which do not support
> ce_remap feature.
> 
> Fixes: b42b3678c91f("wifi: ath11k: remap ce register space for IPQ5018")

Not quite correct, missing space after the hash. Should be:
Fixes: b42b3678c91f ("wifi: ath11k: remap ce register space for IPQ5018")

hint: if you add the following to your git config file, you can issue the
command "git fixes <hash>" and it will emit the correct Fixes: tag.

[alias]
        fixes = show -q --format=fixes
[pretty]
        fixes = Fixes: %h (\"%s\")
[core]
        abbrev = 12

No need to resend to fix this -- I'll fix it in the pending branch

> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/qmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index f477afd325de..7a22483b35cd 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -2180,6 +2180,9 @@ static int ath11k_qmi_request_device_info(struct ath11k_base *ab)
>  	ab->mem = bar_addr_va;
>  	ab->mem_len = resp.bar_size;
>  
> +	if (!ab->hw_params.ce_remap)
> +		ab->mem_ce = ab->mem;
> +
>  	return 0;
>  out:
>  	return ret;


