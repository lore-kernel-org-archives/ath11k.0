Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C00C54E4A
	for <ath11k@archiver.kernel.org>; Wed,  6 Mar 2024 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZriVnAkAbNTgRPbl8ful3yh9KHAVXDxhg+h2EDfcoAE=; b=VKTPlWsvufVn2dNsXKPXy3JLVg
	tqYX5vZIgQ0pTusAhrNUlb6ZoCnSkE/UO9pJPFjpwi6RDXIVj6Vf3YiYromymUo9GWmOMBevUs+Bb
	1Cl4AdspHBw14OyvF11AJyg4SEMe8mT73YYKPxnhb8o45HhtT39EJizar7QagJKU6EfaAl9omDFTT
	LYgKPBWjKzXAOSnZkJsPK9k5OupH1qL/17zMMCpvD3s0gFHRQGkttXkaNHwsKNWN1EnLPTS+Qh/Xa
	RNN0z2jnznXwenWmPx7rYVsCZHnr3I0/ffIxiy07qJbxuYqH5pdMmROr2N4lfXZW3adMIrki+PNy1
	cqlVHpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtSw-00000000q7z-2Ucy;
	Wed, 06 Mar 2024 15:45:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtSt-00000000q5q-1H1O
	for ath11k@lists.infradead.org;
	Wed, 06 Mar 2024 15:45:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 426CGdeF025716;
	Wed, 6 Mar 2024 15:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ZriVnAkAbNTgRPbl8ful3yh9KHAVXDxhg+h2EDfcoAE=; b=dz
	NKKK9lbpzOOWFHrRj08M8/DvG/FQRnX6/CVpyRblQO7wNaddq5/my54b1YrNzG9v
	3wM9I+gH9lJPCYqycJfxbqAiVjtO0oBkFEFohnA1Faz2CsKvI1DkflFj5Zxd6L4I
	/KWGbMK4A1v8Q1DSJDt5tzXn5LqiuHwrlB20UghNqR0SkWlWEnNi4gdlCqxz4NU2
	S8rOwlZ0yI0D9V/G5EyKzYFNHBUE2vUMVcNVxFZ1iiXeoTlVAtjhj1hJdWB78xtI
	4GXQ2uG3OeKyYfmFaK/W/ROiXuoak+EHhgohPyygJDl1x2IU0iGWS1RNGI/fPFma
	sGuq9uxLUja2vcYpLNIQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpmu8rwjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 15:45:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 426FjmiE003729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 15:45:48 GMT
Received: from [10.110.86.150] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Mar
 2024 07:45:47 -0800
Message-ID: <c967dfb5-03c0-4871-95ad-84ea8728c6ce@quicinc.com>
Date: Wed, 6 Mar 2024 07:45:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: adjust a comment to reflect reality
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Kevin Lo <kevlo@kevlo.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <ZeWEqGVibkMg2APi@ns.kevlo.org> <87le6vhgdg.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87le6vhgdg.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L1Gv-fVlc-suDaHt93KH1v__P5lue00G
X-Proofpoint-ORIG-GUID: L1Gv-fVlc-suDaHt93KH1v__P5lue00G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_10,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=754 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_074555_395908_84F916E0 
X-CRM114-Status: UNSURE (   8.31  )
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

On 3/6/2024 1:14 AM, Kalle Valo wrote:
> Kevin Lo <kevlo@kevlo.org> writes:
> 
>> On QCA6390/QCN9074/WCN6855, MHISTATUS may still have SYSERR bit set
>> after SOC_GLOBAL_RESET.
>>
>> changes for v2:
>> - update comment about resetting MHICTRL to clear SYSERR
>>
>> Signed-off-by: Kevin Lo <kevlo@kevlo.org>
> 
> This didn't apply and I manually edited the patch. I also removed the
> changelog from the commit message, please check my changes:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=709cd1c88a11bc1969cf573575b0a2027e720146
> 
LGTM

