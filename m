Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECD3C5478C
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 15:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpVgRMSMlQRj+WP4mF4tBQ/yRLOhdJnYVw7U1Oh6gMw=; b=DyBC4yXZ2rl5dakaxLvZ0k+UOE
	9evkFufwvPG17Q0P2z0SrPgGXuKIw+L466pVHq4TBvmbiUJJ4oYHRoUqMtTBNDGdqHQa4mptRJ2id
	8csijD0yqK4QdwUertg16Qn4qQoEz71n4CXYOufQLloqV2eYG+rgO07V/VNOrSHl1W9IVjREtADLm
	11tS0vz+juFe40vkpZjAzqJLibChWo2gnnpS7ymLmRAN8n6qHTUtpNMPIIbS/kTxULRa1JJCIUQHx
	FXL3BWk9DzhggRrgSzzIROOWqVX/NzfqDs+J2NUas/pSvBUOi0Fhb7q6C3ar/tfQWLk1Ajnh3Ivpe
	ub5ckflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rez1N-00000005i0C-1czi;
	Tue, 27 Feb 2024 15:05:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rez1K-00000005hz7-36Xb
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 15:05:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R9ZEYN022683;
	Tue, 27 Feb 2024 15:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vpVgRMSMlQRj+WP4mF4tBQ/yRLOhdJnYVw7U1Oh6gMw=; b=RD
	JhPLyd+yOaZldEpRKKVf4GIPxT6ZrQOfVn645/LRGX9IWi9oikHCtV7+v6T3QRBg
	rpshX0ih9i5MDLb5K+vMxPDvCCJovcLkJ/Dm0Udhc8u3+Jd0Kc6JJaXFtABZAwSU
	6WNrht+TN7cGhDhXElrf4gbV3jRwagmT8mwgvFnnJMfF3SKeCCfius6n7wXSQOAl
	ijPqQWDwrbEFPpoWuSr7XF+cpcVyC3O14zfAMPreuh4AOKp55NW+vOXu4sm5ckoy
	TjHdRXF2CcBINfxyOyHPLmnAvI/dS0L9jFP5iiRPzxSDGS7TuDIg6XcSyiwOjY6o
	Di38cV72kfptziGUGH/w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh5079sbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 15:05:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41RF5LV3020645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 15:05:21 GMT
Received: from [10.110.113.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 27 Feb
 2024 07:05:21 -0800
Message-ID: <3582b1ea-e103-4b7f-b34e-6457964bdb93@quicinc.com>
Date: Tue, 27 Feb 2024 07:05:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] wifi: ath11k: add P2P IE in beacon template
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        Kang Yang
	<quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240226060203.2040444-1-quic_kangyang@quicinc.com>
 <20240226060203.2040444-3-quic_kangyang@quicinc.com>
 <42652a06-33f3-445a-bd8a-da4633fa52f8@quicinc.com>
 <b20fc717-654d-4e64-920f-699fe3ec5598@quicinc.com>
 <5c5ad99d3c2f3b9915b440057eab6618639cd31f.camel@sipsolutions.net>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <5c5ad99d3c2f3b9915b440057eab6618639cd31f.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g7dK2wgPmioZGgYP5nwA5cqJsddRUQNw
X-Proofpoint-GUID: g7dK2wgPmioZGgYP5nwA5cqJsddRUQNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_01,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=735 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_070527_019006_B5496E48 
X-CRM114-Status: UNSURE (   5.44  )
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

On 2/26/2024 11:32 PM, Johannes Berg wrote:
> @Jeff: NL80211_IFTYPE_P2P_GO is not used by mac80211 internally, it
> translates that to vif->type==NL80211_IFTYPE_AP && vif->p2p==true.

Yesterday I was looking at another patch and while doing so noticed this
as well. Too many years of working with our downstream Android driver
where we use the P2P iftypes directly...

/jeff


