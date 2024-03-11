Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A348C54E58
	for <ath11k@archiver.kernel.org>; Mon, 11 Mar 2024 18:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KO5i3BqOOODm4cJPRuqRklfpmy5UHE9XMtoyG/3tn1M=; b=qDr76Rty9JhFwQ3IiskF/gWXEl
	OVVJg2HzfFfcBBG+PivWnhVKIu49gXVgic9VvFqxzKcZAeUUQLY4P+k20aQ2q0Lj2LE8qR88x0u30
	xGKdn8xBPj5TdgC/DckR+dncgsyEEzfnfIHp4ISmR2kY8Go5+dyUTfRd92f2oBA4zFV9OAu+e9lrZ
	p6tsCzOUlXxbVEaN/kHJIgeU/Uv8PhCEIjUlqaZOdJCfDiNyPGUNnycy8gDzi5g6oiOOTQgX+6ZnS
	0wFe7G3lxubBp4Uwh8uZHpBCBlniPp7+uAQ1GmtwdyMgHM0OErjTZmMx/bkMoceU0nTlpa8f/RbPC
	tZPTsMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjkE6-00000002fTS-43fc;
	Mon, 11 Mar 2024 18:18:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjkE3-00000002fSs-2IfW
	for ath11k@lists.infradead.org;
	Mon, 11 Mar 2024 18:18:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42B9FgEi002666;
	Mon, 11 Mar 2024 18:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=KO5i3BqOOODm4cJPRuqRklfpmy5UHE9XMtoyG/3tn1M=; b=VC
	WXC6Jrvh+kKGz+f2Tv26fJq6gX6Kq+BVWLD+ozZxhWAse2jsMT00KjSJhOkoyZvW
	JxfXChwicq80BXP7MhhL0RCNgfbDBAK4Z3Ow+BcyHxVzTAwooVZkfQzbmVJlxguI
	ICvat2z2L0g7RrkaAiWWOxB1wew0yFZonEJIaSnKUH17kRFiWCXMQY4YsFGWYjwp
	C3AjMNa+7/3isvgXu85gMw7psSqMAp7+hb+QqPwRKnlmoGi4Zvz2oIyUQDe2dqpe
	Atc8kIOi4gjCN1G4lJ7zqU5rhDJVO9F12hgW1RfZarzkc7HzBuOulROAZszibFp1
	2Hvat6Duh4qq5ny7fLCg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wsxbvhmkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 18:18:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42BIIDD7017666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 18:18:13 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Mar
 2024 11:18:12 -0700
Message-ID: <08da3726-03a9-43d2-9c7a-4fd99d46d481@quicinc.com>
Date: Mon, 11 Mar 2024 11:18:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: modify the calculation of the average
 signal strength in station mode
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240309121129.5379-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240309121129.5379-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DQukOXw-SpuxcJvlGOLnW56vlVcFcxPU
X-Proofpoint-GUID: DQukOXw-SpuxcJvlGOLnW56vlVcFcxPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=897 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_111815_762082_5C1EF9B5 
X-CRM114-Status: UNSURE (   8.76  )
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

On 3/9/2024 4:11 AM, Lingbo Kong wrote:
> Currently, the calculation of the average signal strength in station mode
> is incorrect.
> 
> This is because before calculating the average signal strength, ath11k need
> to determine whether the hardware and firmware support db2dbm, if the
> hardware and firmware support db2dbm, do not need to add noise floor,
> otherwise, need to add noise floor.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


