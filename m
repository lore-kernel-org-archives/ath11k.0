Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73906C25B74
	for <ath11k@archiver.kernel.org>; Thu, 16 May 2024 14:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZKnD66AxmoU604tuqeyGMWmKSfVPcdT20jTH9y2wuQ=; b=IU7Iz9Y/nPts720TqJylHWISkh
	q1EcGYraT51W6UsVh9t9YOhq6yFqlpJjASdX/mtNoneicza0DhaX/TCNwf+fFfgEyIYPRHFerG59N
	YmRc0bmHUij5NOw5iy0SfxKv9RCO9svgFEmUJq9EeI9ZqS1x4d6Y8oMSzK7vYdgqWHmID13HUk6pz
	DT02rhlpvfeen2LVU8wvy6EFZtXZLybAlj+gCJXjZldZ49w2Fk7ockNkWu9z2/zVdS2drRBtqsjQK
	DgFO+33Y0m0l3n8Q4/CsX7pLAp5zvgQeMGQ/L9Dd0mJUUrjNWW1VI0PIcO41/dPn5b6MNXm2Tps8k
	Os73VMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7bpf-000000057jd-43A8;
	Thu, 16 May 2024 14:11:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7bpc-000000057ir-1Lcg
	for ath11k@lists.infradead.org;
	Thu, 16 May 2024 14:11:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8W20D004133;
	Thu, 16 May 2024 14:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=UZKnD66AxmoU604tuqeyGMWmKSfVPcdT20jTH9y2wuQ=; b=a+
	F85Go7VZjOnFCn20DUnDOs8/zXvfZBvWdIn3z4tAZr16QKbrjnmyELG+1++C5Zpb
	qtVSgkvllylinxOq2ovQ0Gi8Sm52jq0unrHX6+rsbMsuT3cNV6BwmeELBT5g7Y4y
	KcB/N37gSepqgVD9/M+Z2jX2yEFhp/qWXILbfXNOCth/Ast2AkEyNyiNtjE9t6da
	hmbG2b0MXCZJvHoW4nLwFSLU3bnqCljOiiGRFLBkDmFVBEVQcST8SCS6l5zcSGDT
	mFTKuS6U37RyWKFiMZaAKHhTle3PTPx8eNdbVZcTPC+/EPPujA5Wm89JU9YgDl6M
	U718UWfhjh1Igre/9i9w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125kxtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:11:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEBXZH010908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:11:33 GMT
Received: from [10.110.4.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 May
 2024 07:11:32 -0700
Message-ID: <4d72f74a-b2eb-43d3-92a2-1311081ce72c@quicinc.com>
Date: Thu, 16 May 2024 07:11:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
        Carl Huang
	<quic_cjhuang@quicinc.com>
CC: Luca Weiss <luca.weiss@fairphone.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>
References: <20230714023801.2621802-1-quic_cjhuang@quicinc.com>
 <20230714023801.2621802-2-quic_cjhuang@quicinc.com>
 <D15TIIDIIESY.D1EKKJLZINMA@fairphone.com> <87jzk2km0g.fsf@kernel.org>
 <93c15c59-f24c-4472-ae7e-969fd1e3bfec@quicinc.com>
 <871q69lqh5.fsf@kernel.org>
 <4e21e556-527f-4d1e-aa29-cacec14155af@quicinc.com>
 <a53e2188-b982-44b7-9dfe-f5dfd6b802ca@leemhuis.info>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <a53e2188-b982-44b7-9dfe-f5dfd6b802ca@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VeI4f2Xr1qfpcC9e30nCfGto7vYTYt0S
X-Proofpoint-ORIG-GUID: VeI4f2Xr1qfpcC9e30nCfGto7vYTYt0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=979 clxscore=1011 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_071140_545821_6D1BF551 
X-CRM114-Status: UNSURE (   7.76  )
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

On 5/16/2024 4:45 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 11.05.24 05:12, Carl Huang wrote:
>> I'll send out the formal patch next week.
> 
> Hmmm, from here it looks like this did not happen. Did I miss something,
> is there some reason to reevaluate things again, or did this maybe
> simply fall through the cracks?

Formal patch is still under internal review

