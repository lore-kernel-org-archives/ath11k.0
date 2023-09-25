Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB12CE7A89
	for <ath11k@archiver.kernel.org>; Mon, 25 Sep 2023 09:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+h0NSkFBWHIfFKK1pF0LhYm++d/bld8RPmK6M/qbCc=; b=rF37NapDSDOExq
	lxPPRWng5IJJ4BQbM4kXhi3aytkHue7tPPnwfCwyA/C9L7cZADf6T/KkgkGLXnGOXusDWfWVkcicc
	mAQz4xAG4WuhSJEVNiwTaI5TJ2l2sEXMVbJLlHn9cQPhMXdhCHsoD45aqdgEnt8bioQT4ZIQdHWyX
	V4I9v4IjMCTO6zE5oma2xZmMqNmdtriMwbvNud51jcplTKY82fna4x6ElS5AYjbCnljExJh3ONBP+
	oPhCQWlwUv0XD47b1Rb1OOA3o2eocTt6PN77T/AiW/pt64e9ETVD0+DQhC024P+P8KtU0Z2mUud9O
	BGGxJ+fJL2kfREGJHTAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhpv-00DqaM-1L;
	Mon, 25 Sep 2023 09:25:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhps-00DqYx-2G
	for ath11k@lists.infradead.org;
	Mon, 25 Sep 2023 09:25:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38P91X20009677;
	Mon, 25 Sep 2023 09:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uK7WjOd5sVmT1QP1QKi8Lj9Fx/VPr9j+ll9X55PnXTY=;
 b=hGGZZ1ZYg91ZSEed7d9FjLZKlPo/nJ5uTm/nv+6QZcJ11vNQItAE2fufnG6yMY3kE5dz
 YvGSJXHBcGmUKF7PIaL48njJkHbbYVoXBZlmEh7TOsw3sliNhDdfvFtbXvyzER0K6aTo
 vR7sMAzk53TXjNx94Y3PswCSfVCi+hO4+3kVAxXRN0wRNmnc5BhCUzHZ6i5pUpEcKOxW
 Kd9AJVBo9NqwUNQwdey/61apRGjQTSwcoXgxGCKXYsqPDzVA50QH5YgUv2hIn1vlyN6Z
 ILyH/wPSD24wZmU/t7JYcULBqfzGNeMjnJ4FxUKdoSlJecHIJun+8IsiQ4V1GT2Sn7E6 kg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tb72sg1p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 09:24:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38P9OwgC029493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 09:24:58 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 25 Sep
 2023 02:24:57 -0700
Message-ID: <e1594171-6859-6b93-e865-3216975e6135@quicinc.com>
Date: Mon, 25 Sep 2023 17:24:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ath11k: add trace log support
Content-Language: en-US
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
References: <1636439755-30419-1-git-send-email-quic_vnaralas@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <1636439755-30419-1-git-send-email-quic_vnaralas@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Hhz7owki1JFB3dmWvCZvgVB3GKamHIR5
X-Proofpoint-ORIG-GUID: Hhz7owki1JFB3dmWvCZvgVB3GKamHIR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_04,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=717 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309250067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_022500_853651_5C0D94B2 
X-CRM114-Status: GOOD (  12.64  )
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

On 11/9/2021 2:35 PM, Venkateswara Naralasetty wrote:
[...]
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index 5ae2ef4..80f7760 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -249,6 +249,8 @@ static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buf
>   	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
>   	cmd_hdr->cmd_id = cmd;
>   
> +	trace_ath11k_wmi_cmd(ab, cmd_id, skb->data, skb->len);
> +
>   	memset(skb_cb, 0, sizeof(*skb_cb));
>   	ret = ath11k_htc_send(&ab->htc, wmi->eid, skb);
>   

This will trace 3 times because ath11k_wmi_cmd_send()

calls ath11k_wmi_cmd_send_nowait() 3 times when the credit is not 
available.

Any one know how to change it with a good way?

[...]

>   

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
