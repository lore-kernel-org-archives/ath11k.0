Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45796E69184
	for <ath11k@archiver.kernel.org>; Fri, 22 Nov 2024 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIFNUXhV8Frt3yTJBPWBiMNQGir7w1PbwWwVOd6XPq4=; b=GY2V2JZJPQoGH9xrVEusSFd0V/
	/bbl7wHmAZoJ0aopdnAxQRKlhVQim70oSz80ObDwZtxYnWmlbk9y5qaLQbmgSfyqEUFXuX9XSXck1
	a6YFmmp7tDkkmhi8zH0DgYyECLLCZvZl/XV5YWJlCjwSr8WMAgecm+eiVe4q7jB39ZLOdwj52UWJW
	mOqCv72rCiPalo0f128dvx7rj2x0s53QFWRme08N7fHY5MMwJpG6URBl5KTY+D7W1aYQyzViBhFXo
	BT10wTFMTVOeQaq1vZpNqqD0hBzPp14cVvXPiLbM9ItlR3QyuHKPyf0Q3t6N8oWk0b+x1X+gI5oS4
	q3HgALXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWhp-00000002sCq-2wOi;
	Fri, 22 Nov 2024 16:40:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWhm-00000002sCR-3hap
	for ath11k@lists.infradead.org;
	Fri, 22 Nov 2024 16:40:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM9KW4w019415;
	Fri, 22 Nov 2024 16:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIFNUXhV8Frt3yTJBPWBiMNQGir7w1PbwWwVOd6XPq4=; b=XllhSyuF+aRPDPHD
	6ipKrYpj1hk/57j1vhe5Joc7qtO+X5ukjYWwV+LQpfMzAx1pe/5cyRE7nFOYxtnz
	W069HP4tKw4EdSX6i9LNUv8bF9I4lFaMzZhiYVsho8WDzdMjHmihQ3dup8Fc5j3A
	qQox24p9jtEyTaSvcPzTcctRv3BZzYoeBdk3OlTqsVCuc1rL5a5MeS30GLA0ispf
	cQHJ7lptqqMuwrAW71lR03w2woNreCBtyLVwEW0Ih1aTQ5vIlmlyK865ZO1l0C6l
	CWBbcxM0ertgLQCQm9hKbTk3KdL8FPwJe5XpWR6I88M9uz2opp2yhB0xC8yLyIVM
	zEk8sA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431sv2nstx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 16:40:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMGeL7o029014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 16:40:21 GMT
Received: from [10.111.176.168] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 22 Nov
 2024 08:40:21 -0800
Message-ID: <872fd68a-b484-46b0-803d-9a6ceb823931@quicinc.com>
Date: Fri, 22 Nov 2024 08:40:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] [PATCH 00/13] ath1{1,2}k: support multiple PCI devices in
 one system
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Mihai Moldovan <ionic@ionic.de>, <ath11k@lists.infradead.org>
References: <cover.1731858971.git.ionic@ionic.de>
 <4c5a9c95-13a3-440a-9947-a11209876c0b@ionic.de>
 <6b9c0664-f58a-4978-a371-741c6e6eb133@quicinc.com>
Content-Language: en-US
In-Reply-To: <6b9c0664-f58a-4978-a371-741c6e6eb133@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u1H4I_9SZXIc1in4t9XHokNuOm68v3yI
X-Proofpoint-ORIG-GUID: u1H4I_9SZXIc1in4t9XHokNuOm68v3yI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=751 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_084027_047877_1275D705 
X-CRM114-Status: GOOD (  11.75  )
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

On 11/18/2024 7:52 AM, Jeff Johnson wrote:
> On 11/17/2024 8:59 AM, Mihai Moldovan wrote:
>> Just some spelling fixes I'll stage for a v2, since mistakes naturally only 
>> become obvious after reading what was sent out...
>>
>>
>> * On 11/17/24 17:05, Mihai Moldovan wrote:
>>> [...]
>>> socket and bound to for client sockets, which will automatically filter
>>> messages from other endpoints and also make sure that messages clients
>>> send are routed to the correct endpoint.
>>
>> [...] and also make sure that client messages are routed to the correct endpoint.
>>
>>
>>> [...]
>>> and additionally new API is introduced so that other parts in the kernel
>>> can either get an endpoint ID for given endpoint-specific data or even
>>> register endpoint-specific with a new endpoint ID that is generated by
>>> the QRTR driver. [...]
>>
>> [...] or even attach endpoint-specific data to a new endpoint ID generated by 
>> the QRTR driver.
>>
>>
>>
>> Mihai
> 
> When you post v2, please use scripts/get_maintainer.pl to identify all of the
> maintainers and mailing lists that should be notified of this RFC.
> 
> I suspect you won't get much feedback without doing so.

The sooner you post a v2 and include all of the right people and lists, the
sooner the chances of getting good feedback. From internal WLAN team
discussion the concept is good, but the implementation is not ideal. Hopefully
pulling in the actual QRTR & MHI developers and maintainer will lead to a
cleaner and acceptable solution.

/jeff




