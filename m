Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761CFC4345F
	for <ath11k@archiver.kernel.org>; Mon, 15 Apr 2024 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZS5PybUDH+WqH6Sa8LywzS+Thk1uLag0/bFVQZopgY=; b=MhKJorvfLEqUp1XeMJETx9w9mH
	TjwdYs1r/zhyvbujTWnbRVCmo6eqLhv3OohKatEYC9LjNAzSC6b1vhjvO5JnE/GWvV1Th78tHKxwc
	JqkDKI/Bsl2nXog4KSW/0X05KZu4pBWYhwoSYji77WAaBOz1Thj5fnZdveXyMpQvLvNI1U4zDSolk
	Rh1puMPFzMS9KDoyZxYYk5W9+yCfTqyW1cbdTFVuyW2ByNcV0tBwt27fRgdnQL4xKDRzYle8lGY11
	Ywse1/JURQjkMnfE0X6o+V3LcEyh3JW5luv6jZxUYjGdRoo+1QjBN5vGavErEZ9+5S0gJUl9uk1np
	ff7H0F8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwP2n-000000092rm-03PP;
	Mon, 15 Apr 2024 16:18:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwP2l-000000092rP-0RuX
	for ath11k@lists.infradead.org;
	Mon, 15 Apr 2024 16:18:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43FFNNSG010273;
	Mon, 15 Apr 2024 16:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sZS5PybUDH+WqH6Sa8LywzS+Thk1uLag0/bFVQZopgY=; b=lO
	BwJbrmnPXVU9u/Egkt8hJVnr1nt+D4hdseeSRvCl48NLaQAEv/Eu8sRxvQZ5Vklu
	XtwLWEwtWUSTdgtyW+2uyH8dgColntQJW5AqQa+ssFjSiJr7tGhFsRwIqKQzQ4re
	CKCVMYUGAMxV9DHRtOcGZu0c43fpNJ9XHPC2g6N8UwVS2U9Xkdma/ubp5sqomZBQ
	qc2ZaYw6sdRD5WuDnGVd1IZ8chfuvssrki3nm4uIeDtITWO85ne7xDA8OzfXhSln
	04OaEfI/Eo1TFiaAb/q7MZpg26Eex4xmUg7SL1U3K+Vab3efTSr7T0ZLDFJJIyCB
	aTuyJevxiLr45SMPUW4A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xh25ggx4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 16:18:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43FGInwj023178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 16:18:49 GMT
Received: from [10.110.3.16] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Apr
 2024 09:18:48 -0700
Message-ID: <b4c8a18c-286c-442f-a7e9-d4a0bb604083@quicinc.com>
Date: Mon, 15 Apr 2024 09:18:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Fix error handling in
 ath11k_wmi_p2p_noa_event()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Kalle Valo
	<kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Kang Yang
	<quic_kangyang@quicinc.com>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Kalle
 Valo" <quic_kvalo@quicinc.com>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
References: <6ee80f65f736db1646f6f201f60816cf35b6f3fe.1713180046.git.christophe.jaillet@wanadoo.fr>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <6ee80f65f736db1646f6f201f60816cf35b6f3fe.1713180046.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: su9nS6VNfgFs0jlq66M3IlcC0Ecc_HWC
X-Proofpoint-ORIG-GUID: su9nS6VNfgFs0jlq66M3IlcC0Ecc_HWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_13,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404150107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_091855_255226_61FE7144 
X-CRM114-Status: GOOD (  10.03  )
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

On 4/15/2024 4:23 AM, Christophe JAILLET wrote:
> if (noa_descriptors > WMI_P2P_MAX_NOA_DESCRIPTORS), there is a mix of
> return and goto. in such a case, 'ret' should be assigned an error code and
> the 'td' should be freed to avoid a memory leak.
> 
> While at it, return 'ret' instead of 0 in case of error.
> This is actually harmless, because the only caller does not handle the
> return value.

in that case it would be preferable to change this to be a void function and
not return anything. that would be consistent with most, if not all, of the
other event handlers


