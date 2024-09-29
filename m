Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB203CF6491
	for <ath11k@archiver.kernel.org>; Sun, 29 Sep 2024 02:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLkpCZ7R9/QtqnBS4bmma4iZR6HHyNndeEZ9tYtpEAI=; b=ihUlxbYSJHpb615XAX0u54hXIU
	qa73s6szTyxbUTVbogz/xX1RPNU7oXkNRufdlM1Cn55A7uY7aPPxOD3yoEhS5tYyAmTYtn9SMFphz
	seENFkuOtVb7L5X/uvV6+XjjJVNdYHgnZEe42dF4AyE4UF70qjUcNkARZZcV/EdbiShBQXctjn4pn
	8FBAchIWV0VGGJt9EEExt2nzjLMpiz9v18ZxSFsu/mc4jgJaAjEZeWSoAXoH1UdiyfWInT6x/VeV1
	NFXaH5DEgOrGfJ9LiW20ZIMHAHadCgnFbzagSz0a7Ju0daNMGeBzAqE7zTHxRipyHB1m2UU9ZLEL5
	fxhpMoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sujS8-0000000Dxeo-1kQw;
	Sun, 29 Sep 2024 02:14:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sujS5-0000000DxeM-1mAJ
	for ath11k@lists.infradead.org;
	Sun, 29 Sep 2024 02:14:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48T0MaBS030754;
	Sun, 29 Sep 2024 02:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLkpCZ7R9/QtqnBS4bmma4iZR6HHyNndeEZ9tYtpEAI=; b=k7r+Ql4CssBKQW1x
	MS8LLR5dvEJQpg5/T8k7MjhR9sHyRYGEnhM5U2IULl94cwkr0TU0WWGX1+4aZ2S0
	3DRo5LfNKz/QsqqlEFSpU3Q729FhAtLrE2V1S18zra/wfxRk8FeleO4BuYBr1Bie
	oj42Cb/C8CjlwjIdKjlgn3CXXTkTQN7pvI+yQQZG8QZs6keumhH8vlJ0/8WVz7Uw
	Du2joDg7UTEfCJcDx5J8c0H25Fw9eUpgAwvT7P6dF8d3Dc/QOu9qxX4usHVbjRTv
	k4EThwBsrm9yMPH6XqCy50iDpf68n+88RdIVs6uKwhzTQwNeW57baaUrdofqHXH+
	/D1D/Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x8t6hkje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Sep 2024 02:14:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48T2ELRN028095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Sep 2024 02:14:21 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 28 Sep
 2024 19:14:20 -0700
Message-ID: <241fe825-991f-4dca-ad1c-e45f6a524edf@quicinc.com>
Date: Sun, 29 Sep 2024 10:14:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k/WCN6855 neighbor report request made immediately after
 connection gets no response (with MFP)
To: James Prestwood <prestwoj@gmail.com>,
        "open list:MEDIATEK MT76 WIRELESS
 LAN DRIVER" <linux-wireless@vger.kernel.org>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <eb41d8ec-c4f1-474e-a938-099f27aa94e3@gmail.com>
 <fd90d471-503b-4f58-ae11-bae2afab08c7@quicinc.com>
 <0d1dab88-66a0-48c1-bdbe-777d07c3132e@gmail.com>
 <70567137-dfb9-4896-9e6c-6c02a97228cb@quicinc.com>
 <15c909da-f01e-43ee-b486-f9b6d5bcc29c@gmail.com>
 <26302980-4cd8-466a-8de1-4be10a42536a@quicinc.com>
 <f65b609c-0813-414b-885d-24257e76e6d0@gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <f65b609c-0813-414b-885d-24257e76e6d0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _sFH9HNdIdTBxBrvVpu1LicSMe1z8O0I
X-Proofpoint-ORIG-GUID: _sFH9HNdIdTBxBrvVpu1LicSMe1z8O0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=641 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409290016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_191425_623292_C3594256 
X-CRM114-Status: UNSURE (   9.52  )
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



On 9/27/2024 7:53 PM, James Prestwood wrote:
> I think what I saw here was because the capture was done through the AP vendor was automatically decrypted or something. The frame was still marked as protected, but I never had to add the PMK to get wireshark to parse it correctly.
this is exactly what I see. there is no automatic decryption here, it is only because the frame is NOT encrypted, though 'protected' bit set.

> 
> On my home network when I was referring to "always encrypted" it was because the frames always had the CCMP IV and the content of the frame itself was not visibly a neighbor report/request, just a string of hex values. Once I added the PMK and decrypted it wireshark could parse it.
is this tested still with IWD?


