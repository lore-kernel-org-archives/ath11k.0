Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465E6CAC5B2
	for <ath11k@archiver.kernel.org>; Wed, 18 Sep 2024 02:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=It4eXS9THUuHtK0Fd3B18Ev/5ytwBm7fzlC11Sf8278=; b=yMWfQmGVyW6HMBZ15vaig0h21N
	MC5M9LywdZKgG8aMS4yUO0EHwRAJ7Bd1HVL8XPbx+iqD+icgv/iIdAzibF+f11UjrMhjhKJ7B4PYn
	q6fgivRuJloncVxp/KVRb5Wtsiy3/ZLeafo9dQ3OQ3cJsUopi+NveVq3EcH+km7veJzCd5hZt++N3
	dUdiKYt2RFUIwybElRDLz4juvNU9lyN2Tn9OaoiavozsEXjTNeU2YSdgioQ+xSiXmz3DpPhOXbc1J
	tQu7hJix7Le6zYAoBmwPVyEeA9xxyfZYxM0ClYjIRvHi3tMdqe2vysuUqRLBQW0CDGlOIgwnKaQNR
	3gUDnECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqkDI-00000007IyF-3uO9;
	Wed, 18 Sep 2024 02:14:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqkDG-00000007Ixo-0dTJ
	for ath11k@lists.infradead.org;
	Wed, 18 Sep 2024 02:14:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HJaaKV016863;
	Wed, 18 Sep 2024 02:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	It4eXS9THUuHtK0Fd3B18Ev/5ytwBm7fzlC11Sf8278=; b=L+6gouLUdX+upoIA
	9amyd0OWDc513VTEJzkFxWfJacBJSeuyK3wGeF9K+y7x99cNoLyCN1tkwc2I1i/V
	iuQEqLSA811Rp5VPnzIq5LRSitIQpXVRVubg/xW6phUwL/u6GgU+OPvJ3z+w6Api
	PxUOosY4XsKJ5Eppn20U5tvXBOPtI+2JSCoKsLXzoxputSx6GW03UF7HYy/2dXaw
	FZt1nsd3YVhYLeSNhM7E3h3pA8NOaVhhQcRbiASfuqPQ9Jlw01gLrTR2Zt+qYlaI
	3MfMZVk2MlBaXT1ehwkNV1aWviQSQXwWg6SGXhlOyHL/EuZRDVNuqG67EvwTwUe+
	rvD6/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hh8fwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 02:14:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48I2EVMT029932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 02:14:31 GMT
Received: from [10.253.39.169] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 19:14:30 -0700
Message-ID: <59a975c7-083d-4387-96ee-fb795e588a42@quicinc.com>
Date: Wed, 18 Sep 2024 10:14:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath11k: fix full monitor mode
To: Steev Klimaszewski <steev@kali.org>, <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <87ed5kaxxp.fsf@kernel.org>
 <20240917073547.99604-1-steev@kali.org>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <20240917073547.99604-1-steev@kali.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kWIr8pOo9IxBHRh1UUm8gh17Hyq_XsTq
X-Proofpoint-ORIG-GUID: kWIr8pOo9IxBHRh1UUm8gh17Hyq_XsTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409180011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_191438_343889_047B0ECD 
X-CRM114-Status: GOOD (  11.67  )
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



On 9/17/2024 3:35 PM, Steev Klimaszewski wrote:
> I would also like to know this.  I have a Thinkpad X13s with a WCN6855 in it,
> and I've tried going back to the .30 firmware:
> 
> ath11k_pci 0006:01:00.0: fw_version 0x1106996e fw_build_timestamp 2023-10-13 07:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> and with your patchset applied, I'm still not able to create a monitor mode
> interface.  Is there additional patching needed on top and this is just a fix
> before that comes?

For WCN6855/QCA6390, still need some patches. This patch-set can only 
fix the full monitor mode on QCN9074.

> 
> -- steev


