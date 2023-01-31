Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901C3C636D4
	for <ath11k@archiver.kernel.org>; Tue, 31 Jan 2023 02:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5zhY+mAn3wK4skY0HMXk71Rlo15RjtgmhXCSZM0/ik=; b=IqCWaCqZ1b+z4r
	IzoeLlqrbzuiTjJe25MrvKYeRKyoR8dmZjhfyC1TJuT+SrYQOvaoPlDf6tk5krqWUaUq4p/8hMsNF
	qy5Dd/Atevdjhc9DXaXtw7IM9ortJLaKgwkbT8nXh8eLURbuaHwMF1AmgEozBs6fyjQyarr8eqD1q
	ktJ/8xyPvzIiexuwFiyRx24QS8cy+FW7edCeC4Ou/OnxUc/aH4Is0zsCyXw3vxmZBsFXbzgGEr8FK
	lFO8MeW1xm7e9ZDqUjHlTL9eH38ag6+RtgK7BDAnihjQslpyAtAU+dTiDzI09h6o1Gv9X4+QMq8Td
	ss0qDRLgtQRQOkbhxCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMgZv-0066fr-NP; Tue, 31 Jan 2023 02:40:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMgZs-0066fL-CJ
	for ath11k@lists.infradead.org; Tue, 31 Jan 2023 02:40:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V2F1kn026025;
	Tue, 31 Jan 2023 02:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZGJCdSbtiiEEWZako4px0NCt4o/4iXCpVDqXTbZ19WM=;
 b=PhJk5qDoiRxdhh/xOX6Qbqo1fwD/lHKczA/7BpIajSKhd4ebUV8xRwsOlGrZ3YQrB8yF
 ZcQthUDHgjRTpPe0SaTuYma4imQKt2x2/htpoJfNRpGNEL+AWw/vg3K6L3tU0ZpAIq+c
 UNqnGNeU1WQ/YpwAWMRZ41OXaJuqKYWN56SK5J/mvBI1K747s2uc/Vf8iyeYrFCOuNOv
 WzSzBKnI+1CFZ4wAf5H5hODe1PJsuukBKYalzbb1LeukirS4GtyrB1vPp3BW/uRXjJYd
 3fh8dTI76l8M6/lQBKBlMnQwaGwBvnYI+zPz066Z6++s0YH6SvYaYIHWvoMVzSPqidBo /w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nctnyn7b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 02:40:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30V2en77018299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 02:40:49 GMT
Received: from [10.253.72.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 30 Jan
 2023 18:40:48 -0800
Message-ID: <31f9d4b3-6c49-6b49-0240-ad956ce95e34@quicinc.com>
Date: Tue, 31 Jan 2023 10:40:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3 2/2] wifi: ath11k: reduce the timeout value back for hw
 scan from 10 seconds to 1 second
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20221011072408.23731-1-quic_wgong@quicinc.com>
 <20221011072408.23731-3-quic_wgong@quicinc.com> <8735atg335.fsf@kernel.org>
 <cd96eea8-dce0-bcb9-e8ce-05fa0e0f22fb@quicinc.com>
 <e7e34c3d-8b73-f7d5-9ce8-5ed346ca9d28@quicinc.com>
 <7bcd1a12-fb60-98cd-1a29-f55efa8d1499@quicinc.com>
 <73908049-4a69-e65c-665b-97d068f1fef7@quicinc.com>
 <87k01qd426.fsf@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <87k01qd426.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qe6Q_hEuswDjp7TLlZ8DItIiUXBsVDuj
X-Proofpoint-ORIG-GUID: qe6Q_hEuswDjp7TLlZ8DItIiUXBsVDuj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_19,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=928 clxscore=1011
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_184057_245249_F60442AB 
X-CRM114-Status: GOOD (  15.27  )
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

On 1/13/2023 8:14 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> writes:
>
>> Should I change commit log with below explanation and send v4?
> Please stop spamming the same question over and over, it's really
> annoying. If I don't have time to look at something, spamming me won't
> help, quite the opposite. It would be a lot better if you would help
> with the other upstream related tasks we have, that way I might have
> more time to look at your patches.
>
> To answer your question I need to look at this patchset in detail and I
> don't know when I'm able to do that. But at this moment I don't trust
> this patchset is the right approach and I'm not willing to take it.

yes.

I will send v4 only for one patch "[v3,1/2] wifi: ath11k: change to set 
11d state instead of start 11d scan while disconnect",

is it ok?


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
