Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDB0C3ABC3
	for <ath11k@archiver.kernel.org>; Tue, 13 May 2025 01:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tc48vhKzQImoMCcMcIFiq/P4xq1XXIMH3wo3nqsKb0=; b=NGyDEzC2IK7eT6/+gNlx4ueWKt
	AraK0QvoqWHfDeTJslMTnyGrl0E4/E93SsCWHUJSrXIgz+ttYWyZ0fHkRPd35OSBo3/vqNZIw9X9n
	mpwGivDubeIcEiJE//mk3I+eiJ2BrFKct7xFdaa4OW0LHJeYaXB81S43NPbb+RE4dGPRTLeVBiS3m
	c/W35o7En2L3zoJe6R6Ef6F55zypbogigYVeOolddM3ewVVj6q51IKitNoMZepXr1jndXsR14M6y9
	LKJy5juzyGxs555qXaYE3l+hn9yKvT6g2c/cD4xpCNUHALx7wGgTqph0WyzNZfhHEidU6MIgYP6cG
	VKVoaKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEegj-0000000B4qC-2gDs;
	Tue, 13 May 2025 01:44:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEegh-0000000B4pi-1Q0s
	for ath11k@lists.infradead.org;
	Tue, 13 May 2025 01:44:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIWSut023824;
	Tue, 13 May 2025 01:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tc48vhKzQImoMCcMcIFiq/P4xq1XXIMH3wo3nqsKb0=; b=ff8j3LIJGufORR0D
	TntLRo6218NIgkpIlWXiNq3h21Cmg27W2cehkNl7RrPuNdB5fzbwrpY+VGkMI2WC
	r8O5a22UwFpzb5jyMCXhTdjHCCHwOgHtBP5f31LMVXocViRIdJNfbVnnSJhyJ+VJ
	iQ7wmsR7uFkkvXwM7XXzTh2cTRsONAnN64RO0Q/65qlE83R3tAl31pSRR+vRhU4Z
	obi+qDgG3TKEgeb6YL2xwiBUzBI+6/RK1Bs9SsAXztSia4yt0KaJAhwDAvvZvcQh
	ZMYTEZtuWsJgvP0us5GjLAbP09PqEbCkjqDn4B8ATmR3fHBDuaKSbDkAAw/8JyWA
	vV31wQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hx4k63e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 01:44:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D1i1IO018306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 01:44:01 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 May
 2025 18:43:59 -0700
Message-ID: <5a90a869-8bc6-4fc5-a02a-58579f24dac5@quicinc.com>
Date: Tue, 13 May 2025 09:43:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: Allocate entire MHI control config
 once
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
        <quic_thanson@quicinc.com>, <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <jjohnson@kernel.org>,
        "Pranjal Ramajor Asha
 Kanojiya" <quic_pkanojiy@quicinc.com>
References: <20250425170431.921656-1-jeff.hugo@oss.qualcomm.com>
 <1f2a8c11-214b-43c6-8b3a-9e44094f949a@quicinc.com>
 <d97c900d-c899-4f2c-821b-53991ecfd86e@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <d97c900d-c899-4f2c-821b-53991ecfd86e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ReqQC0tv c=1 sm=1 tr=0 ts=6822a3e2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=oPY1zYEqk9kjLPOFep0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MfYiPvMrt1pA17fcZMssjIlEPsYemLt5
X-Proofpoint-ORIG-GUID: MfYiPvMrt1pA17fcZMssjIlEPsYemLt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAxNCBTYWx0ZWRfX6VzH1Qcr4Ju4
 z9bqvHZ+eQN6rvDilkxGGEWxLpNWOXQ0/EQiLyLv1cbTOEVIr2MG+K88Nm3StdOI7yy95PPblMN
 nIByGRKvQRpUFPkGr/9wZhYqylX8cfJMGFYUpmnmAhyfMPzCDvFTeHPGtns6Ibn30tMpcMqYicE
 ifvX2+mgLQBWiXIUpoTPVtqGlCe8RvKyhMDury2Grudmn7nfLNWirDx7C3Se1gMu/kT9gAxARJ9
 fQlTrKGZzQWjTPdbLXqgd4n/YTrzv5g9L/RAo5ck000DEA5svFlU3hb+Z1KcDGEvIpgnrB6yRp+
 YHw82kAC6xvQRAphuGM3rCFme595UvkYg1PJdQcy6NQeMRMHt7YFptXXZij2gQ0aT/YpzTfFP7w
 2kJOnhjZfBBRkUXbI7fxhm8MueeU+Tmp5Pb9VOQSqOzusosPSjUIEfSV6BdaR0/yUYPYWzDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_184407_519026_7CC42FF9 
X-CRM114-Status: UNSURE (   8.72  )
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



On 5/13/2025 2:31 AM, Jeff Hugo wrote:
> On 4/27/2025 7:57 PM, Baochen Qiang wrote:
>>
>>
>> On 4/26/2025 1:04 AM, Jeff Hugo wrote:
>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>   int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>> @@ -475,6 +497,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>>       struct mhi_event *mhi_event;
>>>       void __iomem *base = mhi_cntrl->regs;
>>>       struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>> +    dma_addr_t mhi_ctrl_limit = mhi_cntrl->ctrl_config_dma + mhi_cntrl-
>>> >ctrl_config_size - 1;
>>
>> but the range [ctrl_config_dma, mhi_ctrl_limit] could still be possbile to cross the 4GB
>> boundary, no?
> 
> Its possible, yes.  From a practical standpoint, that seems to be unlikely as the control
> area is not terribly large on supported platforms.

although unlikely, we need to handle it, right?

IMO a possible solution is that you allocate (2 * ctrl_config_size  - 1) bytes and take
either the former half or the latter half, depending on which one does not cross the boundary.


